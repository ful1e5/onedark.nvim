# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [unreleased]

### Added

-

### Changed

- fixed #101

## [v0.0.4]- 21 Jan 2022

### Added

- plugin support [hop.nvim](https://github.com/phaazon/hop.nvim)
- lualine `terminal` highlight added
- plugin support [coc.nvim](https://github.com/neoclide/coc.nvim)
- define global in project `luarc` config file.
- config option added `hide_end_of_buffer`
- allow customizing highlight group #91
- Removed unnecessary defer function & highlights
- highlight added for `GitSignsCurrentLineBlame`
- feat: `githooks` init
- feat: `types` module init
- cleanup: removed 'transform_colors' option from terminal themes generation
- feat: 'ConfigSchema' type init
- feat: `od.Highlights.*` type added
- refactor: `config` module
- refactor: `config.config` table renamed to `config.schema`
- refactor: `util` module
- breaking change: color palette redefine
- feat: `require("onedark").get_colors` added
- fix: autocompletion color in nvim in-built `terminal` #95

### Changed

- `hide_inactive_statusline` option deprecated from `lualine` plugin
- `javascriptTSTagAttribute` highlight removed
- `TSTagAttribute` highlight added
- yellow changed to the same version as onedark palette. monsonjeremy/onedark.nvim#19
- Boolean set to orange as in VSC onedark theme. monsonjeremy/onedark.nvim#19
- refactor override function to util.lua module #91
- formatter changed `LuaFormatter` -> `Stylua`
- refactor: modules export
- refactor: 'util' and 'extra' themes
- refactor: use `TerminalConf` type in terminal theme generation
- refactor: 'nvim-dev-icons' palette
- refactor: module renamed `extra` -> `terminal`
- docs: re-arrange heading section & plugins list
- fix: alacritty `black` color in bright section
- nvim-dev-icons colors fixed #98 projekt0n/circles.nvim#6

## [v0.0.3]- 11 Dec 2021

### Added

- docs updated
- Assign `dark5` color to `LineNr` inside `transparent` mode
- docs: contributing guidelines added
- docs: code of conduct added
- feat: `highlight_linenumber` config for setting dark color to number line
- feat: support `highlight_linenumber` with gitsigns
- enhance: nvim-cmp highlight
- change popup 'select' highlight background to green
- enhance(nvim-cmp):separate match highlights
- plugin-support: [nvim-notify](https://github.com/rcarriga/nvim-notify)
- enhance: set default config value to `vim.g` variables
- feat: `onedark_transparent_sidebar` option #60
- docs: vim config docs added inside README.md
- feat: store `user_config` value to `vim.g` variables
- docs: luadoc added inside `config` and `extra` module
- A new lualine theme added 'onedark-nvim' #65
- expose onedark theme in [fzf.vim](https://github.com/junegunn/fzf.vim)
- added hot reloaded to `onedark-nvim` lualine theme
- feat: `lualine_bold` option added
- luadoc: fix warning inside config module
- fixed #71 in normal mode
- vscode like `nvim-cmp` highlights [ref:nvim-cmp wiki](https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu)
- `nvim-cmp` all lspkind supported
- Link common `diff` highlights group
- dark foreground color for visited entries in telescope.nvim

### Changed

- projekt0n/github-nvim-theme#73 fixed
- refactor: lualine colors added inside `colors.lua`
- breaking change: consistent variable naming in `onedark` config
- undefined color `syntax.comment` fixed
- lualine theme provided by official lualine repo (fix #46)
- refactor: group colors according to assignment
- enhance: barbar highlighting monsonjeremy/onedark.nvim#16
- enhance: 'cmp' menu with 'fg' color
- docs: minimal screenshot updated in [README.md#minimal](https://github.com/ful1e5/onedark.nvim#minimal)
- docs: removed emoji from README.md
- cleanup: removed vim config deprecated message
- breaking change: use snake_case inside config and alacritty module
- breaking change: changed config variables name inside `vim.g` variables
- refactor: colors transform config inside `extra` module
- fix: diff text with comment text #68
- docs: cleanup some nonsense
- `NvimTreeGitRenamed` highlight with onedark purple color

## [v0.0.2]- 19 Sep 2021

### Added

- **Warning** on `vim.g` configuration
- Configure plugin in lua using `require('onedark').setup({})` **[fix monsonjeremy/onedark.nvim#5]**
- Minimal config example added inside [README.md#minimal](./README.md#minimal)
- Linting Github Action init
- Format .lua code with [lua-format](https://github.com/Koihik/LuaFormatter)
- **kitty tab** colors are changed
- Init: `Makefile, .lua-format, .luacheckrc`
- Add "NONE" color compatibility for colors override
- `barbar.nvim` plugin support. related to monsonjeremy/onedark.nvim#8
- `glyph-palette.vim` plugin support
- kitty border color added
- `./colors/onedark.vim` code in lua
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) plugin support
- `msg_area_style` config added
- `kitty` target added inside `Makefile` for reloading kitty theme
- `TSVariable` & `TSOperator` colors added inside `colors.lua`
- `cursor`, `TSProperty`, `jsonTSLabel`, `lessInclude`, `lessClass`, `cssStringQQ`, `makeIdent` colors added
- php, javascript, python, ruby, scss, bash , typescript, sql, xml, yaml syntax highlighting improved
- refactor: colors file to `lua`

### Changed

- Removed function `require('onedark').colorscheme()`
- Colorscheme **autoload removed** from `colors/onedark.vim`
- **VertSplit** & **Inactive StatusLine** `fg` color changed to `bg_visual`
- StatusLine bug note inside [README.md#usage](./README.md#-usage)
- Configuration docs updated inside [README.md#configuration](./README.md#-configuration)
- Fix `VertSplit` & `StatusLine` crossover on `hide_inactive_statusline` [check hoob3rt/lualine.nvim#274]
- Parse lua table inside `colors` config **[fix #6]**
- Better Telescope highlighting
- Removed `_` from extra themes name
- inactive statusline background color

## [v0.0.1] - 14 June 2021

### Added

- Initial release 🎊

[unreleased]: https://github.com/ful1e5/onedark.nvim/compare/v0.0.4...main
[v0.0.4]: https://github.com/ful1e5/onedark.nvim/compare/v0.0.4...v0.0.3
[v0.0.3]: https://github.com/ful1e5/onedark.nvim/compare/v0.0.3...v0.0.2
[v0.0.2]: https://github.com/ful1e5/onedark.nvim/compare/v0.0.2...v0.0.1
[v0.0.1]: https://github.com/ful1e5/onedark.nvim/tree/v0.0.1
