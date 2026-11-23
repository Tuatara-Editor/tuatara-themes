;;;; rose-pine.lisp --- The Rose Pine themes, main and dawn.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette and syntax roles: rose-pine/neovim. Moon is not included. See NOTICE.

(in-package #:themes)

(define-colour-theme rose-pine
  "Rose Pine: soft, low-light colours on a dark plum ground."
  :italic-comments t
  :colours ((nc "#16141f") (base "#191724") (surface "#1f1d2e") (overlay "#26233a") (muted "#6e6a86")
            (subtle "#908caa") (text "#e0def4") (love "#eb6f92") (gold "#f6c177") (rose "#ebbcba")
            (pine "#31748f") (foam "#9ccfd8") (iris "#c4a7e7") (highlight-low "#21202e")
            (highlight-med "#403d52") (highlight-high "#524f67"))
  :roles ((ground base) (ground-dim surface) (active-ground highlight-med) (current-line overlay)
          (text text) (text-alt text) (comment subtle) (divider highlight-high) (whitespace highlight-med)
          (red love) (orange rose) (yellow gold) (green foam) (blue pine) (blue-cooler foam)
          (blue-warmer iris) (magenta iris) (magenta-faint rose) (brown rose) (link iris)
          (mode-line-ground highlight-med) (mode-line-text text) (mode-line-directory foam)
          (mode-line-inactive-ground surface) (mode-line-inactive-text subtle)
          (completion-ground highlight-med) (selection (mix base iris 0.25)) (selection-text text)
          (selection-secondary highlight-low) (search-ground (mix base gold 0.35)) (search-text text)
          (search-other-ground (mix base gold 0.15)) (highlight-text text) (cursor foam)
          (paren-ground (mix base pine 0.3)) (line-number-current text)
          (syn-keyword pine) (syn-string gold) (syn-function rose) (syn-type foam) (syn-constant gold)
          (syn-builtin rose) (syn-variable text) (syn-property foam) (syn-operator subtle)
          (syn-punctuation subtle) (syn-escape pine) (syn-tag foam) (syn-attribute iris)
          (syn-parameter iris) (syn-regexp iris) (syn-namespace text)))

(define-colour-theme rose-pine-dawn
  "Rose Pine Dawn: the same colours on a warm, light parchment ground."
  :italic-comments t
  :colours ((nc "#f8f0e7") (base "#faf4ed") (surface "#fffaf3") (overlay "#f2e9e1") (muted "#9893a5")
            (subtle "#797593") (text "#464261") (love "#b4637a") (gold "#ea9d34") (rose "#d7827e")
            (pine "#286983") (foam "#56949f") (iris "#907aa9") (highlight-low "#f4ede8")
            (highlight-med "#dfdad9") (highlight-high "#cecacd"))
  :roles ((ground base) (ground-dim surface) (active-ground highlight-med) (current-line overlay)
          (text text) (text-alt text) (comment subtle) (divider highlight-high) (whitespace highlight-med)
          (red love) (orange rose) (yellow gold) (green foam) (blue pine) (blue-cooler foam)
          (blue-warmer iris) (magenta iris) (magenta-faint rose) (brown rose) (link pine)
          (mode-line-ground highlight-med) (mode-line-text text) (mode-line-directory pine)
          (mode-line-inactive-ground overlay) (mode-line-inactive-text subtle)
          (completion-ground highlight-med) (selection (mix base iris 0.25)) (selection-text text)
          (selection-secondary highlight-low) (search-ground (mix base gold 0.4)) (search-text text)
          (search-other-ground (mix base gold 0.18)) (highlight-text text) (cursor pine)
          (paren-ground (mix base pine 0.2)) (line-number-current text)
          (syn-keyword pine) (syn-string gold) (syn-function rose) (syn-type foam) (syn-constant gold)
          (syn-builtin rose) (syn-variable text) (syn-property foam) (syn-operator subtle)
          (syn-punctuation subtle) (syn-escape pine) (syn-tag foam) (syn-attribute iris)
          (syn-parameter iris) (syn-regexp iris) (syn-namespace text)))
