# themes

Read the manual:
[tuatara-editor.github.io/tuatara-themes](https://tuatara-editor.github.io/tuatara-themes/).

Popular colour themes for Tuatara, each a dark or light version of a palette
you may know from other editors: Catppuccin, Dracula, Nord, One Dark,
Solarized, Tokyo Night, Rose Pine, Everforest, Kanagawa and Iroaseta, fifteen
themes in all. One of the Tuatara project's packages, not part of the editor.

Every theme colours the same faces as Tuatara's own `ao-dark`, and is checked
for contrast. The manual lists the theme names, says what a theme covers and
how the contrast is checked, gives the repository and commit each palette was
read from, and says how to pair a light and a dark theme.

## What it needs

- Tuatara 0.90.28 or later.
- No other program.

## Installing it, step by step

1. **Open your init file**: in Tuatara press `C-x C-f`, type
   `~/.config/tuatara/init.lisp` and press `RET`.
2. **Add these lines** to it:

   ```lisp
   (load-package "themes" :source "https://github.com/Tuatara-Editor/tuatara-themes")
   (load-theme 'catppuccin-mocha)
   ```

3. **Save** with `C-x C-s`, **quit** with `C-x C-c`, and **start Tuatara
   again**. Answer `y` when it asks whether to load themes; it asks once.
4. **Check it**: the window and the mode line are in the theme's colours.

## On a machine without internet

Tuatara compiles the package itself, so only fetching it needs the internet.
On a machine with internet:

```sh
git clone https://github.com/Tuatara-Editor/tuatara-themes
git -C tuatara-themes verify-tag "$(git -C tuatara-themes describe --tags --abbrev=0)"
```

Copy the directory to the other machine, for instance to
`~/tuatara-packages/tuatara-themes`, and name it in the init file:

```lisp
(load-package "themes" :source "~/tuatara-packages/tuatara-themes")
```

Carrying over the compiled files as well, so the other machine skips the
compiling, is in Tuatara's manual, chapter 19, "On a machine without
internet".

## Credits

The colours of each theme are those its project publishes, under the MIT
license; the notices are in [NOTICE](NOTICE) and the repositories and commits
are in the manual. Iroaseta is by the author of this package.

## License

GPL-3.0-or-later; see `LICENSE` at the top of this repository. The colours are
their projects', under the licences in `NOTICE`.

## Working on it

```sh
tools/test.sh
```

runs its tests against a Tuatara source tree: `../tuatara` beside this
repository, or `../../tuatara` beside the directory it is in, unless
`TUATARA_SOURCE` names another. The tests load every theme, check that it sets
every role `ao-dark` sets with a valid colour and reads well, and that no
colour is written outside the theme definitions. How a package is laid out and
which of Tuatara's names it may use are in Tuatara's
[HACKING.org](https://github.com/Tuatara-Editor/tuatara/blob/main/HACKING.org);
bug reports, ideas and how changes are made in
[CONTRIBUTING.md](CONTRIBUTING.md). The manual's source is in `doc/manual/`;
`tools/manual-html.sh` in a Tuatara tree, given this repository's directory,
makes its pages.
