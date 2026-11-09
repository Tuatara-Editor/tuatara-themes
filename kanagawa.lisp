;;;; kanagawa.lisp --- The Kanagawa Wave theme.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette and syntax roles: rebelot/kanagawa.nvim. Dragon and Lotus are not included. See NOTICE.

(in-package #:themes)

(define-colour-theme kanagawa-wave
  "Kanagawa Wave: muted inks and woodblock colours on a dark indigo ground."
  :italic-comments t
  :colours ((sumi-ink0 "#16161d") (sumi-ink1 "#181820") (sumi-ink3 "#1f1f28") (sumi-ink4 "#2a2a37")
            (sumi-ink5 "#363646") (sumi-ink6 "#54546d") (wave-blue1 "#223249") (wave-blue2 "#2d4f67")
            (winter-blue "#252535") (autumn-green "#76946a") (autumn-red "#c34043") (autumn-yellow "#dca561")
            (wave-aqua1 "#6a9589") (wave-aqua2 "#7aa89f") (old-white "#c8c093") (fuji-white "#dcd7ba")
            (fuji-gray "#727169") (oni-violet "#957fb8") (oni-violet2 "#b8b4d0") (crystal-blue "#7e9cd8")
            (spring-violet2 "#9cabca") (spring-blue "#7fb4ca") (spring-green "#98bb6c")
            (boat-yellow2 "#c0a36e") (carp-yellow "#e6c384") (sakura-pink "#d27e99") (wave-red "#e46876")
            (surimi-orange "#ffa066"))
  :roles ((ground sumi-ink3) (ground-dim sumi-ink1) (active-ground wave-blue1) (current-line sumi-ink5)
          (text fuji-white) (text-alt old-white) (comment fuji-gray) (divider sumi-ink6) (whitespace sumi-ink5)
          (red wave-red) (orange surimi-orange) (yellow carp-yellow) (green spring-green)
          (blue crystal-blue) (blue-cooler spring-blue) (blue-warmer spring-violet2) (magenta oni-violet)
          (magenta-faint sakura-pink) (brown wave-aqua1) (link spring-blue)
          (added autumn-green) (removed autumn-red) (changed autumn-yellow)
          (mode-line-ground sumi-ink0) (mode-line-text old-white) (mode-line-directory spring-blue)
          (mode-line-inactive-ground sumi-ink1) (mode-line-inactive-text fuji-gray)
          (completion-ground wave-blue2) (selection wave-blue1) (selection-text fuji-white)
          (selection-secondary winter-blue) (search-ground wave-blue2) (search-text fuji-white)
          (search-other-ground wave-blue1) (highlight-text fuji-white) (cursor carp-yellow)
          (paren-ground sumi-ink4) (line-number-current carp-yellow)
          (syn-keyword oni-violet) (syn-string spring-green) (syn-function crystal-blue)
          (syn-type wave-aqua2) (syn-constant surimi-orange) (syn-number sakura-pink)
          (syn-builtin spring-blue) (syn-variable fuji-white) (syn-property carp-yellow)
          (syn-operator boat-yellow2) (syn-punctuation spring-violet2) (syn-escape wave-red)
          (syn-tag wave-red) (syn-attribute surimi-orange) (syn-parameter oni-violet2)
          (syn-regexp boat-yellow2) (syn-preprocessor wave-red) (syn-macro wave-red)))
