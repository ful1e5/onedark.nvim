<p align="center">
  <img src="https://i.imgur.com/lNdBu1v.png" alt="onedark.nvim" />
  <br />
  Atom's iconic One Dark theme for Neovim, written in Lua
</p>

<p align="center">
  <a href="https://github.com/monsonjeremy/onedark.nvim">
    <img alt="monsonjeremy/onedark.nvim" src="https://img.shields.io/badge/Fork%20of-monsonjeremy%2Fonedark.nvim-blue" />
  </a>
  <a href="https://github.com/ful1e5/onedark.nvim/actions">
    <img alt="GitHub Action Linting" src="https://github.com/ful1e5/onedark.nvim/actions/workflows/lint.yml/badge.svg" />
  </a>
  <a href="twitter.com/ful1e5">
    <img alt="Twitter" src="https://img.shields.io/badge/twitter-ful1e5-blue" />
  </a>
</p>

## Features

- supports the latest Neovim 0.5 features like TreeSitter and LSP
- minimal inactive StatusLine
- vim terminal colors
- darker background for sidebar-like windows
- color configs for [Kitty](https://sw.kovidgoyal.net/kitty/conf.html?highlight=include) and [Alacritty](https://github.com/alacritty/alacritty)
- **lualine** theme

### Plugin Support

- [Built LSP diagnostics](https://neovim.io/doc/user/lsp.html)
- [barbar.nvim](https://github.com/romgrk/barbar.nvim)
- [circles.nvim](https://github.com/projekt0n/circles.nvim)
- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [dashboard-nvim)](https://github.com/glepnir/dashboard-nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [glyph-palette.vim](https://github.com/lambdalisue/glyph-palette.vim)
- [hop.nvim](https://github.com/phaazon/hop.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lsp-trouble.nvim](https://github.com/folke/lsp-trouble.nvim)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [neogit](https://github.com/TimUntersberger/neogit)
- [nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-which-key](https://github.com/liuchengxu/vim-which-key)

## Requirements

- Neovim >= 0.5.0

## Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'ful1e5/onedark.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'ful1e5/onedark.nvim'
```

## Usage

Enable the colorscheme:

```vim
" Vim Script
colorscheme onedark
```

```lua
-- Lua
require('onedark').setup()
```

### lualine.nvim

To enable the `onedark` theme for `Lualine`, simply specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    theme = 'onedark-nvim',
    -- For round icons (require Nerd-Font)
    -- section_separators = {"", ""},
    -- component_separators = {"", ""},
    -- ... your lualine config
  }
}
```

![normal](https://imgur.com/utoeRWg.png)
![insert](https://imgur.com/cimWSSb.png)
![visual](https://imgur.com/4ntUbvB.png)
![command](https://imgur.com/bmreFgJ.png)
![terminal](https://imgur.com/Fw0Btae.png)

## Configuration

| Option                   | Default  | Description                                                                                                                                                                       |
| ------------------------ | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| comment_style            | `italic` | Highlight style for comments (check `:help highlight-args` for options)                                                                                                           |
| keyword_style            | `italic` | Highlight style for keywords (check `:help highlight-args` for options)                                                                                                           |
| function_style           | `NONE`   | Highlight style for functions (check `:help highlight-args` for options)                                                                                                          |
| variable_style           | `NONE`   | Highlight style for variables and identifiers (check `:help highlight-args` for options)                                                                                          |
| msg_area_style           | `NONE`   | Highlight style for messages and cmdline (check `:help highlight-args` for options)                                                                                               |
| transparent              | `false`  | Enable this to disable setting the background color                                                                                                                               |
| hide_inactive_statusline | `false`  | Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine**.                                   |
| highlight_linenumber     | `false`  | Enabling this option, will enable dark color to `LineNr`, `SignColumn` and `CursorLineNr` highlights.(also support [gitsigns](https://github.com/lewis6991/gitsigns.nvim) plugin) |
| lualine_bold             | `false`  | When `true`, section headers in the lualine theme will be bold                                                                                                                    |
| sidebars                 | `{}`     | Set a darker background on sidebar-like windows. For example: `{"qf", "vista_kind", "terminal", "packer"}`                                                                        |
| dark_sidebar             | `true`   | Sidebar like windows like `NvimTree` get a darker background                                                                                                                      |
| transparent_sidebar      | `false`  | Sidebar like windows like `NvimTree` get a transparent background                                                                                                                 |
| dark_float               | `true`   | Float windows like the lsp diagnostics windows get a darker background.                                                                                                           |
| colors                   | `{}`     | You can override specific color groups to use other groups or a hex color                                                                                                         |

```vim
" Example config in VimScript
" configuration needs to be set BEFORE loading the color scheme with `colorscheme` command
let g:onedark_function_style = "italic"
let g:onedark_sidebars = ["qf", "vista_kind", "terminal", "packer"]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:onedark_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme onedark
```

```lua
-- Example config in Lua
require("onedark").setup({
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
})
```

### Making `undercurls` work properly in **Tmux**

To have undercurls show up and in color, add the following to your **Tmux** config file:

```sh
# Undercurl
set -g default-terminal "${TERM}"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

## Extras

> To generate the configs `make extra`

Extra color configs for **Kitty**, and **Alacritty** can be found in [extras](extras/). To use them, refer to their respective documentation.

## Credit

- [OneDark-Pro](https://github.com/Binaryify/OneDark-Pro)
- [onedark.nvim](https://github.com/monsonjeremy/onedark.nvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [gruvbox-flat.nvim](https://github.com/eddyekofo94/gruvbox-flat.nvim)

## Screenshot

- Terminal: [Kitty](https://sw.kovidgoyal.net/kitty)
- Font: [Ubuntu Mono](https://design.ubuntu.com/font/)
- icons: [projekt0n/circles.nvim](https://github.com/projekt0n/circles.nvim)
- Dotfiles: [ful1e5/dotfiles](https://github.com/ful1e5/dotfiles)

<p align="center">
  <img src="https://imgur.com/yap8q3B.png" alt="onedark.nvim" />
</p>

### Default

<p align="center">
  <img src="https://imgur.com/nnRERfV.png" alt="Default fonts" />
</p>

### Normal

```vim
" VimScript
let g:onedark_comment_style = "NONE"
let g:onedark_keyword_style = "NONE"
let g:onedark_function_style = "NONE"
let g:onedark_variable_style = "NONE"
```

```lua
-- Lua
require("onedark").setup({
  comment_style = "NONE",
  keyword_style = "NONE",
  function_style = "NONE",
  variable_style = "NONE"
  -- ... your onedark config
})
```

<p align="center">
  <img src="https://imgur.com/AIyHhqe.png" alt="Normal fonts" />
</p>

### Italic

```vim
" VimScript
let g:onedark_comment_style = "italic"
let g:onedark_keyword_style = "italic"
let g:onedark_function_style = "italic"
let g:onedark_variable_style = "italic"
```

```lua
-- Lua
require("onedark").setup({
  comment_style = "italic",
  keyword_style = "italic",
  function_style = "italic",
  variable_style = "italic"
  -- ... your onedark config
})
```

<p align="center">
  <img src="https://imgur.com/BhpArix.png" alt="Italic fonts" />
</p>

### Minimal

```vim
" VimScript
let g:onedark_hide_inactive_statusline = 1
let g:onedark_dark_sidebar = 0
let g:onedark_dark_float = 0
```

```lua
-- Lua
require("onedark").setup({
  hide_inactive_statusline = true,
  dark_sidebar = false,
  dark_float = false
  -- ... your onedark config
})
```

<p align="center">
  <img src="https://imgur.com/6IXYKaG.png" alt="Minimal" />
</p>

### Highlight Line-Number

```vim
" VimScript
let g:onedark_dark_sidebar = 0
let g:onedark_highlight_linenumber = 1
```

```lua
-- Lua
require("onedark").setup({
  dark_sidebar = false,
  highlight_linenumber = true
  -- ... your onedark config
})
```

<p align="center">
  <img src="https://imgur.com/StVkP8t.png" alt="Highlight Line-Number" />
</p>

### Telescope

<p align="center">
  <img src="https://imgur.com/xOXa7sh.png" alt="Telescope plugin" />
</p>
