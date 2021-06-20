local util = require("onedark.util")
local configModule = require("onedark.config")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or configModule.config

  -- Color Palette
  ---@class ColorScheme
  local colors = {
    none = "NONE",
    bg = "#282c34",
    bg2 = "#21252b",
    bg_visual = "#393f4a",
    border = "#646e82",
    bg_highlight = "#2c313a",
    fg = "#abb2bf",
    fg_light = "#adbac7",
    fg_dark = "#798294",
    fg_gutter = "#5c6370",
    dark5 = "#abb2bf",
    blue = "#61afef",
    cyan = "#56b6c2",
    purple = "#c678dd",
    orange = "#d19a66",
    yellow = "#e0af68",
    yellow2 = "#e2c08d",
    bg_yellow = "#ebd09c",
    green = "#98c379",
    red = "#e86671",
    red1 = "#f65866",
    git = {change = "#e0af68", add = "#109868", delete = "#9A353D", conflict = "#bb7a61"},
    gitSigns = {change = "#e0af68", add = "#109868", delete = "#9A353D"}
  }

  util.bg = colors.bg

  colors.diff = {
    add = util.darken(colors.git.add, 0.15),
    delete = util.darken(colors.git.delete, 0.15),
    change = util.darken(colors.git.change, 0.15),
    text = colors.fg_gutter
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2)
  }

  colors.git.ignore = colors.fg_gutter
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.blue

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg2
  colors.bg_statusline = colors.bg2

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.darkSidebar and colors.bg2 or colors.bg
  colors.bg_sidebar = config.transparent and colors.none or colors.bg_sidebar
  colors.bg_float = config.darkFloat and colors.bg2 or colors.bg

  colors.bg_search = colors.bg_yellow
  colors.fg_search = colors.bg2
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.cyan

  util.color_overrides(colors, config)

  return colors
end

return M
