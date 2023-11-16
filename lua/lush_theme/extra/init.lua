local M = {}

local function write(str, fileName)
	print("[write] extra/" .. fileName)
	vim.fn.mkdir(vim.fs.dirname("extras/" .. fileName), "p")
	local file = io.open("extras/" .. fileName, "w")
	file:write(str)
	file:close()
end

function M.write_file(file, contents)
	local fd = assert(io.open(file, "w+"))
	fd:write(contents)
	fd:close()
end

function M.setup()
	local kauz = require("lush_theme.kauz")
	local kitty = require("lush_theme.extra.kitty")
	local fname = "kauz.conf"
	write(
		kitty.generate({
			foreground = kauz.Normal.fg.hex,
			background = kauz.Normal.bg.hex,
			selection_foreground = kauz.Normal.fg.hex,
			selection_background = kauz.Visual.bg.hex,
			cursor = kauz.Cursor.bg.hex,
			cursor_text_color = kauz.Cursor.fg.hex,
			black = kauz.KittyBlack.bg,
			black_bright = kauz.KittyBlack.fg,
		}),
		fname
	)
end

return M
