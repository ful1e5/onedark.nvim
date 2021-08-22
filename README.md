<!-- Branding -->
<p align="center">
  <img src="https://i.imgur.com/lNdBu1v.png" alt="onedark.nvim" />
  <br />
  Atom's iconic One Dark theme for Neovim, written in Lua
</p>

<!-- Badges -->
<p align="center">
  <!-- First Row -->
  <a href="https://github.com/monsonjeremy/onedark.nvim">
    <img alt="monsonjeremy/onedark.nvim" src="https://img.shields.io/badge/Fork%20of-monsonjeremy%2Fonedark.nvim-blue" />
  </a>
  <a href="https://github.com/ful1e5/onedark.nvim/actions">
    <img alt="GitHub Action Linting" src="https://github.com/ful1e5/onedark.nvim/actions/workflows/lint.yml/badge.svg" width="102" />
  </a>
</p>

## ✨ Features

- supports the latest Neovim 0.5 features like TreeSitter and LSP
- minimal inactive statusline (currently bugged)
- vim terminal colors
- darker background for sidebar-like windows
- color configs for [Kitty](https://sw.kovidgoyal.net/kitty/conf.html?highlight=include) and [Alacritty](https://github.com/alacritty/alacritty)
- **lualine** theme

### 🔌 Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Lightline](https://github.com/itchyny/lightline.vim)
- [Neogit](https://github.com/TimUntersberger/neogit)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [glyph-palette.vim](https://github.com/lambdalisue/glyph-palette.vim)
- [circles.nvim](https://github.com/projekt0n/circles.nvim)

## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'ful1e5/onedark.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'ful1e5/onedark.nvim'
```

## 🚀 Usage

Enable the colorscheme:

```vim
" Vim Script
lua require('onedark').setup()
```

```lua
-- Lua
require('onedark').setup()
```

To enable the `onedark` theme for `Lualine`, simply specify it in your lualine settings:

> **📝 NOTE:** Set `lualine` configuration **before** `onedark`.

```lua
require('lualine').setup {
  options = {
    theme = 'onedark',
    -- For round icons (require Nerd-Font)
    -- section_separators = {"", ""},
    -- component_separators = {"", ""},
    -- ... your lualine config
  }
}
```

To enable the `onedark` colorscheme for `Lightline`:

```vim
" Vim Script
let g:lightline = {'colorscheme': 'onedark'}
```

```lua
-- Lua
vim.g.lightline = {colorscheme = "onedark"}
```

## ⚙️ Configuration

| Option                 | Default  | Description                                                                                                                                                     |
| ---------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| commentStyle           | `italic` | Highlight style for comments (check `:help highlight-args` for options)                                                                                         |
| keywordStyle           | `italic` | Highlight style for keywords (check `:help highlight-args` for options)                                                                                         |
| functionStyle          | `NONE`   | Highlight style for functions (check `:help highlight-args` for options)                                                                                        |
| variableStyle          | `NONE`   | Highlight style for variables and identifiers (check `:help highlight-args` for options)                                                                        |
| transparent            | `false`  | Enable this to disable setting the background color                                                                                                             |
| hideInactiveStatusline | `false`  | Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**. |
| sidebars               | `{}`     | Set a darker background on sidebar-like windows. For example: `{"qf", "vista_kind", "terminal", "packer"}`                                                      |
| darkSidebar            | `true`   | Sidebar like windows like `NvimTree` get a darker background                                                                                                    |
| darkFloat              | `true`   | Float windows like the lsp diagnostics windows get a darker background.                                                                                         |
| colors                 | `{}`     | You can override specific color groups to use other groups or a hex color                                                                                       |

```lua
-- Example config in Lua
require("onedark").setup({
  functionStyle = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
})
```

```vim
" Example config in VimScript
lua << EOF
require("onedark").setup({
  functionStyle = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
})
EOF
```

### Making `undercurls` work properly in **Tmux**

To have undercurls show up and in color, add the following to your **Tmux** config file:

```sh
# Undercurl
set -g default-terminal "${TERM}"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

## 🌈 Extras

> To generate the configs `make extra`

Extra color configs for **Kitty**, and **Alacritty** can be found in [extras](extras/). To use them, refer to their respective documentation.

## Credit

- [onedark.nvim](https://github.com/monsonjeremy/onedark.nvim) ⚡
- [OneDark-Pro VSCode Theme](https://github.com/Binaryify/OneDark-Pro)
- [gruvbox-flat.nvim](https://github.com/eddyekofo94/gruvbox-flat.nvim)

## 📺 Screenshot

<p align="center">
    <img src="https://imgur.com/vGvbzPR.png" alt="onedark.nvim" />
</p>

### Default

<p align="center">
    <img src="https://imgur.com/8KbGV7r.png" alt="Default fonts" />
</p>

### Normal

```lua
require("onedark").setup({
  commentStyle = "NONE",
  keywordStyle = "NONE",
  functionStyle = "NONE",
  variableStyle = "NONE"
  -- ... your onedark config
})
```

<p align="center">
    <img src="https://imgur.com/QZ0R0qC.png" alt="Normal fonts" />
</p>

### Italic

```lua
require("onedark").setup({
  commentStyle = "italic",
  keywordStyle = "italic",
  functionStyle = "italic",
  variableStyle = "italic"
  -- ... your onedark config
})
```

<p align="center">
    <img src="https://imgur.com/oA5PjUb.png" alt="Italic fonts" />
</p>

### Minimal

```lua
require("onedark").setup({
  hideInactiveStatusline = true,
  darkSidebar = false,
  darkFloat = false
  -- ... your onedark config
})
```

<p align="center">
    <img src="https://imgur.com/SH31zet.png" alt="Minimal" />
</p>

### Telescope

<p align="center">
    <img src="https://imgur.com/2UsnFWV.png" alt="Telescope plugin" />
</p>

## Useful Links

- Terminal: [Kitty](https://sw.kovidgoyal.net/kitty)
- Font: [Ubuntu Mono](https://design.ubuntu.com/font/)
- Dotfiles: [ful1e5/dotfiles](https://github.com/ful1e5/dotfiles)
- Neovim icons: [projekt0n/circles.nvim](https://github.com/projekt0n/circles.nvim)

## Support

<a href="https://www.buymeacoffee.com/Nt7Wg4V" >
  <img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" >
</a>

## Self Promotion

Follow me on **[Twitter](https://twitter.com/ful1e5)**

<!-- Ninja  -->
<p align="center">
  <h1 align="center">(◣_◢)</h1>
</p>

<p align="center">
  <sub>Stop <strong>scrolling</strong>, It's <strong>hurts</strong> me</sub>
</p>
