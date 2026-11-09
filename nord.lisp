;;;; nord.lisp --- The Nord theme.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette and syntax roles: nordtheme/vim. Nord has no light variant. See NOTICE.

(in-package #:themes)

(define-colour-theme nord
  "Nord: an arctic, blue-grey palette with frost blues and muted aurora accents."
  :colours ((nord0 "#2e3440") (nord1 "#3b4252") (nord2 "#434c5e") (nord3 "#4c566a") (nord3-bright "#616e88")
            (nord4 "#d8dee9") (nord5 "#e5e9f0") (nord6 "#eceff4") (nord7 "#8fbcbb") (nord8 "#88c0d0")
            (nord9 "#81a1c1") (nord10 "#5e81ac") (nord11 "#bf616a") (nord12 "#d08770") (nord13 "#ebcb8b")
            (nord14 "#a3be8c") (nord15 "#b48ead"))
  :roles ((ground nord0) (ground-dim nord1) (active-ground nord2) (current-line nord1)
          (text nord4) (text-alt nord6) (comment nord3-bright) (divider nord3) (whitespace nord3)
          (red nord11) (orange nord12) (yellow nord13) (green nord14) (blue nord9) (blue-cooler nord8)
          (blue-warmer nord10) (magenta nord15) (magenta-faint nord15) (brown nord12) (link nord8)
          (mode-line-ground nord3) (mode-line-text nord6) (mode-line-directory nord8)
          (mode-line-inactive-ground nord1) (mode-line-inactive-text nord4)
          (completion-ground nord2) (selection nord2) (selection-text nord6)
          (selection-secondary nord1) (search-ground nord8) (search-text nord1)
          (search-other-ground (mix nord0 nord10 0.55)) (highlight-text nord6) (cursor nord8)
          (paren-ground nord3) (line-number-current nord4)
          (syn-keyword nord9) (syn-string nord14) (syn-function nord8) (syn-type nord9) (syn-constant nord4)
          (syn-number nord15) (syn-builtin nord9) (syn-variable nord4) (syn-property nord7)
          (syn-operator nord9) (syn-punctuation nord6) (syn-escape nord13) (syn-tag nord9)
          (syn-attribute nord7) (syn-parameter nord4) (syn-label nord9) (syn-preprocessor nord9)
          (syn-constructor nord9) (syn-regexp nord13) (syn-macro nord9) (syn-namespace nord9)))
