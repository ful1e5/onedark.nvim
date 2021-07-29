# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [unreleased]

### Added

- **Warning** on `vim.g` configuration
- Configure plugin in lua using `require('onedark').setup({})` **[fix monsonjeremy/onedark.nvim#5]**
- Minimal config example added inside [README.md#minimal](./README.md#minimal)
- Linting Github Action init
- Format .lua code with [lua-format](https://github.com/Koihik/LuaFormatter)
- **kitty tab** colors are changed
- Init: `Makefile, .lua-format, .luacheckrc`
- Add "NONE" color compatibility for colors override
- `barbar.nvim` plugin support ( related to monsonjeremy/onedark.nvim#8 )

### Changed

- Removed function `require('onedark').colorscheme()`
- Colorscheme **autoload removed** from `colors/onedark.vim`
- **VertSplit** & **Inactive StatusLine** `fg` color changed to `bg_visual`
- StatusLine bug note inside [README.md#usage](./README.md#-usage)
- Configuration docs updated inside [README.md#configuration](./README.md#-configuration)
- Fix `VertSplit` & `StatusLine` crossover on `hideInactiveStatusline` [check hoob3rt/lualine.nvim#274]
- Change `NvimTreeEndOfBuffer` color on `darkSidebar=false`
- Parse lua table inside `colors` config **[fix #6]**

## [v0.0.1] - 14 June 2021

### Added

- Initial release 🎊

[unreleased]: https://github.com/ful1e5/onedark.nvim/compare/v0.0.1...main
[v0.0.1]: https://github.com/ful1e5/onedark.nvim/tree/v0.0.1
