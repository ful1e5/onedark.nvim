local util = require('onedark.util')

local colors = {}

---@param cfg od.ConfigSchema
---@return onedark.ColorScheme
colors.setup = function(cfg)
  -- Color Palette
  ---@class onedark.ColorScheme
  local c = {
    none = 'NONE',
    bg = '#282c34',
    bg2 = '#21252b',
    bg_visual = '#393f4a',
    border = '#646e82',
    bg_highlight = '#2c313a',
    fg = '#abb2bf',
    fg_light = '#adbac7',
    fg_dark = '#798294',
    fg_gutter = '#5c6370',
    dark5 = '#abb2bf',
    blue = '#61afef',
    cyan = '#56b6c2',
    purple = '#c678dd',
    orange = '#d19a66',
    yellow = '#e5c07b',
    yellow2 = '#e2c08d',
    bg_yellow = '#ebd09c',
    green = '#98c379',
    red = '#e86671',
    red1 = '#f65866',
    git = { change = '#e0af68', add = '#109868', delete = '#9A353D', conflict = '#bb7a61' },

    cursor = '#528bff',
    syntax = {
      string = '#98c379',
      variable = '#e06c75',
      operator = '#56b6c2',
      property = '#56b6c2',
      variable_builtin = '#e5c07b',
      comment = '#5c6370',
      tag_attribute = '#e59b4e',
      js = { func = '#e5c07b', variable = '#e5c07b', property = '#61afef' },
      json = { label = '#e06c75' },
      less = { include = '#c678dd', class = '#d19a66' },
      make = { ident = '#e59b4e' },
      php = { punct_bracket = '#e06c75', keyword = '#56b6c2', constructor = '#e5c07b' },
      python = { param = '#e59b4e', builtin_func = '#56b6c2' },
      ruby = { symbol = '#56b6c2', variable = '#61afef', param = '#e5c07b' },
      scss = { property = '#e59b4e', string = '#98c379', type = '#e06c75' },
      bash = { builtin_func = '#56b6c2' },
      sql = { fold = '#e59b4e', keyword = '#c678dd' },
      ts = {
        constructor = '#61afef',
        keyword = '#c678dd',
        method = '#c678dd',
        property = '#e06c75',
        variable = '#e5c07b',
      },
      xml = { attrib = '#e06c75', tag_name = '#e06c75' },
      yaml = { field = '#e06c75' },
    },

    dev_icons = {
      blue = '#519aba',
      green = '#8dc149',
      yellow = '#cbcb41',
      orange = '#e37933',
      red = '#cc3e44',
      purple = '#a074c4',
      pink = '#f55385',
      gray = '#4d5a5e',
    },
  }

  -- useful for 'util.darken()' and 'util.lighten()'
  util.bg = c.bg
  util.fg = c.fg

  --
  -- NOTE: These colors are also configurable
  --

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

  c.git.ignore = c.fg_gutter
  c.black = util.darken(c.bg, 0.8, '#000000')
  c.border_highlight = c.blue

  -- Popups and statusline always get a dark background
  c.bg_popup = c.bg2
  c.bg_statusline = c.bg2

  -- Sidebar and Floats
  c.bg_sidebar = (cfg.transparent_sidebar and c.none) or cfg.dark_sidebar and c.bg2 or c.bg
  c.bg_float = cfg.dark_float and c.bg2 or c.bg
  c.fg_sidebar = c.fg_dark

  -- EndOfBuffer
  c.sidebar_eob = cfg.dark_sidebar and c.bg2 or c.bg
  c.sidebar_eob = cfg.hide_end_of_buffer and c.sidebar_eob or c.fg_gutter
  c.eob = cfg.hide_end_of_buffer and c.bg or c.fg_gutter

  -- LineNumber
  c.bg_linenumber = cfg.highlight_linenumber and c.bg2 or c.bg
  c.fg_linenumber = c.fg_gutter
  c.fg_cursor_linenumber = c.dark5

  -- Search
  c.bg_search = c.bg_yellow
  c.fg_search = c.bg2

  -- Diagnostic
  c.error = c.red
  c.warning = c.yellow
  c.info = c.blue
  c.hint = c.cyan

  util.color_overrides(c, cfg)
  return c
end

return colors
