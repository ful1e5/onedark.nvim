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

--- TODO: od.Colors

---@class od.ConfigSchema
---@field public colors table
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
---@field public overrides function(c: table): table
---@field public sidebars table<number, string>
---@field public transparent boolean
---@field public transparent_sidebar boolean
---@field public variable_style od.HighlightStyle

return od
