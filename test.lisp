;;;; test.lisp --- The themes package: popular colour themes that cover every face and read well.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; The checks read the themes through Tuatara's theme functions, which a
;;;; package's own files may not use; the tests are not part of the package.

(in-package #:tuatara.tests)

(define-test themes
  :description "The themes package: every theme loads, sets every role ao-dark sets with a valid colour,
reads well (WCAG contrast of text, comments, selection, mode line and search), and no colour is named
outside the theme definitions.")

(defparameter *themes-root* (make-pathname :name nil :type nil :defaults *load-truename*)
  "The directory of the themes package: its files are read to check where colours are written.")

(defparameter *theme-names*
  '(catppuccin-mocha catppuccin-latte dracula nord one-dark solarized-dark solarized-light
    tokyo-night tokyo-night-light rose-pine rose-pine-dawn everforest-dark everforest-light kanagawa-wave)
  "Every theme the package defines, as README.md lists them.")

(defparameter *theme-files*
  '("catppuccin" "dracula" "nord" "one-dark" "solarized" "tokyo-night" "rose-pine" "everforest" "kanagawa")
  "The package's files that hold theme definitions, the only ones that may write colours.")

(defparameter *low-comments*
  '((solarized-dark 2.5 "Solarized sets comments quiet on purpose: base01 on base03")
    (solarized-light 2.5 "Solarized sets comments quiet on purpose: base1 on base3, nudged to 2.5:1")
    (tokyo-night 2.5 "Tokyo Night's own comment colour is quiet")
    (tokyo-night-light 2.5 "Tokyo Night Light's own comment colour is quiet")
    (everforest-light 2.5 "Everforest Light's own grey1 comment colour is quiet")
    (one-dark 2.5 "One Dark's own comment grey is quiet, nudged to 2.5:1")
    (nord 2.5 "Nord's own brightened comment colour is quiet, nudged to 2.5:1"))
  "Themes whose comment colour is below 3:1 against the ground, each with the least ratio allowed and why.
The theme author's choice is kept, moved only as far as 2.5:1.")

(defun theme-of (name)
  "The theme called NAME."
  (tuatara.display:find-theme name))

(defun role-hex (theme role)
  "The colour #rrggbb ROLE stands for in THEME."
  (tuatara.display:theme-role-colour theme role))

(defun channel-light (c)
  "The linear light of an sRGB channel C, 0 to 255."
  (let ((s (/ c 255d0)))
    (if (<= s 0.03928d0) (/ s 12.92d0) (expt (/ (+ s 0.055d0) 1.055d0) 2.4d0))))

(defun wcag-contrast (a b)
  "The WCAG contrast ratio of the colours A and B, strings #rrggbb, worked out here from the definition."
  (flet ((luminance (hex)
           (let ((r (parse-integer hex :start 1 :end 3 :radix 16))
                 (g (parse-integer hex :start 3 :end 5 :radix 16))
                 (b (parse-integer hex :start 5 :end 7 :radix 16)))
             (+ (* 0.2126d0 (channel-light r)) (* 0.7152d0 (channel-light g)) (* 0.0722d0 (channel-light b))))))
    (let ((la (luminance a)) (lb (luminance b)))
      (/ (+ (max la lb) 0.05d0) (+ (min la lb) 0.05d0)))))

(defun hex-colour-p (value)
  "True when VALUE is a string #rrggbb."
  (and (stringp value) (= (length value) 7) (char= (char value 0) #\#)
       (every (lambda (c) (digit-char-p c 16)) (subseq value 1))))

(defun role-names-in (theme)
  "The names of the roles THEME's face settings use, as strings."
  (let ((names '()))
    (dolist (setting (tuatara.display:theme-settings theme) names)
      (loop for (key value) on (cdr setting) by #'cddr
            when (and (member key '(:fg :bg :underline-colour)) (tuatara.display:role-p value))
              do (pushnew (symbol-name value) names :test #'string=)))))

(defun own-palette-names (theme)
  "The names of the roles THEME's own palette gives, as strings."
  (mapcar (lambda (entry) (symbol-name (first entry))) (tuatara.display:theme-palette theme)))

(defun theme-colour-faces (theme-name)
  "The faces that have a keyword colour (a terminal colour name) as foreground or background with THEME-NAME in
force, as a sorted list of names."
  (let ((before tuatara.display:*current-theme*) (found '()))
    (unwind-protect
         (progn (tuatara.display:apply-theme theme-name)
                (maphash (lambda (name face)
                           (when (or (keywordp (tuatara.display:face-fg face))
                                     (keywordp (tuatara.display:face-bg face)))
                             (push name found)))
                         tuatara.display::*faces*))
      (tuatara.display:apply-theme before))
    (sort found #'string<)))

(define-test (themes loads)
  ;; every theme is defined, and putting it in force works and names it
  (dolist (name *theme-names*)
    (let ((before tuatara.display:*current-theme*))
      (unwind-protect
           (progn (true (theme-of name) "~a is not a theme" name)
                  (is string= (symbol-name name) (symbol-name (tuatara.display:apply-theme name))))
        (tuatara.display:apply-theme before))))
  (true (subsetp (mapcar #'symbol-name *theme-names*) (mapcar #'symbol-name (tuatara.display:theme-names))
                 :test #'string=))
  ;; (load-theme 'NAME) in the init file puts it in force
  (let ((before tuatara.display:*current-theme*) (tuatara.defaults::*theme-chosen* nil))
    (unwind-protect
         (dolist (name *theme-names*)
           (tuatara-user:load-theme name)
           (is string= (symbol-name name) (symbol-name tuatara.display:*current-theme*)))
      (tuatara.display:apply-theme before))))

(define-test (themes roles)
  ;; every role ao-dark sets is in the theme's own palette, as a colour #rrggbb
  (let ((wanted (role-names-in (theme-of 'ao-dark))))
    (true (> (length wanted) 40))
    (dolist (name *theme-names*)
      (let* ((theme (theme-of name)) (own (own-palette-names theme)))
        (dolist (role wanted)
          (true (member role own :test #'string-equal) "~a leaves out the role ~a" name role))
        (dolist (entry (tuatara.display:theme-palette theme))
          (true (hex-colour-p (second entry)) "~a: ~a is ~s, not a colour" name (first entry) (second entry)))))))

(define-test (themes faces)
  ;; a theme leaves no more faces on terminal colour names than ao-dark does
  (let ((base (theme-colour-faces 'ao-dark)))
    (dolist (name *theme-names*)
      (let ((left (set-difference (theme-colour-faces name) base)))
        (false left "~a leaves ~a on terminal colours" name left))))
  ;; the syntax faces take their colours from the roles, not from ao-dark's
  (let ((before tuatara.display:*current-theme*))
    (unwind-protect
         (dolist (name *theme-names*)
           (tuatara.display:apply-theme name)
           (let ((theme (theme-of name)))
             (is string= (role-hex theme 'syn-keyword) (tuatara.display:face-fg (tuatara.display:find-face :keyword)))
             (is string= (role-hex theme 'syn-string) (tuatara.display:face-fg (tuatara.display:find-face :string)))
             (is string= (role-hex theme 'ground) (tuatara.display:face-bg (tuatara.display:find-face :default)))))
      (tuatara.display:apply-theme before))))

(defparameter *text-pairs*
  '((text ground) (text-alt ground) (link ground) (text current-line) (text active-ground)
    (text completion-ground) (text ground-dim) (text match-ground) (text error-ground) (text split-ground)
    (text-alt active-ground) (selection-text selection) (selection-text selection-secondary)
    (mode-line-text mode-line-ground) (search-text search-ground) (highlight-text search-other-ground)
    (highlight-text error-ground))
  "Pairs of roles, text and its ground, that must read at 4.5:1 or better.")

(defparameter *secondary-pairs*
  '((text-dim ground) (text-dim ground-dim) (text-dim completion-ground) (red ground) (orange ground)
    (yellow ground) (green ground) (blue ground) (blue-cooler ground) (blue-warmer ground) (magenta ground)
    (magenta-faint ground) (brown ground) (added ground) (removed ground) (changed ground)
    (syn-keyword ground) (syn-string ground) (syn-function ground) (syn-type ground) (syn-constant ground)
    (syn-number ground) (syn-builtin ground) (syn-variable ground) (syn-property ground)
    (syn-operator ground) (syn-punctuation ground) (syn-escape ground) (syn-tag ground)
    (syn-attribute ground) (syn-parameter ground) (syn-label ground) (syn-preprocessor ground)
    (syn-constructor ground) (syn-regexp ground) (syn-macro ground) (syn-namespace ground)
    (added added-ground) (removed removed-ground) (cursor paren-ground)
    (mode-line-directory mode-line-ground) (mode-line-inactive-text mode-line-inactive-ground)
    (line-number-current line-number-current-ground)
    (ground yellow) (ground red) (ground orange) (ground blue))
  "Pairs of roles, a smaller part of the screen and its ground, that must read at 3:1 or better.")

(defun contrast-failures (name)
  "The pairs of roles of theme NAME that fall short of their least contrast, as strings: 4.5 for text and 3 for
the rest, a comment's the least *LOW-COMMENTS* allows for NAME."
  (let ((theme (theme-of name)) (failures '()))
    (flet ((check (pairs least)
             (dolist (pair pairs)
               (let ((ratio (wcag-contrast (role-hex theme (first pair)) (role-hex theme (second pair)))))
                 (when (< ratio least)
                   (push (format nil "~(~a~): ~(~a~) on ~(~a~) is ~,2f, below ~a"
                                 name (first pair) (second pair) ratio least)
                         failures))))))
      (check *text-pairs* 4.5)
      (check *secondary-pairs* 3)
      (check '((comment ground)) (or (second (assoc name *low-comments*)) 3)))
    (nreverse failures)))

(define-test (themes contrast)
  ;; text reads at 4.5:1, comments and the smaller roles at 3:1, a low comment only where its author chose it
  (dolist (name *theme-names*)
    (let ((failures (contrast-failures name)))
      (false failures "~{~a~^~%~}" failures)))
  ;; a comment below 3:1 is listed, with its reason, and is not listed needlessly
  (dolist (entry *low-comments*)
    (let* ((theme (theme-of (first entry)))
           (ratio (wcag-contrast (role-hex theme 'comment) (role-hex theme 'ground))))
      (true (stringp (third entry)))
      (true (< ratio 3) "~a: the comment is ~,2f, no need to list it" (first entry) ratio)
      (true (>= ratio (second entry))))))

(define-test (themes colours-only-in-definitions)
  ;; no colour is written outside the theme files: no #rrggbb in themes.lisp, a theme's roles or this package's
  ;; other code, and no terminal colour name given to a face
  (let ((hex (cl-ppcre:create-scanner "#[0-9a-fA-F]{6}\\b"))
        (names (cl-ppcre:create-scanner
                ":(?:fg|bg)\\s+:(?:black|red|green|yellow|blue|magenta|cyan|white|bright-[a-z]+)\\b")))
    (flet ((text (file) (uiop:read-file-string (merge-pathnames file *themes-root*))))
      (true (not (cl-ppcre:scan hex (text "themes.lisp"))) "themes.lisp writes a colour")
      (true (not (cl-ppcre:scan names (text "themes.lisp"))) "themes.lisp names a terminal colour")
      (dolist (file *theme-files*)
        (let* ((source (text (format nil "~a.lisp" file)))
               (roles (loop for start = (search ":roles" source) then (search ":roles" source :start2 (1+ start))
                            while start collect (subseq source start
                                                        (or (search "(define-colour-theme" source :start2 start)
                                                            (length source))))))
          (true roles "~a.lisp has no theme" file)
          (dolist (section roles)
            (true (not (cl-ppcre:scan hex section)) "~a.lisp writes a colour in its roles" file)
            (true (not (cl-ppcre:scan names section)) "~a.lisp names a terminal colour" file)))))))

(define-test (themes documented)
  ;; each theme is in the README under its name, and the source of its palette in NOTICE
  (let ((readme (uiop:read-file-string (merge-pathnames "README.md" *themes-root*))))
    (dolist (name *theme-names*)
      (true (search (format nil "`~(~a~)`" name) readme) "README.md does not name ~a" name)))
  (true (probe-file (merge-pathnames "NOTICE" *themes-root*))))

(define-test (themes colours-mixed-by-the-editor)
  ;; the package defines its themes and mixes their colours through the editor's names, not copies of them
  (let ((source (alexandria:read-file-into-string (merge-pathnames "themes.lisp" *themes-root*))))
    (false (search "tuatara-user:" source))
    (is eq 'tuatara.display:mix-colours (find-symbol "MIX-COLOURS" "THEMES"))
    (is eq 'tuatara.display:colour-hex (find-symbol "COLOUR-HEX" "THEMES"))))
