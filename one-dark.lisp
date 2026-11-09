;;;; one-dark.lisp --- The One Dark theme.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette and syntax roles: joshdick/onedark.vim, which has a dark variant only. See NOTICE.

(in-package #:themes)

(define-colour-theme one-dark
  "One Dark, from Atom: a slate ground with soft red, green, yellow, blue, purple and cyan."
  :italic-comments t
  :colours ((red "#e06c75") (dark-red "#be5046") (green "#98c379") (yellow "#e5c07b") (dark-yellow "#d19a66")
            (blue "#61afef") (purple "#c678dd") (cyan "#56b6c2") (white "#abb2bf") (black "#282c34")
            (comment-grey "#5c6370") (gutter-grey "#4b5263") (cursor-grey "#2c323c") (visual-grey "#3e4452")
            (special-grey "#3b4048"))
  :roles ((ground black) (ground-dim cursor-grey) (active-ground visual-grey) (current-line cursor-grey)
          (text white) (text-alt white) (comment comment-grey) (divider visual-grey) (whitespace special-grey)
          (red red) (orange dark-yellow) (yellow yellow) (green green) (blue blue) (blue-cooler cyan)
          (blue-warmer blue) (magenta purple) (magenta-faint purple) (brown dark-red) (link blue)
          (mode-line-ground visual-grey) (mode-line-text white) (mode-line-directory cyan)
          (mode-line-inactive-ground cursor-grey) (mode-line-inactive-text white)
          (completion-ground visual-grey) (selection visual-grey) (selection-text white)
          (selection-secondary special-grey) (search-ground yellow) (search-text black)
          (search-other-ground special-grey) (highlight-text white) (cursor blue)
          (paren-ground black) (line-number-current white)
          (syn-keyword purple) (syn-string green) (syn-function blue) (syn-type yellow) (syn-constant cyan)
          (syn-number dark-yellow) (syn-builtin cyan) (syn-variable red) (syn-property red)
          (syn-operator purple) (syn-punctuation white) (syn-escape cyan) (syn-tag red)
          (syn-attribute dark-yellow) (syn-parameter red) (syn-label purple) (syn-preprocessor yellow)
          (syn-constructor yellow) (syn-regexp cyan) (syn-macro purple) (syn-namespace yellow)))
