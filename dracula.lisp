;;;; dracula.lisp --- The Dracula theme.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette and syntax roles: dracula/vim. Dracula has no light variant. See NOTICE.

(in-package #:themes)

(define-colour-theme dracula
  "Dracula: a dark purple-grey ground with pink, purple, green and cyan accents."
  :colours ((fg "#f8f8f2") (bglighter "#424450") (bglight "#343746") (bg "#282a36") (bgdark "#21222c")
            (bgdarker "#191a21") (comment "#6272a4") (selection "#44475a") (cyan "#8be9fd") (green "#50fa7b")
            (orange "#ffb86c") (pink "#ff79c6") (purple "#bd93f9") (red "#ff5555") (yellow "#f1fa8c"))
  :roles ((ground bg) (ground-dim bgdark) (active-ground bglight) (current-line bglighter)
          (text fg) (text-alt fg) (comment comment) (divider comment) (whitespace bglighter)
          (red red) (orange orange) (yellow yellow) (green green) (blue purple) (blue-cooler cyan)
          (blue-warmer purple) (magenta pink) (magenta-faint purple) (brown orange) (link cyan)
          (mode-line-ground bglighter) (mode-line-text fg) (mode-line-directory cyan)
          (mode-line-inactive-ground bgdark) (mode-line-inactive-text fg)
          (completion-ground selection) (selection selection) (selection-text fg)
          (selection-secondary bglighter) (search-ground green) (search-text bg)
          (search-other-ground bglighter) (highlight-text fg) (cursor green)
          (paren-ground bg) (line-number-current yellow)
          (syn-keyword pink) (syn-string yellow) (syn-function green) (syn-type cyan) (syn-constant purple)
          (syn-builtin cyan) (syn-variable fg) (syn-property fg) (syn-operator pink) (syn-punctuation fg)
          (syn-escape pink) (syn-tag cyan) (syn-attribute green) (syn-parameter orange)
          (syn-label purple) (syn-preprocessor pink) (syn-constructor cyan) (syn-regexp red)
          (syn-macro green) (syn-namespace cyan)))
