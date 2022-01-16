local colors = require('onedark').get_colors()
local util = require('onedark.util')

---Generate onedark theme for kitty terminal.
return function()
  local kitty = util.template(
    [[
# onedark colors for Kitty

background ${bg0}
foreground ${fg0}
selection_background ${bg_visual}
selection_foreground ${fg0}
url_color ${green0}
cursor ${blue1}

# Tabs
active_tab_background ${blue0}
active_tab_foreground ${bg0}
inactive_tab_background ${fg0}
inactive_tab_foreground ${bg0}

# Windows Border
active_border_color ${bg_visual}
inactive_border_color ${bg_visual}

# normal
color0 ${black0}
color1 ${red1}
color2 ${green0}
color3 ${yellow1}
color4 ${blue0}
color5 ${purple0}
color6 ${cyan0}
color7 ${fg_dark}

# bright
color8 ${fg_gutter}
color9 ${red1}
color10 ${green0}
color11 ${yellow1}
color12 ${blue0}
color13 ${purple0}
color14 ${cyan0}
color15 ${fg0}

# extended colors
color16 ${orange1}
color17 ${red2}
]],
    colors
  )
  return kitty
end
