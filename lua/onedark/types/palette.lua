---@class od.HexColor string

---@class od.GitPalette
---@field public add od.HexColor
---@field public change od.HexColor
---@field public conflict od.HexColor
---@field public delete od.HexColor
---@field public ignore od.HexColor

---@class od.JsSyntaxPalette
---@field public func od.HexColor
---@field public property od.HexColor
---@field public variable od.HexColor

---@class od.JsonSyntaxPalette
---@field public label od.HexColor

---@class od.LessSyntaxPalette
---@field public class od.HexColor
---@field public include od.HexColor

---@class od.MakeSyntaxPalette
---@field public ident od.HexColor

---@class od.PhpSyntaxPalette
---@field public constructor od.HexColor
---@field public keyword od.HexColor
---@field public punct_bracket od.HexColor

---@class od.PythonSyntaxPalette
---@field public builtin_func od.HexColor
---@field public param od.HexColor

---@class od.RubySyntaxPalette
---@field public param od.HexColor
---@field public symbol od.HexColor
---@field public variable od.HexColor

---@class od.SccSyntaxPalette
---@field public property od.HexColor
---@field public string od.HexColor
---@field public type od.HexColor

---@class od.BashSyntaxPalette
---@field public builtin_func od.HexColor

---@class od.SqlSyntaxPalette
---@field public fold od.HexColor
---@field public keyword od.HexColor

---@class od.TypeScriptSyntaxPalette
---@field public constructor od.HexColor
---@field public keyword od.HexColor
---@field public method od.HexColor
---@field public property od.HexColor
---@field public variable od.HexColor

---@class od.XmlSyntaxPalette
---@field public attrib od.HexColor
---@field public tag_name od.HexColor

---@class od.YamlSyntaxPalette
---@field public field od.HexColor

---@class od.SyntaxPalette
---@field public bash od.BashSyntaxPalette
---@field public comment od.HexColor
---@field public js od.JsSyntaxPalette
---@field public json od.JsonSyntaxPalette
---@field public less od.LessSyntaxPalette
---@field public make od.MakeSyntaxPalette
---@field public operator od.HexColor
---@field public php od.PhpSyntaxPalette
---@field public property od.HexColor
---@field public python od.PythonSyntaxPalette
---@field public ruby od.RubySyntaxPalette
---@field public scss od.SccSyntaxPalette
---@field public sql od.SqlSyntaxPalette
---@field public string od.HexColor
---@field public tag_attribute od.HexColor
---@field public ts od.TypeScriptSyntaxPalette
---@field public variable od.HexColor
---@field public variable_builtin od.HexColor
---@field public xml od.XmlSyntaxPalette
---@field public yaml od.YamlSyntaxPalette

---@class od.DevIconsPalette
---@field public blue od.HexColor
---@field public gray od.HexColor
---@field public green od.HexColor
---@field public orange od.HexColor
---@field public pink od.HexColor
---@field public purple od.HexColor
---@field public red od.HexColor
---@field public yellow od.HexColor

---@class od.DiffPalette
---@field public add od.HexColor
---@field public delete od.HexColor
---@field public change od.HexColor
---@field public text od.HexColor

---@class od.GitSignPalette
---@field public add od.HexColor
---@field public change od.HexColor
---@field public delete od.HexColor

---@class od.ColorPalette
---@field public bg od.HexColor
---@field public bg2 od.HexColor
---@field public bg_highlight od.HexColor
---@field public bg_visual od.HexColor
---@field public bg_yellow od.HexColor
---@field public blue od.HexColor
---@field public border od.HexColor
---@field public bg_popup od.HexColor
---@field public bg_statusline od.HexColor
---@field public black od.HexColor
---@field public border_highlight od.HexColor
---@field public diff od.DiffPalette
---@field public git_signs od.GitSignPalette
---@field public cursor od.HexColor
---@field public cyan od.HexColor
---@field public dark5 od.HexColor
---@field public dev_icons od.DevIconsPalette
---@field public fg od.HexColor
---@field public fg_dark od.HexColor
---@field public fg_gutter od.HexColor
---@field public fg_light od.HexColor
---@field public git od.GitPalette
---@field public green od.HexColor
---@field public none "'NONE'"
---@field public orange od.HexColor
---@field public purple od.HexColor
---@field public red od.HexColor
---@field public red1 od.HexColor
---@field public syntax od.SyntaxPalette
---@field public yellow od.HexColor
---@field public yellow2 od.HexColor
-- Sidebar and Floats
---@field public bg_float od.HexColor
---@field public bg_sidebar od.HexColor
---@field public fg_sidebar od.HexColor
-- EndOfBuffer
---@field public eob od.HexColor
---@field public sidebar_eob od.HexColor
-- LineNumber
---@field public bg_linenumber od.HexColor
---@field public fg_cursor_linenumber od.HexColor
---@field public fg_linenumber od.HexColor
-- Search
---@field public bg_search od.HexColor
---@field public fg_search od.HexColor
-- Diagnostic
---@field public error od.HexColor
---@field public hint od.HexColor
---@field public info od.HexColor
---@field public warning od.HexColor
