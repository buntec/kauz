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
			black = kauz.KittyBlack.bg.hex,
			black_bright = kauz.KittyBlack.fg.hex,
			red = kauz.KittyRed.bg.hex,
			red_bright = kauz.KittyRed.fg.hex,
			green = kauz.KittyGreen.bg.hex,
			green_bright = kauz.KittyGreen.fg.hex,
			yellow = kauz.KittyYellow.bg.hex,
			yellow_bright = kauz.KittyYellow.fg.hex,
			blue = kauz.KittyBlue.bg.hex,
			blue_bright = kauz.KittyBlue.fg.hex,
			magenta = kauz.KittyMagenta.bg.hex,
			magenta_bright = kauz.KittyMagenta.fg.hex,
			cyan = kauz.KittyCyan.bg.hex,
			cyan_bright = kauz.KittyCyan.fg.hex,
			white = kauz.KittyWhite.bg.hex,
			white_bright = kauz.KittyWhite.fg.hex,
			active_border_color = kauz.KittyBorder.fg.hex,
			inactive_border_color = kauz.KittyBorder.bg.hex,
			url_color = kauz.KittyUrl.fg.hex,
		}),
		fname
	)
end

return M
