;;;; catppuccin.lisp --- The Catppuccin themes, Mocha and Latte.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette: catppuccin/palette. Syntax roles as in catppuccin/nvim. See NOTICE.

(in-package #:themes)

(define-colour-theme catppuccin-mocha
  "Catppuccin Mocha, the dark flavour: soft pastels on a deep violet-grey ground."
  :italic-comments t
  :colours ((rosewater "#f5e0dc") (flamingo "#f2cdcd") (pink "#f5c2e7") (mauve "#cba6f7") (red "#f38ba8")
            (maroon "#eba0ac") (peach "#fab387") (yellow "#f9e2af") (green "#a6e3a1") (teal "#94e2d5")
            (sky "#89dceb") (sapphire "#74c7ec") (blue "#89b4fa") (lavender "#b4befe") (text "#cdd6f4")
            (subtext1 "#bac2de") (subtext0 "#a6adc8") (overlay2 "#9399b2") (overlay1 "#7f849c")
            (overlay0 "#6c7086") (surface2 "#585b70") (surface1 "#45475a") (surface0 "#313244")
            (base "#1e1e2e") (mantle "#181825") (crust "#11111b"))
  :roles ((ground base) (ground-dim mantle) (active-ground surface1) (current-line surface0)
          (text text) (text-alt subtext1) (comment overlay2) (divider surface2) (whitespace surface1)
          (red red) (orange peach) (yellow yellow) (green green) (blue blue) (blue-cooler sapphire)
          (blue-warmer lavender) (magenta mauve) (magenta-faint pink) (brown flamingo) (link lavender)
          (mode-line-ground surface0) (mode-line-text text) (mode-line-directory lavender)
          (mode-line-inactive-ground mantle) (mode-line-inactive-text overlay1)
          (completion-ground surface1) (selection (mix base lavender 0.25)) (selection-text text)
          (selection-secondary (mix base mauve 0.2)) (search-ground red) (search-text mantle)
          (search-other-ground (mix base sky 0.3)) (highlight-text text) (cursor peach)
          (paren-ground surface1) (line-number-current lavender)
          (syn-keyword mauve) (syn-string green) (syn-function blue) (syn-type yellow) (syn-constant peach)
          (syn-builtin peach) (syn-variable text) (syn-property lavender) (syn-operator sky)
          (syn-punctuation overlay2) (syn-escape pink) (syn-tag blue) (syn-attribute peach)
          (syn-parameter maroon) (syn-label sapphire) (syn-preprocessor pink) (syn-constructor yellow)
          (syn-regexp pink) (syn-macro pink) (syn-namespace yellow)))

(define-colour-theme catppuccin-latte
  "Catppuccin Latte, the light flavour: the same pastels worked for a pale, cool ground."
  :italic-comments t
  :colours ((rosewater "#dc8a78") (flamingo "#dd7878") (pink "#ea76cb") (mauve "#8839ef") (red "#d20f39")
            (maroon "#e64553") (peach "#fe640b") (yellow "#df8e1d") (green "#40a02b") (teal "#179299")
            (sky "#04a5e5") (sapphire "#209fb5") (blue "#1e66f5") (lavender "#7287fd") (text "#4c4f69")
            (subtext1 "#5c5f77") (subtext0 "#6c6f85") (overlay2 "#7c7f93") (overlay1 "#8c8fa1")
            (overlay0 "#9ca0b0") (surface2 "#acb0be") (surface1 "#bcc0cc") (surface0 "#ccd0da")
            (base "#eff1f5") (mantle "#e6e9ef") (crust "#dce0e8"))
  :roles ((ground base) (ground-dim mantle) (active-ground surface0) (current-line mantle)
          (text text) (text-alt subtext1) (comment overlay2) (divider surface2) (whitespace surface1)
          (red red) (orange peach) (yellow yellow) (green green) (blue blue) (blue-cooler sapphire)
          (blue-warmer lavender) (magenta mauve) (magenta-faint pink) (brown flamingo) (link blue)
          (mode-line-ground surface0) (mode-line-text text) (mode-line-directory blue)
          (mode-line-inactive-ground mantle) (mode-line-inactive-text subtext0)
          (completion-ground surface0) (selection (mix base lavender 0.3)) (selection-text text)
          (selection-secondary (mix base mauve 0.2)) (search-ground (mix base red 0.35)) (search-text text)
          (search-other-ground (mix base sky 0.3)) (highlight-text text) (cursor peach)
          (paren-ground surface1) (line-number-current lavender)
          (syn-keyword mauve) (syn-string green) (syn-function blue) (syn-type yellow) (syn-constant peach)
          (syn-builtin peach) (syn-variable text) (syn-property lavender) (syn-operator sky)
          (syn-punctuation overlay2) (syn-escape pink) (syn-tag blue) (syn-attribute peach)
          (syn-parameter maroon) (syn-label sapphire) (syn-preprocessor pink) (syn-constructor yellow)
          (syn-regexp pink) (syn-macro pink) (syn-namespace yellow)))
