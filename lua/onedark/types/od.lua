---@diagnostic disable: duplicate-doc-class
local od = {}

---@alias od.HighlightStyle "'NONE'" | "'bold'" | "'underline'" | "'undercurl'" | "'undercurl'" | "'inverse'" | "'italic'" | "'stanout'" | "'nocombine'" | "'strikethrough'"
od.HighlightStyle = {}
od.HighlightStyle.None = 'NONE'
od.HighlightStyle.Bold = 'bold'
od.HighlightStyle.Underline = 'underline'
od.HighlightStyle.Undercurl = 'undercurl'
od.HighlightStyle.Inverse = 'inverse'
od.HighlightStyle.Italic = 'italic'
od.HighlightStyle.Stanout = 'stanout'
od.HighlightStyle.NoCombine = 'nocombine'
od.HighlightStyle.Strikethrough = 'strikethrough'

---@alias od.TerminalConf "'conf'" | "'yml'"
od.TerminalConf = {}
od.TerminalConf.kitty = 'conf'
od.TerminalConf.alacritty = 'yml'

---@class od.Highlight
---Foreground Color
---@field public fg od.HexColor|nil
---Background Color
---@field public bg od.HexColor|nil
---Style Color
---@field public sp od.HexColor|nil
---Highlight Style
---@field public style od.HighlightStyle|nil

---@class od.LinkHighlight
---Existing Highlight
---@field public link string

---@class od.ConfigSchema
---@field public colors od.ColorPalette
---@field public comment_style od.HighlightStyle
---@field public dark_float boolean
---@field public dark_sidebar boolean
---@field public dev boolean
---@field public function_style od.HighlightStyle
---@field public hide_end_of_buffer boolean
---@field public hide_inactive_statusline boolean
---@field public highlight_linenumber boolean
---@field public keyword_style od.HighlightStyle
---@field public lualine_bold boolean
---@field public msg_area_style od.HighlightStyle
---@field public overrides function(c: od.ColorPalette): od.Highlights
---@field public sidebars table<number, string>
---@field public transparent boolean
---@field public transparent_sidebar boolean
---@field public variable_style od.HighlightStyle

return od
