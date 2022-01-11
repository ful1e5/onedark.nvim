local config = require('onedark.config').config
local colors = require('onedark.colors').setup(config)
local util = require('onedark.util')

local onedark = colors.lualine

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

if config.lualine_bold then
  for _, mode in pairs(onedark) do
    mode.a.gui = 'bold'
  end
end

return onedark
