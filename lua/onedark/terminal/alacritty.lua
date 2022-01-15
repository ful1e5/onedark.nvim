local colors = require('onedark.colors').setup()
local util = require('onedark.util')

---Generate onedark theme for Alacritty terminal.
return function()
  local alacritty_colors = {}
  for k, v in pairs(colors) do
    if type(v) == 'string' then
      alacritty_colors[k] = v:gsub('^#', '0x')
    end
  end

  local alacritty = util.template(
    [[
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
    red:     '${red1}'
    green:   '${green0}'
    yellow:  '${yellow1}'
    blue:    '${blue0}'
    magenta: '${purple}'
    cyan:    '${cyan}'
    white:   '${fg_dark}'

  # Bright colors
  bright:
    black:   '${bg2}'
    red:     '${red1}'
    green:   '${green0}'
    yellow:  '${yellow1}'
    blue:    '${blue0}'
    magenta: '${purple}'
    cyan:    '${cyan}'
    white:   '${fg}'

  indexed_colors:
    - { index: 16, color: '${orange1}' }
    - { index: 17, color: '${red2}' }
]],
    alacritty_colors
  )

  return alacritty
end
