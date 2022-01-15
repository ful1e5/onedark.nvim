local colors = require('onedark.colors').setup()
local util = require('onedark.util')

---Generate onedark theme for kitty terminal.
return function()
  local kitty = util.template(
    [[
# onedark colors for Kitty

background ${bg}
foreground ${fg}
selection_background ${bg_visual}
selection_foreground ${fg}
url_color ${green0}
cursor ${cursor}

# Tabs
active_tab_background ${blue0}
active_tab_foreground ${bg}
inactive_tab_background ${fg}
inactive_tab_foreground ${bg}

# Windows Border
active_border_color ${bg_visual}
inactive_border_color ${bg_visual}

# normal
color0 ${black}
color1 ${red1}
color2 ${green0}
color3 ${yellow1}
color4 ${blue0}
color5 ${purple}
color6 ${cyan}
color7 ${fg_dark}

# bright
color8 ${fg_gutter}
color9 ${red1}
color10 ${green0}
color11 ${yellow1}
color12 ${blue0}
color13 ${purple}
color14 ${cyan}
color15 ${fg}

# extended colors
color16 ${orange1}
color17 ${red2}
]],
    colors
  )
  return kitty
end
