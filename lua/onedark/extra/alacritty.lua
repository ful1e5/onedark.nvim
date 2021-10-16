local util = require("onedark.util")
local config_module = require("onedark.config")

local M = {}

function M.alacritty(config)
  config = config or config_module.config
  config.transform_colors = true
  local colors = require("onedark.colors").setup(config)

  local alacritty_colors = {}
  for k, v in pairs(colors) do
    if type(v) == "string" then alacritty_colors[k] = v:gsub("^#", "0x") end
  end

  local alacritty = util.template([[
# onedark Alacritty Colors
colors:
  # Default colors
  primary:
    background: '${bg}'
    foreground: '${fg}'

  # Selection colors
  selection:
    text:       CellForeground
    background: '${bg_visual}'

  # Normal colors
  normal:
    black:   '${black}'
    red:     '${red}'
    green:   '${green}'
    yellow:  '${yellow}'
    blue:    '${blue}'
    magenta: '${purple}'
    cyan:    '${cyan}'
    white:   '${fg_dark}'

  # Bright colors
  bright:
    black:   '${bg2}'
    red:     '${red}'
    green:   '${green}'
    yellow:  '${yellow}'
    blue:    '${blue}'
    magenta: '${purple}'
    cyan:    '${cyan}'
    white:   '${fg}'

  indexed_colors:
    - { index: 16, color: '${orange}' }
    - { index: 17, color: '${red1}' }
]], alacritty_colors)

  return alacritty
end

return M
