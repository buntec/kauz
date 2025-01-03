--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require "lush"
local hsl = lush.hsluv

-- Hue        (0 - 360) (each value is a angle around the color wheel)
-- Saturation (0 - 100) (0 is gray, 100 is colored)
-- Lightness  (0 - 100) (0 is black, 100 is white)

local c_darken = 35
local c_sat = 0
local c1 = hsl(70, 50, 75).darken(c_darken).saturate(c_sat)
local c2 = hsl(310, 50, 75).darken(c_darken).saturate(c_sat)
local c3 = hsl(190, 50, 75).darken(c_darken).saturate(c_sat)
local c4 = hsl(230, 50, 75).darken(c_darken).saturate(c_sat)
local c5 = hsl(350, 50, 75).darken(c_darken).saturate(c_sat)

local fg = c1.darken(20)
local bg = c2.lighten(98)

local selection_bg = c3.lighten(50)
local visualmode_bg = c1.lighten(85)
local insertmode_bg = c1.lighten(85)
local comment_fg = c1.desaturate(80).li(50)
local linenr_fg = c4.desaturate(80).li(50)
local whitespace_fg = linenr_fg.li(90).desaturate(50)
local delimiter = c1.desaturate(50).lighten(50)

local gray = hsl(0, 0, 80)

local error = hsl(0, 50, 60)
local warn = hsl(20, 50, 60)
local ok = hsl(140, 50, 60)
local info = hsl(200, 50, 60)
local hint = info

-- terminal colors
local terminal_br = -20 -- how much to brighten the 'br' terminal colors
local black = hsl(0, 0, 30)
local white = hsl(0, 0, 80)
local red = hsl(0, 50, 60)
local green = hsl(140, 50, 60)
local yellow = hsl(40, 50, 60)
local blue = hsl(220, 50, 60)
local magenta = hsl(280, 50, 60)
local cyan = hsl(180, 50, 60)

-- diff colors
local git_add = ok
local git_change = warn
local git_delete = error

-- tmux
local tmux_status_bg = c4.li(80)
local tmux_message_bg = c1.li(85)
local tmux_active_border = c1.li(50)
local tmux_border = tmux_active_border.lighten(50).desaturate(100)
local tmux_mode_bg = c2.lighten(85)

-- snacks
local snacks_indent_scope = c5.li(75)
local snacks_indent = snacks_indent_scope.li(50).de(100)

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn {}, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { bg = c1.lighten(10), fg = fg.lighten(80) }, -- Character under the cursor
    CurSearch { bg = c5.li(25), fg = c5.da(25) }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor { bg = bg, fg = fg }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM {}, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = c4.lighten(85) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine { bg = c4.lighten(95) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { fg = c3 }, -- Directory names (and other special names in listings)
    DiffAdd { bg = git_add.desaturate(60).lighten(60), fg = git_add.lighten(10) }, -- Diff mode: Added line |diff.txt|
    DiffChange { bg = git_change.desaturate(60).li(60), fg = git_change.lighten(10) }, -- Diff mode: Changed line |diff.txt|
    DiffDelete { bg = git_delete.desaturate(60).li(60), fg = git_delete.lighten(10) }, -- Diff mode: Deleted line |diff.txt|
    DiffText {}, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor {}, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg { fg = white.li(50), bg = error }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    Folded {}, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    SignColumn {}, -- Column where |signs| are displayed
    IncSearch { fg = fg, bg = c2.lighten(75) }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr { fg = linenr_fg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr { fg = fg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen { fg = c1 }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea { fg = c1 }, -- Area for messages and cmdline
    MsgSeparator {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg { fg = c2 }, -- |more-prompt|
    NonText { fg = linenr_fg.li(50) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal { bg = bg, fg = fg }, -- Normal text
    NormalFloat { bg = bg.darken(5).desaturate(50), fg = fg }, -- Normal text in floating windows.
    FloatBorder { bg = bg.darken(10).desaturate(50), fg = fg }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows
    -- NormalNC       { }, -- normal text in non-current windows
    Pmenu { fg = fg }, -- Popup menu: Normal item.
    PmenuSel { fg = fg, bg = selection_bg }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    PmenuThumb {}, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { bg = c1.li(75), fg = fg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine { bg = bg, fg = fg }, -- Status line of current window
    StatusLineNC {}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine {}, -- Tab pages line, not active tab page label
    TabLineFill {}, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title { fg = c2 }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual { bg = visualmode_bg }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { fg = warn }, -- Warning messages
    Whitespace { fg = whitespace_fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu { bg = c2.lighten(90) }, -- Current match in 'wildmenu' completion
    WinBar { bg = c2.li(50) }, -- Window bar of current window
    WinBarNC {}, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment { fg = comment_fg, gui = "italic" }, -- Any comment

    Constant { fg = c1 }, -- (*) Any constant
    String { fg = c5 }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    Number { fg = c4 }, --   A number constant: 234, 0xff
    Boolean { fg = c5 }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier { fg = c1 }, -- (*) Any variable name
    Function { fg = c4 }, --   Function name (also: methods for classes)

    Statement { fg = c4 }, -- (*) Any statement
    -- Conditional({  }), --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator { fg = c5 }, --   "sizeof", "+", "*", etc.
    Keyword { fg = c1, gui = "italic" }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc { fg = c2 }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type { fg = c3 }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special { fg = c5 }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter { fg = delimiter }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error { bg = error.lighten(50) }, -- Any erroneous construct
    Todo { bg = warn.lighten(50) }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError { fg = error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { fg = warn }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo { fg = info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint { fg = hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk { fg = ok }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym "@text.literal" { fg = c3 }, -- Comment
    sym "@text.reference" { fg = c1 }, -- Identifier
    sym "@text.title" { fg = c2 }, -- Title
    sym "@text.uri" { fg = c4 }, -- Underlined
    sym "@text.underline" {}, -- Underlined
    sym "@text.todo" { bg = c2 }, -- Todo
    sym "@comment" { fg = comment_fg }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    sym "@string" { fg = c5 }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    sym "@string.special" { fg = c5 }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    sym "@number" { fg = c4 }, -- Number
    sym "@boolean" { fg = c3 }, -- Boolean
    -- sym"@float"             { }, -- Float
    sym "@function" { fg = c1 }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    sym "@function.macro" { fg = c2 }, -- Macro
    sym "@parameter" {}, -- Identifier
    sym "@method" { fg = c3 }, -- Function
    sym "@field" { fg = c4 }, -- Identifier
    sym "@property" {}, -- Identifier
    -- sym"@constructor"       { }, -- Special
    sym "@conditional" { fg = c3 }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    sym "@operator" { fg = c4 }, -- Operator
    sym "@keyword" { fg = c2, gui = "italic" }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    sym "@variable" { fg = c1 }, -- Identifier
    sym "@type" { fg = c3 }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    sym "@namespace" { fg = c3 }, -- Identifier
    sym "@include" { fg = c1, gui = "italic" }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    -- GitSigns
    GitSignsAdd { fg = git_add }, -- diff mode: Added line |diff.txt|
    GitSignsChange { fg = git_change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete { fg = git_delete }, -- diff mode: Deleted line |diff.txt|   --

    -- Neogit
    NeogitDiffAdd { bg = git_add.desaturate(60).lighten(60), fg = git_add.darken(10) },
    NeogitDiffChange { bg = git_change.desaturate(60).lighten(60), fg = git_change.darken(10) },
    NeogitDiffDelete { bg = git_delete.desaturate(60).lighten(60), fg = git_delete.darken(10) },
    NeogitDiffAddHighlight { bg = git_add.desaturate(30).lighten(30), fg = git_add.darken(40) },
    NeogitDiffChangeHighlight { bg = git_change.desaturate(30).lighten(30), fg = git_change.darken(40) },
    NeogitDiffDeleteHighlight { bg = git_delete.desaturate(30).lighten(30), fg = git_delete.darken(40) },

    -- Telescope
    TelescopeResultsDiffChange { bg = git_change.desaturate(60).lighten(60), fg = git_change.darken(10) },
    TelescopeResultsDiffAdd { bg = git_add.desaturate(60).lighten(60), fg = git_add.darken(10) },
    TelescopeResultsDiffDelete { bg = git_delete.desaturate(60).lighten(60), fg = git_delete.darken(10) },
    --TelescopeResultsDiffUntracked  { },

    SnacksIndent { bg = bg, fg = snacks_indent },
    SnacksIndentScope { bg = bg, fg = snacks_indent_scope },

    -- Kitty
    KittyBlack { fg = black },
    KittyBlackBright { fg = black.li(terminal_br) },
    KittyRed { fg = red },
    KittyRedBright { fg = red.li(terminal_br) },
    KittyGreen { fg = green },
    KittyGreenBright { fg = green.li(terminal_br) },
    KittyYellow { fg = yellow },
    KittyYellowBright { fg = yellow.li(terminal_br) },
    KittyBlue { fg = blue },
    KittyBlueBright { fg = blue.li(terminal_br) },
    KittyMagenta { fg = magenta },
    KittyMagentaBright { fg = magenta.li(terminal_br) },
    KittyCyan { fg = cyan },
    KittyCyanBright { fg = cyan.li(terminal_br) },
    KittyWhite { fg = white },
    KittyWhiteBright { fg = white.li(terminal_br) },
    KittyBorderActive { fg = c2 },
    KittyBorderInactive { fg = c2.desaturate(90) },
    KittyUrl { fg = c5 },

    -- Fish
    FishNormal { fg = fg },
    FishCommand { fg = c1 },
    FishKeyword { fg = c4 },
    FishQuote { fg = c1 },
    FishRedirection { fg = c5 },
    FishEnd { fg = c2 },
    FishError { fg = error },
    FishParam { fg = c3 },
    FishComment { fg = comment_fg },
    FishSelection { fg = selection_bg },
    FishOperator { fg = c1 },
    FishEscape { fg = c4 },
    FishAutosuggestion { fg = comment_fg },
    FishPagerProgress { fg = c1 },
    FishPagerPrefix { fg = c2 },
    FishPagerCompletion { fg = c3 },
    FishPagerDescription { fg = c4 },
    FishPagerSelectedBackground { fg = selection_bg },

    FishPurePrompt { fg = c5 },
    FishPureDanger { fg = error },
    FishPureDark { fg = c4.darken(30) },
    FishPureInfo { fg = info },
    FishPureLight { fg = fg },
    FishPureMute { fg = fg.lighten(20) },
    FishPureNormal { fg = fg },
    FishPurePrimary { fg = c4 },
    FishPureSuccess { fg = ok },
    FishPureWarning { fg = warn },

    -- Tmux
    TmuxMode { fg = fg, bg = tmux_mode_bg },
    TmuxMessage { fg = fg, bg = tmux_message_bg },
    TmuxMessageCommand { fg = c5, bg = tmux_message_bg },
    TmuxPaneBorder { fg = tmux_border, bg = bg },
    TmuxPaneActiveBorder { fg = tmux_active_border, bg = bg },
    TmuxStatus { fg = c4, bg = tmux_status_bg },
    TmuxStatusLeft { fg = c3, bg = tmux_status_bg },
    TmuxStatusRight { fg = c1, bg = tmux_status_bg },
    TmuxWindowStatus { fg = c1, bg = tmux_status_bg },
    TmuxWindowStatusActivity { fg = c3, bg = bg },

    -- Lualine
    LualineNormalA { fg = fg, bg = bg.darken(15) },
    LualineNormalB { fg = fg, bg = bg.darken(10) },
    LualineNormalC { fg = fg, bg = bg.darken(5) },
    LualineInsertA { fg = fg, bg = insertmode_bg.darken(15) },
    LualineInsertB { fg = fg, bg = insertmode_bg.darken(10) },
    LualineInsertC { fg = fg, bg = insertmode_bg.darken(5) },
    LualineVisualA { fg = fg, bg = visualmode_bg.darken(15) },
    LualineVisualB { fg = fg, bg = visualmode_bg.darken(10) },
    LualineVisualC { fg = fg, bg = visualmode_bg.darken(5) },
    LualineReplaceA { fg = c5, bg = bg.darken(15) },
    LualineReplaceB { fg = c5, bg = bg.darken(10) },
    LualineReplaceC { fg = c5, bg = bg.darken(5) },
    LualineCommandA { fg = c1, bg = bg.darken(15) },
    LualineCommandB { fg = c1, bg = bg.darken(10) },
    LualineCommandC { fg = c1, bg = bg.darken(5) },
    LualineInactiveA { fg = fg.desaturate(50), bg = bg.darken(15).desaturate(90) },
    LualineInactiveB { fg = fg.desaturate(90), bg = bg.darken(10).desaturate(90) },
    LualineInactiveC { fg = fg.desaturate(90), bg = bg.darken(5).desaturate(90) },

    KauzMetaC1 { fg = c1 },
    KauzMetaC2 { fg = c2 },
    KauzMetaC3 { fg = c3 },
    KauzMetaC4 { fg = c4 },
    KauzMetaC5 { fg = c5 },
    KauzMetaFg { fg = fg },
    KauzMetaBg { fg = bg },
    KauzMetaBlack { fg = black },
    KauzMetaGray { fg = gray },
    KauzMetaWhite { fg = white },
    KauzMetaComment { fg = comment_fg },
    KauzMetaSelection { fg = selection_bg },
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
