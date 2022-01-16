local util = require('onedark.util')

local colors = {}

---@param cfg od.ConfigSchema
---@return od.ColorPalette
colors.setup = function(cfg)
  cfg = cfg or require('onedark.config').schema

  ---@type od.ColorPalette
  local c = {
    none = 'NONE',
    bg0 = '#282c34',
    bg1 = '#21252b',
    bg_highlight = '#2c313a',
    bg_visual = '#393f4a',
    black0 = '#20232A',
    blue0 = '#61afef',
    blue1 = '#528bff',
    cyan0 = '#56b6c2',
    fg0 = '#abb2bf',
    fg_dark = '#798294',
    fg_gutter = '#5c6370',
    fg_light = '#adbac7',
    green0 = '#98c379',
    orange0 = '#e59b4e',
    orange1 = '#d19a66',
    purple0 = '#c678dd',
    red0 = '#e06c75',
    red1 = '#e86671',
    red2 = '#f65866',
    yellow0 = '#ebd09c',
    yellow1 = '#e5c07b',
    dev_icons = {
      blue = '#519aba',
      green0 = '#8dc149',
      yellow = '#cbcb41',
      orange = '#e37933',
      red = '#cc3e44',
      purple = '#a074c4',
      pink = '#f55385',
      gray = '#4d5a5e',
    },
  }

  -- useful for 'util.darken()' and 'util.lighten()'
  util.bg = c.bg0
  util.fg = c.fg0

  --
  -- NOTE: These colors are also configurable
  --

  c.git = {
    change = '#e0af68',
    add = '#109868',
    delete = '#9a353d',
    conflict = '#bb7a61',
    ignore = c.fg_gutter,
  }
  c.diff = {
    add = util.darken(c.git.add, 0.15),
    delete = util.darken(c.git.delete, 0.15),
    change = util.darken(c.git.change, 0.15),
    text = util.darken(c.git.change, 0.25),
  }
  c.git_signs = {
    add = util.brighten(c.git.add, 0.2),
    change = util.brighten(c.git.change, 0.2),
    delete = util.brighten(c.git.delete, 0.2),
  }

  -- Sidebar and Floats
  c.bg_sidebar = (cfg.transparent_sidebar and c.none) or cfg.dark_sidebar and c.bg1 or c.bg0
  c.bg_float = cfg.dark_float and c.bg1 or c.bg0

  -- EndOfBuffer
  c.sidebar_eob = cfg.dark_sidebar and c.bg1 or c.bg0
  c.sidebar_eob = cfg.hide_end_of_buffer and c.sidebar_eob or c.fg_gutter
  c.eob = cfg.hide_end_of_buffer and c.bg0 or c.fg_gutter

  -- LineNumber
  c.bg_linenumber = cfg.highlight_linenumber and c.bg1 or c.bg0

  -- Search
  c.bg_search = c.yellow0
  c.fg_search = c.bg1

  -- Diagnostic
  c.error = c.red1
  c.warning = c.yellow1
  c.info = c.blue0
  c.hint = c.cyan0

  c = util.color_overrides(c, cfg.colors)
  return c
end

return colors
