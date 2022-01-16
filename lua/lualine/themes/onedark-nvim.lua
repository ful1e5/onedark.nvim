local cfg = require('onedark.config').schema
local util = require('onedark.util')

---@type od.ColorPalette
local c = require('onedark').get_colors(cfg)

local onedark = {
  normal = {
    a = { bg = c.bg1, fg = c.fg0 },
    b = { bg = c.fg_gutter, fg = c.bg1 },
    c = { bg = c.bg1, fg = c.fg_dark },
  },
  insert = {
    a = { bg = c.green0, fg = c.black0 },
    b = { bg = c.fg_gutter, fg = c.green0 },
  },
  command = {
    a = { bg = c.yellow1, fg = c.black0 },
    b = { bg = c.fg_gutter, fg = c.yellow1 },
  },
  visual = {
    a = { bg = c.purple0, fg = c.black0 },
    b = { bg = c.fg_gutter, fg = c.purple0 },
  },
  replace = {
    a = { bg = c.red1, fg = c.black0 },
    b = { bg = c.fg_gutter, fg = c.red1 },
  },
  terminal = {
    a = { bg = c.red2, fg = c.black0 },
    b = { bg = c.fg_gutter, fg = c.red2 },
  },
  inactive = {
    a = { bg = c.bg1, fg = c.cyan0 },
    b = { bg = c.bg1, fg = c.fg_gutter, gui = 'bold' },
    c = { bg = c.bg1, fg = c.fg_gutter },
  },
}

if vim.o.background == 'light' then
  for _, mode in pairs(onedark) do
    for _, section in pairs(mode) do
      if section.bg then
        section.bg = util.get_color(section.bg)
      end
      if section.fg then
        section.fg = util.get_color(section.fg)
      end
    end
  end
end

if cfg.lualine_bold then
  for _, mode in pairs(onedark) do
    mode.a.gui = 'bold'
  end
end

return onedark
