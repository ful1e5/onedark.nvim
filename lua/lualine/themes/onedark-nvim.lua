local cfg = require('onedark.config').schema
local colors = require('onedark.colors').setup(cfg)
local util = require('onedark.util')

local onedark = {
  normal = {
    a = { bg = colors.bg2, fg = colors.fg },
    b = { bg = colors.fg_gutter, fg = colors.bg2 },
    c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
  },
  insert = {
    a = { bg = colors.green0, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.green0 },
  },
  command = {
    a = { bg = colors.yellow1, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.yellow1 },
  },
  visual = {
    a = { bg = colors.purple, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.purple },
  },
  replace = {
    a = { bg = colors.red1, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.red1 },
  },
  terminal = {
    a = { bg = colors.red2, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.red2 },
  },
  inactive = {
    a = { bg = colors.bg_statusline, fg = colors.cyan },
    b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = 'bold' },
    c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
  },
}

if vim.o.background == 'light' then
  for _, mode in pairs(onedark) do
    for _, section in pairs(mode) do
      if section.bg then
        section.bg = util.getColor(section.bg)
      end
      if section.fg then
        section.fg = util.getColor(section.fg)
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
