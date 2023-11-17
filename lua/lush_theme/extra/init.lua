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
	local fname = "kitty/kauz.conf"
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
	local fish = require("lush_theme.extra.fish")
	fname = "fish/kauz.fish"
	write(
		fish.generate({
			normal = kauz.FishNormal.fg.hex,
			command = kauz.FishCommand.fg.hex,
			keyword = kauz.FishKeyword.fg.hex,
			quote = kauz.FishQuote.fg.hex,
			redirection = kauz.FishRedirection.fg.hex,
			["end"] = kauz.FishEnd.fg.hex,
			error = kauz.FishError.fg.hex,
			param = kauz.FishParam.fg.hex,
			comment = kauz.FishComment.fg.hex,
			selection = kauz.FishSelection.fg.hex,
			operator = kauz.FishOperator.fg.hex,
			escape = kauz.FishEscape.fg.hex,
			autosuggestion = kauz.FishAutosuggestion.fg.hex,
			pager_progress = kauz.FishPagerProgress.fg.hex,
			pager_prefix = kauz.FishPagerPrefix.fg.hex,
			pager_completion = kauz.FishPagerCompletion.fg.hex,
			pager_description = kauz.FishPagerDescription.fg.hex,
			pager_selected_background = kauz.FishPagerSelectedBackground.fg.hex,
		}),
		fname
	)
end

return M
