;;;; everforest.lisp --- The Everforest themes, dark and light, medium contrast.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette and syntax roles: sainnhe/everforest. See NOTICE.

(in-package #:themes)

(define-colour-theme everforest-dark
  "Everforest Dark: a green-grey forest palette on a comfortable, medium-contrast ground."
  :colours ((bg-dim "#232a2e") (bg0 "#2d353b") (bg1 "#343f44") (bg2 "#3d484d") (bg3 "#475258") (bg4 "#4f585e")
            (bg5 "#56635f") (bg-visual "#543a48") (bg-red "#514045") (bg-yellow "#4d4c43") (bg-green "#425047")
            (bg-blue "#3a515d") (bg-purple "#4a444e") (fg "#d3c6aa") (red "#e67e80") (orange "#e69875")
            (yellow "#dbbc7f") (green "#a7c080") (aqua "#83c092") (blue "#7fbbb3") (purple "#d699b6")
            (grey0 "#7a8478") (grey1 "#859289") (grey2 "#9da9a0"))
  :roles ((ground bg0) (ground-dim bg-dim) (active-ground bg2) (current-line bg1)
          (text fg) (text-alt fg) (comment grey1) (divider bg5) (whitespace bg3)
          (red red) (orange orange) (yellow yellow) (green green) (blue blue) (blue-cooler aqua)
          (blue-warmer blue) (magenta purple) (magenta-faint purple) (brown orange) (link blue)
          (mode-line-ground bg2) (mode-line-text fg) (mode-line-directory aqua)
          (mode-line-inactive-ground bg1) (mode-line-inactive-text grey2)
          (completion-ground bg3) (selection bg-visual) (selection-text fg)
          (selection-secondary bg-purple) (search-ground green) (search-text bg0)
          (search-other-ground bg-blue) (highlight-text fg) (cursor orange)
          (paren-ground bg4) (line-number-current grey2)
          (added-ground bg-green) (removed-ground bg-red) (yellow-subtle bg-yellow) (blue-subtle bg-blue)
          (error-ground bg-red) (match-ground bg-purple)
          (syn-keyword red) (syn-string green) (syn-function green) (syn-type yellow) (syn-constant aqua)
          (syn-number purple) (syn-builtin aqua) (syn-variable blue) (syn-property blue)
          (syn-operator orange) (syn-punctuation fg) (syn-escape yellow) (syn-tag orange)
          (syn-attribute yellow) (syn-parameter blue) (syn-preprocessor purple) (syn-macro aqua)))

(define-colour-theme everforest-light
  "Everforest Light: the forest palette on a soft cream ground, medium contrast."
  :colours ((bg-dim "#efebd4") (bg0 "#fdf6e3") (bg1 "#f4f0d9") (bg2 "#efebd4") (bg3 "#e6e2cc") (bg4 "#e0dcc7")
            (bg5 "#bdc3af") (bg-visual "#eaedc8") (bg-red "#fde3da") (bg-yellow "#faedcd") (bg-green "#f0f1d2")
            (bg-blue "#e9f0e9") (bg-purple "#fae8e2") (fg "#5c6a72") (red "#f85552") (orange "#f57d26")
            (yellow "#dfa000") (green "#8da101") (aqua "#35a77c") (blue "#3a94c5") (purple "#df69ba")
            (grey0 "#a6b0a0") (grey1 "#939f91") (grey2 "#829181"))
  :roles ((ground bg0) (ground-dim bg-dim) (active-ground bg3) (current-line bg1)
          (text fg) (text-alt fg) (comment grey1) (divider bg5) (whitespace bg3)
          (red red) (orange orange) (yellow yellow) (green green) (blue blue) (blue-cooler aqua)
          (blue-warmer blue) (magenta purple) (magenta-faint purple) (brown orange) (link blue)
          (mode-line-ground bg3) (mode-line-text fg) (mode-line-directory fg)
          (mode-line-inactive-ground bg1) (mode-line-inactive-text grey2)
          (completion-ground bg3) (selection (mix bg0 green 0.3)) (selection-text fg)
          (selection-secondary bg-visual) (search-ground (mix bg0 green 0.5)) (search-text fg)
          (search-other-ground bg-blue) (highlight-text fg) (cursor orange)
          (paren-ground bg4) (line-number-current grey2)
          (added-ground bg-green) (removed-ground bg-red) (yellow-subtle bg-yellow) (blue-subtle bg-blue)
          (error-ground bg-red) (match-ground bg-purple)
          (syn-keyword red) (syn-string green) (syn-function green) (syn-type yellow) (syn-constant aqua)
          (syn-number purple) (syn-builtin aqua) (syn-variable blue) (syn-property blue)
          (syn-operator orange) (syn-punctuation fg) (syn-escape yellow) (syn-tag orange)
          (syn-attribute yellow) (syn-parameter blue) (syn-preprocessor purple) (syn-macro aqua)))
