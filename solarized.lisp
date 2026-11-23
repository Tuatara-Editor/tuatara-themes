;;;; solarized.lisp --- The Solarized themes, dark and light.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette: altercation/vim-colors-solarized, green as altercation/solarized
;;;; gives it. Syntax roles as in the vim port. See NOTICE.

(in-package #:themes)

(define-colour-theme solarized-dark
  "Solarized Dark: Ethan Schoonover's balanced palette on a deep teal ground."
  :italic-comments t
  :colours ((base03 "#002b36") (base02 "#073642") (base01 "#586e75") (base00 "#657b83") (base0 "#839496")
            (base1 "#93a1a1") (base2 "#eee8d5") (base3 "#fdf6e3") (yellow "#b58900") (orange "#cb4b16")
            (red "#dc322f") (magenta "#d33682") (violet "#6c71c4") (blue "#268bd2") (cyan "#2aa198")
            (green "#859900"))
  :roles ((ground base03) (ground-dim base02) (active-ground base02) (current-line base02)
          (text base1) (text-alt base2) (comment base01) (divider base01) (whitespace base02)
          (red red) (orange orange) (yellow yellow) (green green) (blue blue) (blue-cooler cyan)
          (blue-warmer violet) (magenta magenta) (magenta-faint violet) (brown orange) (link blue)
          (mode-line-ground base1) (mode-line-text base02) (mode-line-directory base03)
          (mode-line-inactive-ground base02) (mode-line-inactive-text base00)
          (completion-ground base02) (selection base01) (selection-text base3)
          (selection-secondary base02) (search-ground yellow) (search-text base03)
          (search-other-ground (mix base03 yellow 0.35)) (highlight-text base1) (cursor base3)
          (paren-ground base02) (line-number-current base1)
          (syn-keyword green) (syn-string cyan) (syn-function blue) (syn-type yellow) (syn-constant cyan)
          (syn-builtin orange) (syn-variable base1) (syn-property blue) (syn-operator green)
          (syn-punctuation base1) (syn-escape red) (syn-tag blue) (syn-attribute yellow)
          (syn-preprocessor orange) (syn-regexp red) (syn-macro orange)))

(define-colour-theme solarized-light
  "Solarized Light: Ethan Schoonover's balanced palette on a warm cream ground."
  :italic-comments t
  :colours ((base03 "#002b36") (base02 "#073642") (base01 "#586e75") (base00 "#657b83") (base0 "#839496")
            (base1 "#93a1a1") (base2 "#eee8d5") (base3 "#fdf6e3") (yellow "#b58900") (orange "#cb4b16")
            (red "#dc322f") (magenta "#d33682") (violet "#6c71c4") (blue "#268bd2") (cyan "#2aa198")
            (green "#859900"))
  :roles ((ground base3) (ground-dim base2) (active-ground base2) (current-line base2)
          (text base01) (text-alt base02) (comment base1) (divider base1) (whitespace base2)
          (red red) (orange orange) (yellow yellow) (green green) (blue blue) (blue-cooler cyan)
          (blue-warmer violet) (magenta magenta) (magenta-faint violet) (brown orange) (link blue)
          (mode-line-ground base01) (mode-line-text base2) (mode-line-directory base3)
          (mode-line-inactive-ground base2) (mode-line-inactive-text base01)
          (completion-ground base2) (selection base1) (selection-text base03)
          (selection-secondary base2) (search-ground yellow) (search-text base03)
          (search-other-ground (mix base3 yellow 0.35)) (highlight-text base01) (cursor base03)
          (paren-ground base2) (line-number-current base01)
          (syn-keyword green) (syn-string cyan) (syn-function blue) (syn-type yellow) (syn-constant cyan)
          (syn-builtin orange) (syn-variable base01) (syn-property blue) (syn-operator green)
          (syn-punctuation base01) (syn-escape red) (syn-tag blue) (syn-attribute yellow)
          (syn-preprocessor orange) (syn-regexp red) (syn-macro orange)))
