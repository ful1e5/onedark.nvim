local colors = require('onedark.colors')
local types = require('onedark.types')
local util = require('onedark.util')

local theme = {}

---@param cfg od.ConfigSchema
---@return od.Highlights
theme.setup = function(cfg)
  cfg = cfg or require('onedark.config').schema

  ---@class od.Highlights
  local hi = {}
  hi.config = cfg
  hi.colors = colors.setup(cfg)
  local c = hi.colors

  local Styles = types.od.HighlightStyle

  ---@class od.Highlights.Base
  hi.base = {
    Comment = { fg = c.fg_dark, style = cfg.comment_style }, -- any comment
    ColorColumn = { bg = c.bg_visual }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.fg_gutter }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.blue1, bg = c.fg0 }, -- character under the cursor
    lCursor = { link = 'Cursor' }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = 'Cursor', -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.blue0 }, -- directory names (and other special names in listings)
    DiffAdd = { fg = c.git.add, bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { fg = c.git.change, bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { fg = c.git.delete, bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.eob }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.bg_visual }, -- the column separating vertically split windows
    Folded = { fg = c.blue0, bg = c.fg_gutter }, -- line used for closed folds
    FoldColumn = { fg = c.fg_gutter, bg = c.bg0 }, -- 'foldcolumn'
    SignColumn = { fg = c.fg_gutter, bg = cfg.transparent and c.none or c.bg_linenumber }, -- column where |signs| are displayed
    SignColumnSB = { fg = c.fg_gutter, bg = c.bg_sidebar }, -- column where |signs| are displayed
    Substitute = { fg = c.black0, bg = c.red1 }, -- |:substitute| replacement text highlighting
    LineNr = {
      fg = cfg.transparent and c.fg0 or c.fg_gutter,
      bg = cfg.transparent and c.none or c.bg_linenumber,
    }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg_highlight }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.orange1, style = Styles.Bold }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg_dark, style = Styles.Bold }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fg_dark, style = cfg.msg_area_style }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blue0 }, -- |more-prompt|
    NonText = { fg = c.eob }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg0 }, -- normal text
    NormalNC = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg0 }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_dark, bg = c.bg_sidebar }, -- normal text in non-current windows
    NormalFloat = { fg = c.fg0, bg = c.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = c.blue0, bg = c.bg_float },
    Pmenu = { fg = c.fg0, bg = c.bg1 }, -- Popup menu: normal item.
    PmenuSel = { fg = c.bg1, bg = util.darken(c.green0, 0.8) }, -- Popup menu: selected item.at
    PmenuSbar = { bg = util.lighten(c.bg1, 0.9) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue0 }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_visual, style = Styles.Bold }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { fg = c.fg_search, bg = c.bg_search }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { fg = c.black0, bg = c.orange1 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    SpecialKey = { fg = c.fg_gutter }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, style = Styles.Undercurl }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, style = Styles.Undercurl }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, style = Styles.Undercurl }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, style = Styles.Undercurl }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg0, bg = c.bg1 }, -- status line of current window
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg0 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { fg = c.fg_gutter, bg = c.bg1 }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black0 }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.black0, bg = c.blue0 }, -- tab pages line, active tab page label
    Title = { fg = c.blue0, style = Styles.Bold }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_visual }, -- Visual mode selection
    VisualNOS = { link = 'Visual' }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bg_visual }, -- current match in 'wildmenu' completion
    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.orange1 }, -- (preferred) any constant
    String = { fg = c.green0 }, --   a string constant: "this is a string"
    Character = { fg = c.green0 }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    Boolean = { fg = c.orange1 }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.red1, style = cfg.variable_style }, -- (preferred) any variable name
    Function = { fg = c.blue0, style = cfg.function_style }, -- function name (also: methods for classes)
    Statement = { fg = c.purple0 }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.red1 }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.cyan0, style = cfg.keyword_style }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.cyan0 }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.yellow1 }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = c.red1 }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = { style = Styles.Underline }, -- (preferred) text that stands out, HTML links
    Bold = { style = Styles.Bold },
    Italic = { style = Styles.Italic },
    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.error }, -- (preferred) any erroneous construct
    Todo = { fg = c.bg0, bg = c.yellow1 }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    qfLineNr = { link = 'CursorLineNr' },
    qfFileName = { fg = c.blue0 },
    htmlTag = { fg = c.purple0, style = Styles.Bold },
    -- mkdHeading = { fg = c.orange1, style = Styles.Bold},
    -- mkdCode = { fg = c.fg0, bg = c.bg1 },
    mkdCodeDelimiter = { fg = c.fg0 },
    mkdCodeStart = { fg = c.yellow1, style = Styles.Bold },
    mkdCodeEnd = { fg = c.yellow1, style = Styles.Bold },
    mkdLink = { fg = c.blue0, style = Styles.Underline },

    markdownHeadingDelimiter = { fg = c.orange1, style = Styles.Bold },
    markdownCode = { fg = c.yellow1 },
    markdownCodeBlock = { fg = c.yellow1 },
    markdownH1 = { fg = c.red1, style = Styles.Bold },
    markdownH2 = { fg = c.blue0, style = Styles.Bold },
    markdownLinkText = { fg = c.blue0, style = Styles.Underline },
    debugPC = { bg = c.bg1 }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { fg = c.info, bg = util.darken(c.info, 0.1) }, -- used for breakpoint colors in terminal-debug
    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references
    LspDiagnosticsDefaultError = { fg = c.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning = { fg = c.warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation = { fg = c.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint = { fg = c.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsVirtualTextError = { fg = c.error, bg = util.darken(c.error, 0.1) }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning = { fg = c.warning, bg = util.darken(c.warning, 0.1) }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation = { fg = c.info, bg = util.darken(c.info, 0.1) }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint = { fg = c.hint, bg = util.darken(c.hint, 0.1) }, -- Used for "Hint" diagnostic virtual text
    LspDiagnosticsUnderlineError = { sp = c.error, style = Styles.Undercurl }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning = { sp = c.warning, style = Styles.Undercurl }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation = { sp = c.info, style = Styles.Undercurl }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint = { sp = c.hint, style = Styles.Undercurl }, -- Used to underline "Hint" diagnostics
    LspSignatureActiveParameter = { fg = c.blue0 }, -- Used to highlight the active parameter in a signature

    DiagnosticError = { link = 'LspDiagnosticsDefaultError' }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticWarn = { link = 'LspDiagnosticsDefaultWarning' }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticInfo = { link = 'LspDiagnosticsDefaultInformation' }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticHint = { link = 'LspDiagnosticsDefaultHint' }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticsVirtualTextError = { link = 'LspDiagnosticsVirtualTextError' }, -- Used for "Error" diagnostic virtual text
    DiagnosticsVirtualTextWarning = { link = 'LspDiagnosticsVirtualTextWarning' }, -- Used for "Warning" diagnostic virtual text
    DiagnosticsVirtualTextInformation = { link = 'LspDiagnosticsVirtualTextInformation' }, -- Used for "Information" diagnostic virtual text
    DiagnosticsVirtualTextHint = { link = 'LspDiagnosticsVirtualTextHint' }, -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError = { link = 'LspDiagnosticsUnderlineError' }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { link = 'LspDiagnosticsUnderlineWarning' }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { link = 'LspDiagnosticsUnderlineInformation' }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { link = 'LspDiagnosticsVirtualTextHint' }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning       = { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError             = { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning           = { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation       = { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint              = { }, -- Used for "Hint" signs in sign column
  }

  ---@class od.Highlights.Plugins
  hi.plugins = {
    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute         = { };    -- (unstable) TODO: docs
    -- TSBoolean           = { };    -- For booleans.
    -- TSCharacter         = { };    -- For characters.
    -- TSComment           = { };    -- For comment blocks.
    TSNote = { fg = c.bg0, bg = c.info },
    TSWarning = { fg = c.bg0, bg = c.warning },
    TSDanger = { fg = c.bg0, bg = c.error },
    TSConstructor = { fg = c.red1 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    -- TSConditional       = { };    -- For keywords related to conditionnals.
    TSConstant = { fg = c.yellow1 }, -- For constants
    -- TSConstBuiltin      = { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError             = { };    -- For syntax/parser errors.
    -- TSException         = { };    -- For exception related keywords.
    TSField = { fg = c.cyan0 }, -- For fields.
    -- TSFloat             = { };    -- For floats.
    -- TSFunction          = { };    -- For function (calls and definitions).
    -- TSFuncBuiltin       = { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro         = { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude = { fg = c.purple0 }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = { fg = c.purple0, style = cfg.keyword_style }, -- For keywords that don't fall in previous categories.
    TSKeywordFunction = { fg = c.purple0, style = cfg.function_style }, -- For keywords used to define a fuction.
    TSLabel = { fg = c.blue0 }, -- For labels: `label:` in C and `:label:` in Lua.
    jsonTSLabel = { fg = c.red0 }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod            = { };    -- For method calls and definitions.
    TSNamespace = { fg = c.red1 }, -- For identifiers referring to modules and namespaces.
    -- TSNone              = { };    -- TODO: docs
    -- TSNumber            = { };    -- For all numbers
    TSOperator = { fg = c.cyan0 }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = { fg = c.red1 }, -- For parameters of a function.
    -- TSParameterReference= { };    -- For references to parameters of a function.
    TSProperty = { fg = c.cyan0 }, -- Same as `TSField`.
    TSPunctDelimiter = { fg = c.fg0 }, -- For delimiters ie: `.`
    TSPunctBracket = { fg = c.fg_dark }, -- For brackets and parens.
    TSPunctSpecial = { fg = c.fg0 }, -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat            = { };    -- For keywords related to loops.
    -- TSString            = { };    -- For strings.
    TSStringRegex = { fg = c.orange1 }, -- For regexes.
    TSStringEscape = { fg = c.red1 }, -- For escape characters within a string.
    -- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
    -- TSType              = { };    -- For types.
    -- TSTypeBuiltin       = { };    -- For builtin types.
    TSVariable = { fg = c.red0, style = cfg.variable_style }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = { fg = c.yellow1 }, -- Variable names that are defined by the languages, like `this` or `self`.
    TSTag = { fg = c.red1 }, -- Tags like html tag names.
    TSTagAttribute = { fg = c.orange0 },
    -- TSTagDelimiter      = { };    -- Tag delimiter like `<` `>` `/`
    -- TSText              = { };    -- For strings considered text in a markup language.
    -- TSEmphasis          = { };    -- For text to be represented with emphasis.
    -- TSUnderline         = { };    -- For text to be represented with an underline.
    -- TSStrike            = { };    -- For strikethrough text.
    -- TSTitle             = { };    -- Text that is part of a title.
    -- TSLiteral           = { };    -- Literal text.
    -- TSURI               = { };    -- Any URI like a link or email.

    Quote = { fg = c.green0 },

    -- javascript
    javascriptTSFunction = { fg = c.yellow1 }, -- For function (calls and definitions).
    javascriptTSVariable = { fg = c.yellow1 },
    javascriptTSProperty = { fg = c.blue0 },

    -- css
    cssStringQQ = { fg = c.green0, style = Styles.Underline },
    cssBraces = { fg = c.fg0 },

    -- less
    lessInclude = { fg = c.purple0 },
    lessClass = { fg = c.orange1 },

    -- make
    makeIdent = { fg = c.orange0 },

    -- markdown
    TSURI = { fg = c.blue0, style = Styles.Underline },
    TSLiteral = { fg = c.red1 },
    TSTextReference = { fg = c.blue0 },
    TSTitle = { fg = c.red1, style = Styles.Bold },
    TSEmphasis = { style = Styles.Italic },
    TSStrong = { style = Styles.Bold },

    -- php
    phpTSPunctBracket = { fg = c.red0 },
    phpTSKeyword = { fg = c.cyan0 },
    phpTSConstructor = { fg = c.yellow1 },

    -- python
    pythonTSParameter = { fg = c.orange0 },
    pythonTSFuncBuiltin = { fg = c.cyan0 },

    -- ruby
    rubyTSSymbol = { fg = c.cyan0 },
    rubyTSVariable = { fg = c.blue0 },
    rubyTSParameter = { fg = c.yellow1 },

    -- scss
    scssTSProperty = { fg = c.orange0 },
    scssTSString = { fg = c.green0, style = Styles.Underline },
    scssTSType = { fg = c.red0 },

    -- bash shell
    bashTSFuncBuiltin = { fg = c.cyan0 },

    -- sql
    sqlFold = { fg = c.orange0 },
    sqlKeyword = { fg = c.purple0 },

    -- typescript
    typescriptTSConstructor = { fg = c.blue0 },
    typescriptTSKeywordOperator = { fg = c.purple0 },
    typescriptTSMethod = { fg = c.purple0 },
    typescriptTSProperty = { fg = c.red0 },
    typescriptTSVariable = { fg = c.yellow1 },

    -- xml
    xmlAttrib = { fg = c.red0 },
    xmlTag = { fg = c.fg0 },
    xmlTagName = { fg = c.red0 },
    --
    -- yaml
    yamlTSField = { fg = c.red0 },

    -- LspTrouble
    LspTroubleText = { fg = c.fg_dark },
    LspTroubleCount = { fg = c.purple0, bg = c.fg_gutter },
    LspTroubleNormal = { fg = c.fg_dark, bg = c.bg1 },

    -- Illuminate
    illuminatedWord = { bg = c.fg_gutter },
    illuminatedCurWord = { bg = c.fg_gutter },

    -- diff
    diffAdded = { link = 'DiffAdd' },
    diffChanged = { link = 'DiffChange' },
    diffRemoved = { link = 'DiffDelete' },
    diffOldFile = { fg = c.yellow1 },
    diffNewFile = { fg = c.orange1 },
    diffFile = { fg = c.blue0 },
    diffLine = { fg = c.fg_gutter },
    diffIndexLine = { fg = c.purple0 },

    -- Neogit
    NeogitBranch = { fg = c.purple0 },
    NeogitRemote = { fg = c.purple0 },
    NeogitHunkHeader = { fg = c.fg0, bg = c.bg_highlight },
    NeogitHunkHeaderHighlight = { fg = c.blue0, bg = c.fg_gutter },
    NeogitDiffContextHighlight = { fg = c.fg_dark, bg = util.darken(c.fg_gutter, 0.5) },
    NeogitDiffAddHighlight = { link = 'DiffAdd' },
    NeogitDiffDeleteHighlight = { link = 'DiffDelete' },

    -- Hop
    HopNextKey = { fg = c.purple0, style = Styles.Bold },
    HopNextKey1 = { fg = c.blue0, style = Styles.Bold },
    HopNextKey2 = { fg = util.darken(c.blue0, 0.8) },
    HopUnmatched = { fg = c.fg_dark },

    -- GitGutter
    GitGutterAdd = { fg = c.git_signs.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.git_signs.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.git_signs.delete }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = { fg = c.git_signs.add, bg = c.bg_linenumber }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.git_signs.change, bg = c.bg_linenumber }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.git_signs.delete, bg = c.bg_linenumber }, -- diff mode: Deleted line |diff.txt|
    GitSignsCurrentLineBlame = { fg = util.darken(c.fg_dark, 0.6) }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeBorder = { fg = util.darken(c.fg0, 0.5), bg = c.bg_float },
    TelescopeNormal = { bg = cfg.transparent and c.none or c.bg_float },
    TelescopeMatching = { fg = c.fg_light, style = Styles.Bold },
    TelescopePromptPrefix = { fg = c.fg0, style = Styles.Bold },
    TelescopePromptCounter = { fg = c.blue0 },
    TelescopeMultiSelection = { fg = c.fg_dark },
    TelescopeSelection = { bg = c.bg_visual },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg_light, bg = c.bg_sidebar },
    NvimTreeEndOfBuffer = { fg = c.sidebar_eob },
    NvimTreeRootFolder = { fg = c.fg_light, style = Styles.Bold, bg = c.bg_sidebar },
    NvimTreeGitDirty = { fg = c.yellow0 },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeGitRenamed = { fg = c.purple0 },
    NvimTreeSpecialFile = { fg = c.yellow1, style = Styles.Underline },
    NvimTreeIndentMarker = { fg = c.fg_gutter },
    NvimTreeImageFile = { fg = c.fg_dark },
    NvimTreeSymlink = { fg = c.purple0 },
    NvimTreeFolderName = { fg = c.fg_light },
    NvimTreeOpenedFolderName = { fg = c.fg_light, style = Styles.Bold },
    NvimTreeEmptyFolderName = { fg = c.fg_dark },
    LspDiagnosticsError = { fg = c.error },
    LspDiagnosticsWarning = { fg = c.warning },
    LspDiagnosticsInformation = { fg = c.info },
    LspDiagnosticsHint = { fg = c.hint },

    -- Dashboard
    DashboardShortCut = { fg = c.purple0 },
    DashboardHeader = { fg = c.red1 },
    DashboardCenter = { fg = c.blue0 },
    DashboardFooter = { fg = c.yellow1, style = Styles.Italic },

    -- glyph palette
    GlyphPalette1 = { fg = c.red2 },
    GlyphPalette2 = { fg = c.green0 },
    GlyphPalette3 = { fg = c.yellow1 },
    GlyphPalette4 = { fg = c.blue0 },
    GlyphPalette6 = { fg = c.green0 },
    GlyphPalette7 = { fg = c.fg0 },
    GlyphPalette9 = { fg = c.red1 },

    -- WhichKey
    WhichKey = { fg = c.yellow1 },
    WhichKeyGroup = { fg = c.blue0 },
    WhichKeyDesc = { fg = c.red1 },
    WhichKeySeperator = { fg = c.fg_gutter },
    WhichKeySeparator = { fg = c.fg_gutter },
    WhichKeyFloat = { bg = c.bg1 },
    WhichKeyValue = { fg = c.fg0 },

    -- LspSaga
    DiagnosticError = { fg = c.error },
    DiagnosticWarning = { fg = c.warning },
    DiagnosticInformation = { fg = c.info },
    DiagnosticHint = { fg = c.hint },

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.green0 },
    healthWarning = { fg = c.warning },

    -- Barbar
    -- reference: https://github.com/romgrk/barbar.nvim#highlighting

    -- status:
    -- Current: current buffer
    -- Visible: visible but not current buffer
    -- Inactive: invisible but not current buffer

    -- part:
    -- Icon: filetype icon
    -- Index: buffer index
    -- Mod: when modified
    -- Sign: the separator between buffers
    -- Target: letter in buffer-picking mod

    BufferTabpageFill = { fg = c.bg_visual, bg = c.bg1 }, -- filler after the buffer section

    BufferCurrent = { fg = c.fg0, bg = c.bg0 },
    BufferCurrentIndex = { fg = c.blue0, bg = c.bg0 },
    BufferCurrentMod = { fg = c.yellow1, bg = c.bg0 },
    BufferCurrentSign = { link = 'BufferCurrentIndex' },
    BufferCurrentTarget = { fg = c.red1, bg = c.bg0, style = Styles.Bold },

    BufferVisible = { fg = util.darken(c.fg0, 0.8), bg = c.bg0 },
    BufferVisibleIndex = { link = 'BufferCurrentIndex' },
    BufferVisibleMod = { link = 'BufferVisibleMod' },
    BufferVisibleSign = { fg = util.darken(c.blue0, 0.8), bg = c.bg0 },
    BufferVisibleTarget = { link = 'BufferCurrentTarget' },

    BufferInactive = { fg = util.darken(c.fg0, 0.5), bg = c.bg1 },
    BufferInactiveIndex = { fg = util.darken(c.fg0, 0.25), bg = c.bg1 },
    BufferInactiveMod = { fg = util.darken(c.yellow1, 0.7), bg = c.bg1 },
    BufferInactiveSign = { link = 'BufferInactiveIndex' },
    BufferInactiveTarget = { fg = c.red1, bg = c.bg1, style = Styles.Bold },

    -- ALE
    ALEWarningSign = { fg = c.yellow1 },
    ALEErrorSign = { fg = c.red1 },

    -- Cmp
    CmpItemAbbrDeprecatedDefault = { fg = util.darken(c.fg0, 0.4) },
    CmpItemAbbrDefault = { link = 'CmpItemAbbrDeprecatedDefault' },
    CmpItemKindDefault = { fg = util.darken(c.fg0, 0.8) },
    CmpItemMenuDefault = { link = 'CmpItemKindDefault' },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, style = Styles.Strikethrough },
    CmpItemAbbrMatch = { fg = c.green0 },
    CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' },

    -- Cmp Item Kind
    CmpItemKindColorDefault = { fg = c.red2 },
    CmpItemKindPropertyDefault = { fg = c.cyan0 },
    CmpItemKindSnippetDefault = { fg = c.green0 },

    CmpItemKindVariableDefault = { fg = c.red0 },
    CmpItemKindClassDefault = { link = 'CmpItemKindVariableDefault' },
    CmpItemKindEnumDefault = { link = 'CmpItemKindVariableDefault' },
    CmpItemKindInterfaceDefault = { link = 'CmpItemKindVariableDefault' },
    CmpItemKindTextDefault = { link = 'CmpItemKindVariableDefault' },

    CmpItemKindKeywordDefault = { fg = c.cyan0 },
    CmpItemKindFieldDefault = { link = 'CmpItemKindKeywordDefault' },
    CmpItemKindUnitDefault = { link = 'CmpItemKindKeywordDefault' },
    CmpItemKindValueDefault = { link = 'CmpItemKindKeywordDefault' },

    CmpItemKindFileDefault = { fg = c.orange1 },
    CmpItemKindFolderDefault = { link = 'CmpItemKindFileDefault' },

    CmpItemKindFunctionDefault = { fg = c.purple0 },
    CmpItemKindConstructorDefault = { link = 'CmpItemKindFunctionDefault' },
    CmpItemKindEventDefault = { link = 'CmpItemKindFunctionDefault' },
    CmpItemKindMethodDefault = { link = 'CmpItemKindFunctionDefault' },

    CmpItemKindOperatorDefault = { fg = c.cyan0 },
    CmpItemKindEnumMemberDefault = { link = 'CmpItemKindOperatorDefault' },
    CmpItemKindReferenceDefault = { link = 'CmpItemKindOperatorDefault' },
    CmpItemKindTypeParameter = { link = 'CmpItemKindOperatorDefault' },

    CmpItemKindConstantDefault = { fg = c.yellow1 },
    CmpItemKindModuleDefault = { link = 'CmpItemKindConstantDefault' },
    CmpItemKindStructDefault = { link = 'CmpItemKindConstantDefault' },
    CmpItemKindTypeParameterDefault = { link = 'CmpItemKindConstantDefault' },

    -- nvim-notify
    NotifyERRORTitle = { fg = util.darken(c.error, 0.9) },
    NotifyWARNTitle = { fg = util.darken(c.warning, 0.9) },
    NotifyINFOTitle = { fg = util.darken(c.green0, 0.9) },
    NotifyDEBUGTitle = { fg = util.darken(c.fg0, 0.7) },
    NotifyTRACETitle = { fg = util.darken(c.purple0, 0.9) },

    NotifyERRORIcon = { link = 'NotifyERRORTitle' },
    NotifyWARNIcon = { link = 'NotifyWARNTitle' },
    NotifyINFOIcon = { link = 'NotifyINFOTitle' },
    NotifyDEBUGIcon = { link = 'NotifyDEBUGTitle' },
    NotifyTRACEIcon = { link = 'NotifyTRACETitle' },

    NotifyERRORBorder = { link = 'NotifyERRORTitle' },
    NotifyWARNBorder = { link = 'NotifyWARNTitle' },
    NotifyINFOBorder = { link = 'NotifyINFOTitle' },
    NotifyDEBUGBorder = { link = 'NotifyDEBUGTitle' },
    NotifyTRACEBorder = { link = 'NotifyTRACETitle' },

    NotifyERRORBody = { fg = util.lighten(c.error, 0.1) },
    NotifyWARNBody = { fg = util.lighten(c.warning, 0.1) },
    NotifyINFOBody = { fg = util.lighten(c.green0, 0.1) },
    NotifyDEBUGBody = { link = 'NotifyDEBUGTitle' },
    NotifyTRACEBody = { fg = util.lighten(c.purple0, 0.1) },

    -- Coc
    CocErrorSign = { link = 'ErrorMsg' },
    CocWarningSign = { link = 'WarningMsg' },
    CocInfoSign = { link = 'DiagnosticInfo' },
    CocHintSign = { link = 'DiagnosticHint' },
    CocErrorFloat = { link = 'ErrorMsg' },
    CocWarningFloat = { link = 'WarningMsg' },
    CocInfoFloat = { link = 'DiagnosticInfo' },
    CocHintFloat = { link = 'DiagnosticHint' },
    CocDiagnosticsError = { link = 'ErrorMsg' },
    CocDiagnosticsWarning = { link = 'WarningMsg' },
    CocDiagnosticsInfo = { link = 'DiagnosticInfo' },
    CocDiagnosticsHint = { link = 'DiagnosticHint' },
    CocSelectedText = { fg = c.red1 },
    CocCodeLens = { fg = c.fg_dark },

    CocErrorHighlight = { link = 'LspDiagnosticsUnderlineError' },
    CocWarningHighlight = { link = 'LspDiagnosticsUnderlineWarning' },
    CocInfoHighlight = { link = 'LspDiagnosticsUnderlineInformation' },
    CocHintHighlight = { link = 'LspDiagnosticsUnderlineHint' },

    CocHighlightText = { bg = c.bg_visual },
    CocUnderline = { style = Styles.Undercurl },

    -- Indent blankline
    IndentBlanklineChar = { fg = c.bg_visual, style = Styles.NoCombine },

    -- Lightspeed
    LightspeedLabel = { fg = c.orange0, style = Styles.Bold },
    LightspeedLabelOverlapped = { fg = c.red0, style = Styles.Bold },
    LightspeedLabelDistant = { fg = c.purple0 },
    LightspeedLabelDistantOverlapped = { fg = c.purple0, style = Styles.Underline },
    LightspeedShortcut = { fg = c.green0, style = string.format('%s,%s', Styles.Bold, Styles.Underline) },
    LightspeedMaskedChar = { fg = c.red0, style = Styles.Bold },
    LightspeedUnlabeledMatch = { fg = c.blue0, style = Styles.Bold },
    LightspeedOneCharMatch = { link = 'LightspeedShortcut' },
    LightspeedPendingOpArea = { fg = c.yellow0 },
  }

  if cfg.hide_inactive_statusline then
    hi.base.StatusLineNC = { fg = c.bg0, bg = c.bg0, sp = c.bg_visual, style = Styles.Underline }
  end

  return hi
end

return theme
