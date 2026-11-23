;;;; tokyo-night.lisp --- The Tokyo Night themes, night and light.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette and syntax roles: enkia/tokyo-night-vscode-theme. See NOTICE.

(in-package #:themes)

(define-colour-theme tokyo-night
  "Tokyo Night: a deep indigo ground with violet, blue, cyan and green accents."
  :italic-comments t
  :colours ((bg "#1a1b26") (bg-dark "#16161e") (bg-line "#1e202e") (fg "#a9b1d6") (fg-bright "#c0caf5")
            (comment "#51597d") (status "#787c99") (line-number "#363b54") (selection-base "#515c7e")
            (find-match "#3d59a1") (red "#f7768e") (orange "#ff9e64") (yellow "#e0af68") (green "#9ece6a")
            (teal "#73daca") (cyan "#7dcfff") (blue "#7aa2f7") (magenta "#bb9af7") (purple "#9d7cd8")
            (class "#0db9d7") (operator "#89ddff") (regex "#b4f9f8") (punct "#9abdf5"))
  :roles ((ground bg) (ground-dim bg-dark) (active-ground line-number) (current-line bg-line)
          (text fg) (text-alt fg-bright) (comment comment) (divider line-number) (whitespace line-number)
          (red red) (orange orange) (yellow yellow) (green green) (blue blue) (blue-cooler cyan)
          (blue-warmer magenta) (magenta magenta) (magenta-faint purple) (brown teal) (link blue)
          (mode-line-ground find-match) (mode-line-text fg-bright) (mode-line-directory regex)
          (mode-line-inactive-ground bg-dark) (mode-line-inactive-text status)
          (selection (mix bg selection-base 0.45)) (selection-text fg-bright)
          (selection-secondary (mix bg selection-base 0.25)) (search-ground find-match)
          (search-text fg-bright) (search-other-ground (mix bg find-match 0.5)) (highlight-text fg-bright)
          (cursor fg-bright) (paren-ground bg-dark) (line-number-current status)
          (syn-keyword magenta) (syn-string green) (syn-function blue) (syn-type class) (syn-constant orange)
          (syn-builtin class) (syn-variable fg-bright) (syn-property cyan) (syn-operator operator)
          (syn-punctuation punct) (syn-escape operator) (syn-tag red) (syn-attribute magenta)
          (syn-parameter yellow) (syn-regexp regex) (syn-namespace fg-bright)))

(define-colour-theme tokyo-night-light
  "Tokyo Night Light: the same palette on a pale grey-lavender ground."
  :italic-comments t
  :colours ((bg "#e6e7ed") (bg-dark "#d6d8df") (bg-line "#dcdee3") (fg "#343b59") (comment "#888b94")
            (status "#363c4d") (line-number "#9da0ab") (selection-base "#acb0bf") (find-match "#2d9c91")
            (red "#8c4351") (orange "#965027") (yellow "#8f5e15") (green "#385f0d") (cyan "#0f4b6e")
            (blue "#2959aa") (magenta "#65359d") (class "#006c86") (regex "#3e6968") (bracket-match "#cdced1"))
  :roles ((ground bg) (ground-dim bg-dark) (active-ground bracket-match) (current-line bg-line)
          (text fg) (text-alt status) (comment comment) (divider line-number) (whitespace bracket-match)
          (red red) (orange orange) (yellow yellow) (green green) (blue blue) (blue-cooler class)
          (blue-warmer magenta) (magenta magenta) (magenta-faint magenta) (brown regex) (link blue)
          (mode-line-ground bg-dark) (mode-line-text status) (mode-line-directory blue)
          (mode-line-inactive-ground bg-line) (mode-line-inactive-text status)
          (completion-ground bg-dark) (selection (mix bg selection-base 0.6)) (selection-text fg)
          (selection-secondary (mix bg selection-base 0.3)) (search-ground (mix bg find-match 0.35))
          (search-text fg) (search-other-ground (mix bg find-match 0.18)) (highlight-text fg)
          (cursor status) (paren-ground bracket-match) (line-number-current status)
          (syn-keyword magenta) (syn-string green) (syn-function blue) (syn-type class) (syn-constant orange)
          (syn-builtin class) (syn-variable fg) (syn-property cyan) (syn-operator class)
          (syn-punctuation fg) (syn-escape status) (syn-tag red) (syn-attribute magenta)
          (syn-parameter yellow) (syn-regexp regex) (syn-namespace fg)))
