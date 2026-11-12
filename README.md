# themes

Popular colour themes for Tuatara, each a dark or light version of a palette
you may know from other editors.

| Name (for `load-theme`) | Palette |
|---|---|
| `catppuccin-mocha` | Catppuccin Mocha, dark |
| `catppuccin-latte` | Catppuccin Latte, light |
| `dracula` | Dracula, dark |
| `nord` | Nord, dark |
| `one-dark` | One Dark, dark |
| `solarized-dark` | Solarized, dark |
| `solarized-light` | Solarized, light |
| `tokyo-night` | Tokyo Night, dark |
| `tokyo-night-light` | Tokyo Night Light, light |
| `rose-pine` | Rose Pine, dark |
| `rose-pine-dawn` | Rose Pine Dawn, light |
| `everforest-dark` | Everforest, dark, medium contrast |
| `everforest-light` | Everforest, light, medium contrast |
| `kanagawa-wave` | Kanagawa Wave, dark |

Dracula, Nord and One Dark have no light version from their projects, so none
is here.

## Loading it, step by step

1. **Install what it needs.** Nothing.
2. **Open your init file**: in Tuatara press `C-x C-f`, type
   `~/.config/tuatara/init.lisp` and press `RET`.
3. **Add these lines** to it:

   ```lisp
   (load-package "themes" :source "https://github.com/Tuatara-Editor/tuatara-themes")
   (load-theme 'catppuccin-mocha)
   ```

4. **Save** with `C-x C-s`, **quit** with `C-x C-c`, and **start Tuatara
   again**. Answer `y` when it asks whether to load themes; it asks once.
5. **Check it**: the window and the mode line are in the theme's colours.

To try the themes without editing the init file, press `M-x load-theme`: the
list shows every theme, these included, once the package is loaded.

To pair a light and a dark theme for `toggle-light-dark-theme`, and for the
window following the desktop's style:

```lisp
(setf *dark-theme* 'tokyo-night
      *light-theme* 'tokyo-night-light)
```

Your own `set-face` lines in the init file stay on top of any theme.

## What a theme covers

Every theme is made for the faces Tuatara's own `ao-dark` theme colours, so no
face is left in the colours of another theme: text, the mode line, selections,
searches, completion, lists, diffs, diagnostics, Org, the calendar and
every syntax face. The syntax colours follow each project's own editor
port: for Catppuccin and Rose Pine the Neovim themes, for Dracula, Nord,
One Dark, Solarized and Everforest the Vim ones, for Tokyo Night the VS Code
theme and for Kanagawa the Neovim theme. Shades the projects do not publish,
such as the ground of an added line, are mixed from the theme's own colours.

Each theme is checked for contrast, by WCAG's formula. Text, links, the
selection, the mode line and the search highlight read at 4.5:1 or more;
comments, line numbers, the syntax colours and the smaller marks at 3:1 or
more. A colour that falls short in its project's palette is moved toward white
or black, no further than it needs, so that it keeps its hue. Comments are the
exception: seven projects set them quiet on purpose (Solarized dark and light,
Tokyo Night and Tokyo Night Light, Everforest Light, One Dark and Nord), and
those stay as they are, only lifted to 2.5:1 where the project's own is lower.
The test lists them by name.

## Where the palettes come from

Each palette is read from the project's own repository at the commit named
here. Every project licenses it under the MIT license; the notices are in
[NOTICE](NOTICE).

| Theme | Repository | Commit | Licence |
|---|---|---|---|
| Catppuccin | [catppuccin/palette](https://github.com/catppuccin/palette) (`palette.json`), syntax from [catppuccin/nvim](https://github.com/catppuccin/nvim) | `07d02aa110ef9eb7e7427afca5c73ba9cf7f8ebd`, `edefef779ab08ce1a4a404713e3012b0d202bd35` | MIT, `LICENSE`, `LICENSE.md` |
| Dracula | [dracula/vim](https://github.com/dracula/vim) (`autoload/dracula.vim`) | `c689958744a93851b870e17ede7e9cbd28bc7cf8` | MIT, `LICENSE` |
| Nord | [nordtheme/vim](https://github.com/nordtheme/vim) (`colors/nord.vim`) | `f13f5dfbb784deddbc1d8195f34dfd9ec73e2295` | MIT, `license` |
| One Dark | [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim) (`autoload/onedark.vim`) | `47bec7a6196a843dad195d2666c3ac84c6e80c78` | MIT, `LICENSE` |
| Solarized | [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) (`colors/solarized.vim`), licence from [altercation/solarized](https://github.com/altercation/solarized) | `528a59f26d12278698bb946f8fb82a63711eec21`, `62f656a02f93c5190a8753159e34b385588d5ff3` | MIT, `LICENSE` |
| Tokyo Night | [enkia/tokyo-night-vscode-theme](https://github.com/enkia/tokyo-night-vscode-theme) (`themes/*.json`) | `7c0f11eaef322f293621ca7befe462214b7ea468` | MIT, `LICENSE.txt` |
| Rose Pine | [rose-pine/neovim](https://github.com/rose-pine/neovim) (`lua/rose-pine/palette.lua`) | `ff483051a47e27d84bdef47703538df1ed9f4a47` | MIT, `LICENSE` |
| Everforest | [sainnhe/everforest](https://github.com/sainnhe/everforest) (`autoload/everforest.vim`) | `85a86eb62409e3ec88713bff3d1b9d7374e112e4` | MIT, `LICENSE` |
| Kanagawa | [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) (`lua/kanagawa/colors.lua`) | `bb85e4bfc8d89b0e62c8fa53ccdd13d12e2f77b3` | MIT, `LICENSE` |

Not included: Gruvbox. Its repository
([morhetz/gruvbox](https://github.com/morhetz/gruvbox)) has no licence file,
only a line in its README that says MIT/X11, with no copyright notice to keep
with copies. Solarized uses its original green (`#859900`), as the palette table
in its repository gives it, not the brighter one the Vim port tries. Solarized's
text is its emphasised colour (`base1` on dark, `base01` on light), since its
body colour reads at only 4.1:1. Catppuccin's Frappe and Macchiato, Rose Pine
Moon, Kanagawa Dragon and Lotus and Solarized's other variants are left out.

## Tests

`tools/test.sh` runs them: every theme loads, sets every role `ao-dark` sets
with a valid colour, reads well, and no colour is written outside the theme
definitions.

## License

GPL-3.0-or-later; see `LICENSE` at the top of this repository. The colours are
their projects', under the licences above.

## Working on it

```sh
tools/test.sh
```

runs its tests against a Tuatara source tree: `../tuatara` beside this
repository, or `../../tuatara` beside the directory it is in, unless
`TUATARA_SOURCE` names another. How a package is laid out and which of
Tuatara's names it may use are in Tuatara's
[HACKING.org](https://github.com/Tuatara-Editor/tuatara/blob/main/HACKING.org);
bug reports, ideas and how changes are made in
[CONTRIBUTING.md](CONTRIBUTING.md).
