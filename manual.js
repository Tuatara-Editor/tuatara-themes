window.tuataraManualText = {"01-what-themes-is":" what themes is a package of popular colour themes for tuatara, each a dark or light version of a palette you may know from other editors. the package has fifteen themes. each is chosen by its name, which m-x load-theme and (load-theme 'name) take. name (for load-theme ) palette catppuccin-mocha catppuccin mocha, dark catppuccin-latte catppuccin latte, light dracula dracula, dark nord nord, dark one-dark one dark, dark solarized-dark solarized, dark solarized-light solarized, light tokyo-night tokyo night, dark tokyo-night-light tokyo night light, light rose-pine rose pine, dark rose-pine-dawn rose pine dawn, light everforest-dark everforest, dark, medium contrast everforest-light everforest, light, medium contrast kanagawa-wave kanagawa wave, dark iroaseta iroaseta, dark dracula, nord, one dark and iroaseta have no light version from their projects, so none is here. catppuccin's frappe and macchiato, rose pine moon, kanagawa dragon and lotus and solarized's other variants are left out. it is a package, not part of the editor, and it needs no program.","01-what-themes-is#trying-a-theme":"1.1 trying a theme once the package is loaded, m-x load-theme lists every theme, these included, and applies the one you choose. to have one at every start, put it after the package line in the init file: (load-package \"themes\" :source \"https://github.com/tuatara-editor/tuatara-themes\") (load-theme 'catppuccin-mocha)","01-what-themes-is#a-light-and-a-dark-theme":"1.2 a light and a dark theme a pair of a light and a dark theme is what toggle-light-dark-theme switches between, and what the window follows when it follows the desktop's light or dark style: (setf *dark-theme* 'tokyo-night *light-theme* 'tokyo-night-light) your own set-face lines in the init file stay on top of any theme. chapter 4 lists the commands and settings.","02-what-a-theme-covers":" what a theme covers which faces a theme colours, where the syntax colours come from, and how the contrast is checked.","02-what-a-theme-covers#the-faces":"2.1 the faces every theme is made for the faces that tuatara's own ao-dark theme colours, so no face is left in the colours of another theme. that is text, the mode line, selections, searches, completion, lists, diffs, diagnostics, org, the calendar and every syntax face. a theme is a palette, as its project publishes it, and the roles that tuatara's faces take from it. a role the theme does not name is made from the roles it does. shades that the projects do not publish, such as the ground of an added line, are mixed from the theme's own colours.","02-what-a-theme-covers#the-syntax-colours":"2.2 the syntax colours they follow each project's own editor port: catppuccin and rose pine: the neovim themes; dracula, nord, one dark, solarized and everforest: the vim ones; tokyo night: the vs code theme; kanagawa: the neovim theme.","02-what-a-theme-covers#the-contrast":"2.3 the contrast each theme is checked for contrast by wcag's formula. text, links, the selection, the mode line and the search highlight read at 4.5:1 or more. comments, line numbers, the syntax colours and the smaller marks read at 3:1 or more. a colour that falls short in its project's palette is moved toward white or black, no further than it needs, so that it keeps its hue. comments are the exception. seven projects set them quiet on purpose: solarized dark and light, tokyo night and tokyo night light, everforest light, one dark and nord. those stay as they are, only lifted to 2.5:1 where the project's own is lower. the package's test lists them by name.","02-what-a-theme-covers#two-choices-in-solarized":"2.4 two choices in solarized solarized uses its original green ( #859900 ), as the palette table in its repository gives it, not the brighter one the vim port tries. solarized's text is its emphasised colour ( base1 on dark, base01 on light), since its body colour reads at only 4.1:1.","02-what-a-theme-covers#your-own-changes":"2.5 your own changes any set-face line in the init file stays on top of the theme. to see which faces exist and how a theme draws them, use m-x list-faces .","03-where-the-palettes-come-from":" where the palettes come from the repository and commit each palette was read from, and the licences. each palette is read from the project's own repository at the commit named in the table. every project licenses it under the mit license, and the notices are in the notice file at the top of the package's repository. iroaseta is by the author of this package, who made it for helix. it is under this package's licence here. theme repository commit licence catppuccin catppuccin/palette ( palette.json ), syntax from catppuccin/nvim 07d02aa110ef9eb7e7427afca5c73ba9cf7f8ebd , edefef779ab08ce1a4a404713e3012b0d202bd35 mit, license , license.md dracula dracula/vim ( autoload/dracula.vim ) c689958744a93851b870e17ede7e9cbd28bc7cf8 mit, license nord nordtheme/vim ( colors/nord.vim ) f13f5dfbb784deddbc1d8195f34dfd9ec73e2295 mit, license one dark joshdick/onedark.vim ( autoload/onedark.vim ) 47bec7a6196a843dad195d2666c3ac84c6e80c78 mit, license solarized altercation/vim-colors-solarized ( colors/solarized.vim ), licence from altercation/solarized 528a59f26d12278698bb946f8fb82a63711eec21 , 62f656a02f93c5190a8753159e34b385588d5ff3 mit, license tokyo night enkia/tokyo-night-vscode-theme ( themes/*.json ) 7c0f11eaef322f293621ca7befe462214b7ea468 mit, license.txt rose pine rose-pine/neovim ( lua/rose-pine/palette.lua ) ff483051a47e27d84bdef47703538df1ed9f4a47 mit, license everforest sainnhe/everforest ( autoload/everforest.vim ) 85a86eb62409e3ec88713bff3d1b9d7374e112e4 mit, license kanagawa rebelot/kanagawa.nvim ( lua/kanagawa/colors.lua ) bb85e4bfc8d89b0e62c8fa53ccdd13d12e2f77b3 mit, license iroaseta helix-editor/helix ( runtime/themes/iroaseta.toml ) e22bbf5489ba95b643b9751038046d736aa92ad1 by the author of this package, gpl-3.0-or-later here","03-where-the-palettes-come-from#not-included":"3.1 not included gruvbox is not here. its repository ( morhetz/gruvbox ) has no licence file, only a line in its readme that says mit/x11, with no copyright notice to keep with copies.","04-choosing-and-pairing-themes":" choosing and pairing themes the editor's commands and settings that choose and pair themes. the package adds themes and nothing else: it has no command or setting of its own. these belong to tuatara and work with every theme, these included. tuatara's own manual describes them in the chapter on packages.","04-choosing-and-pairing-themes#choosing-a-theme":"4.1 choosing a theme m-x load-theme lists every theme, with a description beside each, and applies the one you choose. called from the init file as (load-theme 'name) , it applies the theme at every start.","04-choosing-and-pairing-themes#pairing-a-light-and-a-dark-theme":"4.2 pairing a light and a dark theme m-x toggle-light-dark-theme switches between a light and a dark theme. the settings name the pair. if the window follows the desktop's light or dark style, these are the two it switches between: *light-theme* and *dark-theme* , which are tuatara's own two themes until you set them. (setf *dark-theme* 'tokyo-night *light-theme* 'tokyo-night-light)"};
// The manual's pages: filter the contents column to the headings whose title or
// text holds what is typed in its box, and change between light and dark
// colours (the choice kept in this browser for the next page). The entry for
// the part being read is marked as the page scrolls. The text of
// every section comes before this script, in window.tuataraManualText, made
// when the manual is built. Links are left alone. No address is ever loaded.
(function () {
  var root = document.documentElement;
  var key = "tuatara-manual-theme";
  var saved = null;
  try { saved = window.localStorage.getItem(key); } catch (e) { saved = null; }
  if (saved === "light" || saved === "dark") { root.setAttribute("data-theme", saved); }

  function dark() {
    var chosen = root.getAttribute("data-theme");
    if (chosen) { return chosen === "dark"; }
    return Boolean(window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches);
  }

  var button = document.querySelector("button.theme");
  if (button) {
    var label = function () {
      button.textContent = dark() ? "Light" : "Dark";
      button.setAttribute("aria-label", dark() ? "Use light colours" : "Use dark colours");
    };
    button.hidden = false;
    label();
    button.addEventListener("click", function () {
      var next = dark() ? "light" : "dark";
      root.setAttribute("data-theme", next);
      try { window.localStorage.setItem(key, next); } catch (e) { /* kept for this page only */ }
      label();
    });
  }

  var nav = document.querySelector("nav.toc");
  var box = nav && nav.querySelector("input");
  if (!box) { return; }
  var texts = window.tuataraManualText || {};

  // The key of a section in the text: a chapter's page name without its
  // ending, then # and the heading's id. On the page of every chapter the
  // links are "10-directories.html#marks", on the whole manual "#10-directories--marks".
  function keyOf(href) {
    var parts = /^#?([0-9]+-[^#.]*?)(?:\.html)?(?:(?:#|--)(.*))?$/.exec(href || "");
    if (!parts) { return null; }
    return parts[2] ? parts[1] + "#" + parts[2] : parts[1];
  }

  // Show ITEM when its title or text holds WORDS, or any entry under it does.
  function show(item, words) {
    var link = item.querySelector(":scope > a");
    var title = link ? link.textContent.toLowerCase() : "";
    var text = (link && texts[keyOf(link.getAttribute("href"))]) || "";
    var hit = words === "" || title.indexOf(words) !== -1 || text.indexOf(words) !== -1;
    item.querySelectorAll(":scope > ol > li").forEach(function (inner) {
      if (show(inner, words)) { hit = true; }
    });
    item.classList.toggle("hidden", !hit);
    return hit;
  }

  box.addEventListener("input", function () {
    var words = box.value.trim().toLowerCase().replace(/\s+/g, " ");
    nav.classList.toggle("filtering", words !== "");
    nav.querySelectorAll("ol.chapters > li").forEach(function (item) { show(item, words); });
  });

  // The entry of the column for the part being read is marked, following as
  // the page is scrolled: the last heading that has reached the middle of
  // the window, and the entries it is under, so a section folded out of sight
  // leaves the section holding it marked. On the whole manual, where no chapter is marked as the one
  // shown, its chapter is unfolded too.
  var whole = !nav.querySelector("li.here");
  var here = location.pathname;
  var marks = [];
  nav.querySelectorAll("ol.chapters a").forEach(function (link) {
    var url = new URL(link.href, location.href);
    if (url.pathname !== here) { return; }
    var target = url.hash ? document.getElementById(decodeURIComponent(url.hash.slice(1)))
                          : document.querySelector("main h1");
    if (target) { marks.push({ link: link, target: target, top: 0 }); }
  });
  if (marks.length === 0) { return; }
  var marked = null;

  function measure() {
    marks.forEach(function (mark) { mark.top = mark.target.getBoundingClientRect().top + window.scrollY; });
    marks.sort(function (a, b) { return a.top - b.top; });
  }

  // Mark or unmark the entry of MARK and every entry it is under.
  function light(mark, on) {
    for (var item = mark.link.closest("li"); item && nav.contains(item); item = item.parentElement.closest("li")) {
      item.querySelector(":scope > a").classList.toggle("in-view", on);
    }
  }

  // Keep LINK in view in whichever part of the column scrolls.
  function reveal(link) {
    [nav, nav.querySelector("ol.chapters")].forEach(function (box) {
      if (!box || box.scrollHeight <= box.clientHeight) { return; }
      var outer = box.getBoundingClientRect();
      var inner = link.getBoundingClientRect();
      if (inner.top < outer.top) { box.scrollTop -= outer.top - inner.top + 24; }
      else if (inner.bottom > outer.bottom) { box.scrollTop += inner.bottom - outer.bottom + 24; }
    });
  }

  // Mark the entry of the last heading at or above the middle of the
  // window, the first when none is: a search in the measured places, the
  // page changed only when the entry is another.
  function follow() {
    var line = window.scrollY + window.innerHeight / 2;
    var low = 0, high = marks.length - 1, found = marks[0];
    while (low <= high) {
      var middle = (low + high) >> 1;
      if (marks[middle].top <= line) { found = marks[middle]; low = middle + 1; } else { high = middle - 1; }
    }
    if (found === marked) { return; }
    if (marked) { light(marked, false); }
    marked = found;
    light(marked, true);
    if (whole) {
      var chapter = marked.link.closest("ol.chapters > li");
      nav.querySelectorAll("ol.chapters > li.here").forEach(function (item) {
        if (item !== chapter) { item.classList.remove("here"); }
      });
      if (chapter) { chapter.classList.add("here"); }
    }
    reveal(marked.link);
  }

  // Measure again when pictures have loaded or the window changed size.
  function again() {
    measure();
    if (marked) { light(marked, false); }
    marked = null;
    follow();
  }

  measure();
  follow();
  window.addEventListener("scroll", follow, { passive: true });
  window.addEventListener("resize", again);
  window.addEventListener("load", again);
}());
