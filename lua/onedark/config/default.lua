local types = require('onedark.types')

---@return od.ConfigSchema
return {
  colors = {},
  comment_style = types.od.HighlightStyle.Italic,
  dark_float = false,
  dark_sidebar = true,
  dev = false,
  function_style = types.od.HighlightStyle.None,
  hide_end_of_buffer = true,
  hide_inactive_statusline = true,
  highlight_linenumber = false,
  keyword_style = types.od.HighlightStyle.Italic,
  lualine_bold = false,
  msg_area_style = types.od.HighlightStyle.None,
  overrides = function()
    return {}
  end,
  sidebars = {},
  transparent = false,
  transparent_sidebar = false,
  variable_style = types.od.HighlightStyle.None,
}
