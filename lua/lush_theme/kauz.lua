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

local lush = require("lush")
local hsl = lush.hsluv

-- Hue        (0 - 360) (each value is a angle around the color wheel)
-- Saturation (0 - 100) (0 is gray, 100 is colored)
-- Lightness  (0 - 100) (0 is black, 100 is white)

local saturation = 50
local lightness = 75
local alpha = 30

local c1 = hsl(40, saturation, lightness).rotate(alpha) -- yellow
local c2 = hsl(160, saturation, lightness).rotate(alpha) -- blue
local c3 = hsl(200, saturation, lightness).rotate(alpha) -- purple
local c4 = hsl(280, saturation, lightness).rotate(alpha) -- pink
local c5 = hsl(320, saturation, lightness).rotate(alpha) -- orange

local normaltext = hsl(0, 0, lightness)
local fg = normaltext
local bg = c3.darken(83)

local gray = hsl(0, 0, 60)
local black = hsl(0, 0, 15)
local white = hsl(0, 0, 85)

local selection = c3.darken(60)
local visualmode = c3.darken(50)
local comment = c3.desaturate(50).darken(50)
local linenr = gray.darken(50)
local whitespace = linenr

local error = hsl(0, 50, 50)
local warn = hsl(20, 50, 50)
local ok = hsl(140, 50, 50)
local info = hsl(200, 50, 50)
local hint = info

-- terminal colors
local red = hsl(0, 50, 50)
local green = hsl(140, 50, 50)
local yellow = hsl(40, 50, 50)
local blue = hsl(220, 50, 50)
local magenta = hsl(280, 50, 50)
local cyan = hsl(180, 50, 50)
local terminal_br = 20 -- how much to brighten the 'br' terminal colors

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
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ bg = c1, fg = normaltext }), -- Character under the cursor
		CurSearch({}), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor({}), -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM({}), -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn({}), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine({}), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = c3 }), -- Directory names (and other special names in listings)
		-- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
		-- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
		-- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
		-- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		-- ErrorMsg       { }, -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		SignColumn({}), -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute     { }, -- |:substitute| replacement text highlighting
		LineNr({ fg = linenr }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		-- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		-- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({ fg = c1 }), -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ fg = c2 }), -- |more-prompt|
		NonText({ fg = linenr }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ bg = bg, fg = normaltext }), -- Normal text
		-- NormalFloat    { }, -- Normal text in floating windows.
		-- FloatBorder    { }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows
		-- NormalNC       { }, -- normal text in non-current windows
		Pmenu({ fg = normaltext }), -- Popup menu: Normal item.
		-- PmenuSel       { }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ bg = selection }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		-- StatusLine     { }, -- Status line of current window
		-- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		Title({ fg = c2 }), -- Titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = visualmode }), -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = warn }), -- Warning messages
		Whitespace({ fg = whitespace }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu({ bg = c2 }), -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment({ fg = comment, gui = "italic" }), -- Any comment

		-- Constant       { }, -- (*) Any constant
		String({ fg = c1 }), --   A string constant: "this is a string"
		-- Character      { }, --   A character constant: 'c', '\n'
		Number({ fg = c5 }), --   A number constant: 234, 0xff
		Boolean({ fg = c1 }), --   A boolean constant: TRUE, false
		-- Float          { }, --   A floating point constant: 2.3e10

		Identifier({ fg = c2 }), -- (*) Any variable name
		Function({ fg = c3 }), --   Function name (also: methods for classes)

		Statement({ fg = c1 }), -- (*) Any statement
		-- Conditional({  }), --   if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --   case, default, etc.
		-- Operator       { }, --   "sizeof", "+", "*", etc.
		-- Keyword        { }, --   any other keyword
		-- Exception      { }, --   try, catch, throw

		PreProc({ fg = c2 }), -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = c3 }), -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		-- Structure      { }, --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special({ fg = c4 }), -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		-- Tag            { }, --   You can use CTRL-] on this
		Delimiter({ fg = gray }), --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		-- Error          { }, -- Any erroneous construct
		Todo({ bg = c2 }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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
		DiagnosticError({ fg = error }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = warn }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = info }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = hint }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = ok }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
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

		sym("@text.literal")({ fg = c3 }), -- Comment
		sym("@text.reference")({ fg = c1 }), -- Identifier
		sym("@text.title")({ fg = c2 }), -- Title
		sym("@text.uri")({ fg = c4 }), -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		sym("@comment")({ fg = comment }), -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		sym("@string.special")({ fg = c5 }), -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		sym("@function")({ fg = c1 }), -- Function
		-- sym"@function.builtin"  { }, -- Special
		sym("@function.macro")({ fg = c2 }), -- Macro
		sym("@parameter")({}), -- Identifier
		sym("@method")({ fg = c3 }), -- Function
		sym("@field")({ fg = c4 }), -- Identifier
		sym("@property")({}), -- Identifier
		-- sym"@constructor"       { }, -- Special
		sym("@conditional")({ fg = c3 }), -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		sym("@keyword")({ fg = c4, gui = "italic" }), -- Keyword
		-- sym"@exception"         { }, -- Exception
		sym("@variable")({ fg = c3 }), -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		sym("@namespace")({ fg = c3 }), -- Identifier
		sym("@include")({ fg = c1, gui = "italic" }), -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
		--
		--
		-- GitSigns
		GitSignsAdd({ fg = ok }), -- diff mode: Added line |diff.txt|
		GitSignsChange({ fg = warn }), -- diff mode: Changed line |diff.txt|
		GitSignsDelete({ fg = error }), -- diff mode: Deleted line |diff.txt|   --
		--
		--
		KittyBlack({ fg = black.li(terminal_br), bg = black }),
		KittyRed({ fg = red.li(terminal_br), bg = red }),
		KittyGreen({ fg = green.li(terminal_br), bg = green }),
		KittyYellow({ fg = yellow.li(terminal_br), bg = yellow }),
		KittyBlue({ fg = blue.li(terminal_br), bg = blue }),
		KittyMagenta({ fg = magenta.li(terminal_br), bg = magenta }),
		KittyCyan({ fg = cyan.li(terminal_br), bg = cyan }),
		KittyWhite({ fg = white.li(terminal_br), bg = white }),
		KittyBorder({ fg = c4.li(terminal_br), bg = gray }),
		KittyUrl({ fg = c5 }),

		FishNormal({ fg = normaltext }),
		FishCommand({ fg = c1 }),
		FishKeyword({ fg = c4 }),
		FishQuote({ fg = c1 }),
		FishRedirection({ fg = c5 }),
		FishEnd({ fg = c2 }),
		FishError({ fg = error }),
		FishParam({ fg = c3 }),
		FishComment({ fg = comment }),
		FishSelection({ fg = selection }),
		FishOperator({ fg = c1 }),
		FishEscape({ fg = c4 }),
		FishAutosuggestion({ fg = comment }),
		FishPagerProgress({ fg = c1 }),
		FishPagerPrefix({ fg = c2 }),
		FishPagerCompletion({ fg = c3 }),
		FishPagerDescription({ fg = c4 }),
		FishPagerSelectedBackground({ fg = selection }),

		TmuxMode({ fg = c1, bg = bg }),
		TmuxMessage({ fg = c1, bg = bg }),
		TmuxMessageCommand({ fg = c2, bg = bg }),
		TmuxPaneBorder({ fg = fg }),
		TmuxPaneActiveBorder({ fg = c3 }),
		TmuxStatus({ fg = c4, bg = bg.darken(20) }),
		TmuxWindowStatus({ fg = c2, bg = bg }),
		TmuxWindowStatusActivity({ fg = c3, bg = bg }),

		LualineNormalA({ fg = fg, bg = bg }),
		LualineNormalB({ fg = fg, bg = bg.darken(10) }),
		LualineNormalC({ fg = fg, bg = bg.darken(20) }),

		LualineInsertA({ fg = c3, bg = bg }),
		LualineInsertB({ fg = c3, bg = bg.darken(10) }),
		LualineInsertC({ fg = c3, bg = bg.darken(20) }),

		LualineVisualA({ fg = c1, bg = bg }),
		LualineVisualB({ fg = c1, bg = bg.darken(10) }),
		LualineVisualC({ fg = c1, bg = bg.darken(20) }),

		LualineReplaceA({ fg = c2, bg = bg }),
		LualineReplaceB({ fg = c2, bg = bg.darken(10) }),
		LualineReplaceC({ fg = c2, bg = bg.darken(20) }),

		LualineCommandA({ fg = c2, bg = bg }),
		LualineCommandB({ fg = c2, bg = bg.darken(10) }),
		LualineCommandC({ fg = c2, bg = bg.darken(20) }),

		LualineInactiveA({ fg = gray, bg = bg }),
		LualineInactiveB({ fg = gray, bg = bg.darken(10) }),
		LualineInactiveC({ fg = gray, bg = bg.darken(20) }),

		KauzMetaC1({ fg = c1 }),
		KauzMetaC2({ fg = c2 }),
		KauzMetaC3({ fg = c3 }),
		KauzMetaC4({ fg = c4 }),
		KauzMetaC5({ fg = c5 }),
		KauzMetaFg({ fg = fg }),
		KauzMetaBg({ fg = bg }),
		KauzMetaBlack({ fg = black }),
		KauzMetaGray({ fg = gray }),
		KauzMetaWhite({ fg = white }),
		KauzMetaComment({ fg = comment }),
		KauzMetaSelection({ fg = selection }),
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
