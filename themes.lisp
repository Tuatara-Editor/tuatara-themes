;;;; themes.lisp --- Popular colour themes for Tuatara: Catppuccin, Dracula, Nord and others.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;; Needs: Tuatara 0.90.28
;;;;
;;;; A package, not part of the editor: loaded by (load-package "themes") in the
;;;; init file. Each theme is chosen by (load-theme 'NAME) or M-x load-theme;
;;;; README.md lists the names and where each palette comes from.
;;;;
;;;; A theme here is its palette (:colours, as its project publishes it) and
;;;; the roles Tuatara's faces take from it (:roles). Faces are those of
;;;; ao-dark, so a theme covers everything that one does. This file holds no
;;;; colour: they are in the files of the themes.

(defpackage #:themes
  (:use #:cl #:tuatara)
  (:documentation "Popular colour themes, each a palette and the roles Tuatara's faces take from it."))

(in-package #:themes)

;;; Colour arithmetic, run while a theme is compiled: the colours are mixed by
;;; MIX-COLOURS and written by COLOUR-HEX, as the editor's own themes are.

(eval-when (:compile-toplevel :load-toplevel :execute)

  (defun relative-luminance (hex)
    "How bright the colour HEX, a string \"#rrggbb\", looks, from 0 (black) to 1 (white), as WCAG defines it."
    (destructuring-bind (r g b)
        (mapcar (lambda (c)
                  (let ((s (/ c 255d0)))
                    (if (<= s 0.03928d0) (/ s 12.92d0) (expt (/ (+ s 0.055d0) 1.055d0) 2.4d0))))
                (colour-components hex))
      (+ (* 0.2126d0 r) (* 0.7152d0 g) (* 0.0722d0 b))))

  (defun contrast-ratio (a b)
    "The WCAG contrast ratio, 1 to 21, between the colours A and B, both \"#rrggbb\"."
    (let ((la (relative-luminance a)) (lb (relative-luminance b)))
      (/ (+ (max la lb) 0.05d0) (+ (min la lb) 0.05d0))))

  (defun fit-contrast (colour grounds target)
    "COLOUR, moved toward white when it is lighter than the first of GROUNDS, toward black when it is darker,
only as far as its contrast with each of GROUNDS reaches TARGET; as it was when it already does."
    (let ((far (colour-hex (if (>= (relative-luminance colour) (relative-luminance (first grounds)))
                               '(255 255 255)
                               '(0 0 0)))))
      (loop for step from 0 to 20
            for candidate = (mix-colours colour far (/ step 20d0))
            when (every (lambda (ground) (>= (contrast-ratio candidate ground) target)) grounds) return candidate
            finally (return far))))

  (defparameter *fitted-roles*
    '((text 4.6 ground ground-dim current-line active-ground completion-ground match-ground error-ground
       split-ground)
      (text-alt 4.6 ground active-ground) (code 4.6 ground) (quote-text 4.6 ground) (link 4.6 ground)
      (selection-text 4.6 selection selection-secondary) (mode-line-text 4.6 mode-line-ground)
      (search-text 4.6 search-ground) (highlight-text 4.6 search-other-ground error-ground ground)
      (comment 2.5 ground)
      (text-dim 3.2 ground ground-dim completion-ground) (mode-line-inactive-text 3.2 mode-line-inactive-ground)
      (mode-line-directory 3.2 mode-line-ground) (line-number-current 3.2 line-number-current-ground ground)
      (cursor 3.2 paren-ground) (added 3.2 ground added-ground) (removed 3.2 ground removed-ground)
      (red 3.2 ground) (orange 3.2 ground) (yellow 3.2 ground) (green 3.2 ground) (blue 3.2 ground)
      (blue-cooler 3.2 ground) (blue-warmer 3.2 ground) (magenta 3.2 ground) (magenta-faint 3.2 ground)
      (brown 3.2 ground) (changed 3.2 ground) (syn-keyword 3.2 ground) (syn-string 3.2 ground)
      (syn-function 3.2 ground) (syn-type 3.2 ground) (syn-constant 3.2 ground) (syn-number 3.2 ground)
      (syn-builtin 3.2 ground) (syn-variable 3.2 ground) (syn-property 3.2 ground) (syn-operator 3.2 ground)
      (syn-punctuation 3.2 ground) (syn-escape 3.2 ground) (syn-tag 3.2 ground) (syn-attribute 3.2 ground)
      (syn-parameter 3.2 ground) (syn-label 3.2 ground) (syn-preprocessor 3.2 ground)
      (syn-constructor 3.2 ground) (syn-regexp 3.2 ground) (syn-macro 3.2 ground) (syn-namespace 3.2 ground))
    "Roles whose colour is moved, when the palette's own falls short, until it reads against the grounds it is
used on: each is (ROLE CONTRAST GROUND...). Text reaches 4.5, other words 3, and a comment is only kept from
falling below 2.5.")

  (defparameter *default-roles*
    '((code text) (quote-text text-alt) (text-alt text) (magenta-faint magenta) (brown orange) (link blue)
      (added green) (removed red) (changed yellow) (text-dim comment) (divider comment)
      (blue-cooler blue) (blue-warmer blue) (mode-line-directory blue-warmer) (cursor orange)
      (ground-dim active-ground) (current-line active-ground) (whitespace active-ground)
      (completion-ground active-ground) (selection-text text) (highlight-text text) (search-text ground)
      (selection-secondary (mix ground magenta 0.25)) (search-other-ground (mix ground blue 0.3))
      (match-ground (mix ground magenta 0.2)) (error-ground (mix ground red 0.25))
      (split-ground (mix ground blue 0.25)) (paren-ground active-ground)
      (added-ground (mix ground added 0.2)) (removed-ground (mix ground removed 0.2))
      (yellow-subtle (mix ground yellow 0.15)) (blue-subtle (mix ground blue 0.15))
      (teal-subtle (mix ground green 0.15))
      (line-number-current cursor) (line-number-current-ground ground)
      (mode-line-inactive-text text-dim) (mode-line-inactive-ground ground-dim)
      (syn-variable text) (syn-punctuation text) (syn-operator syn-punctuation) (syn-property syn-variable)
      (syn-number syn-constant) (syn-builtin syn-constant) (syn-label syn-constant)
      (syn-preprocessor syn-keyword) (syn-constructor syn-type) (syn-namespace syn-type)
      (syn-attribute syn-type) (syn-tag syn-keyword) (syn-parameter syn-variable)
      (syn-escape syn-constant) (syn-regexp syn-escape) (syn-macro syn-builtin))
    "What a role is when a theme does not say: another role, or a shade made from them, (mix A B AMOUNT).")

  (defparameter *syntax-faces*
    '((:keyword syn-keyword) (:function syn-function) (:type syn-type) (:constant syn-constant)
      (:number syn-number) (:builtin syn-builtin) (:string syn-string) (:escape syn-escape)
      (:variable syn-variable) (:property syn-property) (:operator syn-operator)
      (:punctuation syn-punctuation) (:tag syn-tag) (:attribute syn-attribute) (:label syn-label)
      (:preprocessor syn-preprocessor) (:constructor syn-constructor) (:string.regexp syn-regexp)
      (:variable.parameter syn-parameter) (:punctuation.bracket syn-punctuation)
      (:punctuation.special syn-operator) (:keyword.operator syn-operator)
      (:keyword.storage.modifier syn-keyword) (:function.method syn-function) (:function.macro syn-macro)
      (:function.special syn-builtin) (:namespace syn-namespace))
    "The syntax faces and the role each takes its colour from.")

  (defun resolve-role-spec (spec name colours roles &optional (depth 0))
    "The colour \"#rrggbb\" SPEC stands for in the theme NAME. SPEC is the name of a colour in COLOURS, else of a
role in ROLES (an alist of role and spec), or (mix A B AMOUNT) of two such names."
    (when (> depth 16) (error "Theme ~a: the roles lead round in a circle at ~a." name spec))
    (flet ((again (s) (resolve-role-spec s name colours roles (1+ depth))))
      (typecase spec
        (symbol (let ((colour (assoc (symbol-name spec) colours :key #'symbol-name :test #'string-equal))
                      (role (assoc (symbol-name spec) roles :key #'symbol-name :test #'string-equal)))
                  (cond ((and colour (stringp (second colour)) (colour-components (second colour)))
                         (second colour))
                        (colour (error "Theme ~a: ~s is not a colour written #rrggbb." name (second colour)))
                        (role (again (second role)))
                        (t (error "Theme ~a: ~a is neither a colour nor a role." name spec)))))
        (cons (if (string-equal (symbol-name (first spec)) "mix")
                  (mix-colours (again (second spec)) (again (third spec)) (fourth spec))
                  (error "Theme ~a: ~s is not a colour." name spec)))
        (t (error "Theme ~a: ~s is not a colour." name spec)))))

  (defun theme-palette-entries (name colours roles)
    "The palette of theme NAME as a list of (ROLE \"#rrggbb\"): the roles given, then the default ones left out, each
with its colour, and the roles of *FITTED-ROLES* moved where their contrast with their grounds needs it."
    (let ((all (append roles (remove-if (lambda (default) (assoc (symbol-name (first default)) roles
                                                                 :key #'symbol-name :test #'string-equal))
                                        *default-roles*))))
      (flet ((hex (role) (resolve-role-spec role name colours all)))
        (loop for (role) in all
              for fit = (assoc (symbol-name role) *fitted-roles* :key #'symbol-name :test #'string-equal)
              collect (list role (if fit
                                     (fit-contrast (hex role) (mapcar #'hex (cddr fit)) (second fit))
                                     (hex role))))))))

(defmacro define-colour-theme (name doc &key colours roles italic-comments)
  "Define the theme NAME, described by DOC. COLOURS is the palette as its project
publishes it, a list of (NAME \"#rrggbb\"). ROLES give each role Tuatara's faces
take, (ROLE COLOUR) with the name of a colour, another role, or (mix A B AMOUNT),
a colour AMOUNT of the way from A to B. The roles of ao-dark that are not given
are made from those that are (*DEFAULT-ROLES*), and the syntax roles, syn-keyword
and the rest, colour the syntax faces. ITALIC-COMMENTS is true for a theme whose
comments are italic."
  `(define-theme ,name ,doc
     :faces-from ao-dark
     :palette ,(theme-palette-entries name colours roles)
     ,@(mapcar (lambda (face) (list (first face) :fg (second face))) *syntax-faces*)
     (:mode-line-inactive :fg mode-line-inactive-text)
     ,@(when italic-comments '((:comment :italic t)))))

;;; The themes

(dolist (file '("catppuccin" "dracula" "nord" "one-dark" "solarized" "tokyo-night" "rose-pine" "everforest"
                "kanagawa"))
  (load-package-file (format nil "~a.lisp" file)))
