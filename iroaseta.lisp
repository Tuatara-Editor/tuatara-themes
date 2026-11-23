;;;; iroaseta.lisp --- The Iroaseta theme.
;;;; Copyright (C) 2026 Michael A Jones.  GPL-3.0-or-later; see LICENSE.
;;;;
;;;; Palette and syntax roles: Iroaseta for Helix (runtime/themes/iroaseta.toml), by the author of this package.
;;;; Iroaseta has no light variant. See NOTICE.

(in-package #:themes)

(define-colour-theme iroaseta
  "Iroaseta: a near-black blue ground with red keywords, blue strings, purple functions and orange variables."
  :colours ((amber-shadow "#0d1117") (midnight-black "#010409") (dark-steel "#161b22") (pitch-black "#000000")
            (misty-white "#f2f0eb") (slate-gray "#838a97") (ethereal-gray "#91a3b0") (blaze-orange "#ff9000")
            (lemon-zest "#ffba00") (leafy-green "#81be83") (dreamy-blue "#6eb0ff") (crystal-blue "#99c7ff")
            (twilight-slate "#263c57") (sky-blue "#45b1e8") (rustic-red "#540b0c") (ruby-glow "#fa7970")
            (walnut-brown "#987654") (rustic-amber "#9d5800") (slate-purple "#d2a8ff") (light-purple "#7533bd")
            (deep-purple "#4c1785") (red "#fa7970") (green "#81be83") (yellow "#ffba00") (orange "#ff9000")
            (blue "#45b1e8") (purple "#d2a8ff") (brown "#987654") (gray "#838a97") (white "#dadada"))
  :roles ((ground amber-shadow) (ground-dim midnight-black) (active-ground dark-steel) (current-line dark-steel)
          (text white) (text-alt misty-white) (code misty-white) (quote-text misty-white) (comment gray)
          (divider pitch-black) (whitespace brown)
          (red red) (orange orange) (yellow yellow) (green green) (blue blue) (blue-cooler crystal-blue)
          (blue-warmer dreamy-blue) (magenta purple) (magenta-faint slate-purple) (brown walnut-brown)
          (link crystal-blue) (changed brown)
          (mode-line-ground pitch-black) (mode-line-text misty-white) (mode-line-directory sky-blue)
          (mode-line-inactive-ground dark-steel) (mode-line-inactive-text slate-gray)
          (completion-ground pitch-black) (selection light-purple) (selection-text misty-white)
          (selection-secondary deep-purple) (search-ground blaze-orange) (search-text amber-shadow)
          (search-other-ground twilight-slate) (highlight-text misty-white) (error-ground rustic-red)
          (cursor misty-white) (line-number-current blaze-orange) (line-number-current-ground pitch-black)
          (syn-keyword red) (syn-string blue) (syn-function purple) (syn-type white) (syn-constant blue)
          (syn-builtin white) (syn-variable orange) (syn-property green) (syn-operator white)
          (syn-punctuation white) (syn-escape yellow) (syn-tag green) (syn-attribute yellow)
          (syn-parameter yellow) (syn-label blue) (syn-preprocessor white) (syn-constructor orange)
          (syn-regexp yellow) (syn-macro green) (syn-namespace white)))
