local colors = require('onedark').get_colors()
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
    background: '${bg0}'
    foreground: '${fg0}'

  # Selection colors
  selection:
    text:       CellForeground
    background: '${bg_visual}'

  # Normal colors
  normal:
    black:   '${black0}'
    red:     '${red1}'
    green:   '${green0}'
    yellow:  '${yellow1}'
    blue:    '${blue0}'
    magenta: '${purple0}'
    cyan:    '${cyan0}'
    white:   '${fg_dark}'

  # Bright colors
  bright:
    black:   '${fg_dark}'
    red:     '${red1}'
    green:   '${green0}'
    yellow:  '${yellow1}'
    blue:    '${blue0}'
    magenta: '${purple0}'
    cyan:    '${cyan0}'
    white:   '${fg0}'

  indexed_colors:
    - { index: 16, color: '${orange1}' }
    - { index: 17, color: '${red2}' }
]],
    alacritty_colors
  )

  return alacritty
end
