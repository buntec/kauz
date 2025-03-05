-- Generator for the Kauz color scheme.
--
-- Run this file from neovim using `:luafile %`. Requires the mini.base16 and mini.colors plugins!

-- From the (Base16 styling guidelines)[https://github.com/tinted-theming/home/blob/main/styling.md]:
--
-- Colors base00 to base07 are typically variations of a shade and run from darkest to lightest for dark themes.
-- These colors are used for foreground and background, status bars, line highlighting and such.
-- Colors base08 to base0F are typically individual colors used for types, operators, names and variables.
-- In order to create a dark scheme, colors base00 to base07 should span from dark to light.
-- For a light scheme, these colours should span from light to dark.
--
-- See also the (Base24 styling guidelines)[https://github.com/tinted-theming/base24/blob/main/styling.md].

-- Notes:
-- oklch: l = lightness, c = chroma (saturation), h = hue (angle)

-- mini.colors gives us conversion from oklch to hex
local mc = require "mini.colors"

-- toggle this to preview dark/light variants
local preview_dark = true

-- Kauz theme definitions

-- dark/light
local h0 = 220.0 -- hue of 00--07
local h1 = 180.0 -- hue of 08
local dh = 45.0 -- hue increments for 08--0F

-- dark
local c0 = 4.5 -- chroma of 00--07
local c1 = 5.5 -- chroma of 08--0F
local l0 = 20.0 -- lightness of darkest background
local dl = 10.0 -- lightness increments
local l1 = 80.0 -- lightness of 08--0F
local l2 = 90.0 -- lightness of 12--17

Kauz_palette_dark = {
  base00 = mc.convert({ l = l0 + 0 * dl, c = c0, h = h0 }, "hex"), -- default background
  base01 = mc.convert({ l = l0 + 1 * dl, c = c0, h = h0 }, "hex"), -- lighter background (status bars)
  base02 = mc.convert({ l = l0 + 2 * dl, c = c0, h = h0 }, "hex"), -- selection background
  base03 = mc.convert({ l = l0 + 3 * dl, c = c0, h = h0 }, "hex"), -- comments, invisibles, line highlighting
  base04 = mc.convert({ l = l0 + 4 * dl, c = c0, h = h0 }, "hex"), -- dark foreground (status bars)
  base05 = mc.convert({ l = l0 + 5 * dl, c = c0, h = h0 }, "hex"), -- default foreground, caret, delimiters, operators
  base06 = mc.convert({ l = l0 + 6 * dl, c = c0, h = h0 }, "hex"), -- light foreground
  base07 = mc.convert({ l = l0 + 7 * dl, c = c0, h = h0 }, "hex"), -- the lightest foreground

  base08 = mc.convert({ l = l1, c = c1, h = h1 + 4 * dh }, "hex"), -- diff deleted
  base09 = mc.convert({ l = l1, c = c1, h = h1 + 1 * dh }, "hex"),
  base0A = mc.convert({ l = l1, c = c1, h = h1 + 2 * dh }, "hex"),
  base0B = mc.convert({ l = l1, c = c1, h = h1 + 0 * dh }, "hex"), -- diff inserted
  base0C = mc.convert({ l = l1, c = c1, h = h1 + 6 * dh }, "hex"),
  base0D = mc.convert({ l = l1, c = c1, h = h1 + 5 * dh }, "hex"),
  base0E = mc.convert({ l = l1, c = c1, h = h1 + 3 * dh }, "hex"), -- diff changed
  base0F = mc.convert({ l = l1, c = c1, h = h1 + 7 * dh }, "hex"),

  base10 = mc.convert({ l = l0 - 1 * dl, c = c0, h = h0 }, "hex"), -- darker background (darker than 00)
  base11 = mc.convert({ l = l0 - 2 * dl, c = c0, h = h0 }, "hex"), -- the darkest background (even darker than 10)
  base12 = mc.convert({ l = l2, c = c1, h = h1 + 4 * dh }, "hex"), -- brighter 08
  base13 = mc.convert({ l = l2, c = c1, h = h1 + 2 * dh }, "hex"), -- brigher 0A
  base14 = mc.convert({ l = l2, c = c1, h = h1 + 0 * dh }, "hex"), -- brighter 0B
  base15 = mc.convert({ l = l2, c = c1, h = h1 + 6 * dh }, "hex"), -- brighter 0C
  base16 = mc.convert({ l = l2, c = c1, h = h1 + 5 * dh }, "hex"), -- brighter 0D
  base17 = mc.convert({ l = l2, c = c1, h = h1 + 3 * dh }, "hex"), -- brighter 0E
}

-- light

c0 = 1.0 -- chroma of 00--07
c1 = 5.0 -- chroma of 08--0F
l0 = 100.0 -- lightness of lightest background
dl = -10.0 -- lightness decrements of 00--07
l1 = 60.0 -- lightness of 08--0F
l2 = 70.0 -- lightness of 12--17

Kauz_palette_light = {
  base00 = mc.convert({ l = l0 + 0 * dl, c = c0, h = h0 }, "hex"), -- default background
  base01 = mc.convert({ l = l0 + 1 * dl, c = c0, h = h0 }, "hex"), -- darker background
  base02 = mc.convert({ l = l0 + 2 * dl, c = c0, h = h0 }, "hex"),
  base03 = mc.convert({ l = l0 + 3 * dl, c = c0, h = h0 }, "hex"),
  base04 = mc.convert({ l = l0 + 4 * dl, c = c0, h = h0 }, "hex"),
  base05 = mc.convert({ l = l0 + 5 * dl, c = c0, h = h0 }, "hex"),
  base06 = mc.convert({ l = l0 + 6 * dl, c = c0, h = h0 }, "hex"),
  base07 = mc.convert({ l = l0 + 7 * dl, c = c0, h = h0 }, "hex"),

  base08 = mc.convert({ l = l1, c = c1, h = h1 + 4 * dh }, "hex"), -- diff deleted
  base09 = mc.convert({ l = l1, c = c1, h = h1 + 1 * dh }, "hex"),
  base0A = mc.convert({ l = l1, c = c1, h = h1 + 2 * dh }, "hex"),
  base0B = mc.convert({ l = l1, c = c1, h = h1 + 0 * dh }, "hex"), -- diff inserted
  base0C = mc.convert({ l = l1, c = c1, h = h1 + 6 * dh }, "hex"),
  base0D = mc.convert({ l = l1, c = c1, h = h1 + 5 * dh }, "hex"),
  base0E = mc.convert({ l = l1, c = c1, h = h1 + 3 * dh }, "hex"), -- diff changed
  base0F = mc.convert({ l = l1, c = c1, h = h1 + 7 * dh }, "hex"),

  base10 = mc.convert({ l = 99.0, c = c0, h = h0 }, "hex"), -- should be lighter than 00, but we are already saturated, so we make it slightly darker
  base11 = mc.convert({ l = 98.0, c = c0, h = h0 }, "hex"),
  base12 = mc.convert({ l = l2, c = c1, h = h1 + 4 * dh }, "hex"), -- brighter 08
  base13 = mc.convert({ l = l2, c = c1, h = h1 + 2 * dh }, "hex"), -- brigher 0A
  base14 = mc.convert({ l = l2, c = c1, h = h1 + 0 * dh }, "hex"), -- brighter 0B
  base15 = mc.convert({ l = l2, c = c1, h = h1 + 6 * dh }, "hex"), -- brighter 0C
  base16 = mc.convert({ l = l2, c = c1, h = h1 + 5 * dh }, "hex"), -- brighter 0D
  base17 = mc.convert({ l = l2, c = c1, h = h1 + 3 * dh }, "hex"), -- brighter 0E
}

-- Helper functions

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
local function template(str, table)
  return (
    str:gsub("($%b{})", function(w)
      return vim.tbl_get(table, unpack(vim.split(w:sub(3, -2), ".", { plain = true }))) or w
    end)
  )
end

local function write(str, baseDir, fileName)
  print("writing " .. baseDir .. "/" .. fileName)
  vim.fn.mkdir(vim.fs.dirname(baseDir .. "/" .. fileName), "p")
  local file = assert(io.open(baseDir .. "/" .. fileName, "w"))
  file:write(str)
  file:close()
end

local function write_yaml_base16()
  local yaml_template = [[
system: "base16"
name: "Kauz"
author: "buntec"
variant: "${variant}"
palette:
  base00: "${base00}"
  base01: "${base01}"
  base02: "${base02}"
  base03: "${base03}"
  base04: "${base04}"
  base05: "${base05}"
  base06: "${base06}"
  base07: "${base07}"
  base08: "${base08}"
  base09: "${base09}"
  base0A: "${base0A}"
  base0B: "${base0B}"
  base0C: "${base0C}"
  base0D: "${base0D}"
  base0E: "${base0E}"
  base0F: "${base0F}"
]]

  write(
    template(yaml_template, vim.tbl_extend("error", Kauz_palette_dark, { variant = "dark" })),
    "base16",
    "kauz-dark.yml"
  )
  write(
    template(yaml_template, vim.tbl_extend("error", Kauz_palette_light, { variant = "light" })),
    "base16",
    "kauz-light.yml"
  )
end

local function write_yaml_base24()
  local yaml_template = [[
system: "base24"
name: "Kauz"
author: "buntec"
variant: "${variant}"
palette:
  base00: "${base00}"
  base01: "${base01}"
  base02: "${base02}"
  base03: "${base03}"
  base04: "${base04}"
  base05: "${base05}"
  base06: "${base06}"
  base07: "${base07}"
  base08: "${base08}"
  base09: "${base09}"
  base0A: "${base0A}"
  base0B: "${base0B}"
  base0C: "${base0C}"
  base0D: "${base0D}"
  base0E: "${base0E}"
  base0F: "${base0F}"
  base10: "${base10}"
  base11: "${base11}"
  base12: "${base12}"
  base13: "${base13}"
  base14: "${base14}"
  base15: "${base15}"
  base16: "${base16}"
  base17: "${base17}"
]]

  write(
    template(yaml_template, vim.tbl_extend("error", Kauz_palette_dark, { variant = "dark" })),
    "base24",
    "kauz-dark.yml"
  )
  write(
    template(yaml_template, vim.tbl_extend("error", Kauz_palette_light, { variant = "light" })),
    "base24",
    "kauz-light.yml"
  )
end

function Kauz_switch_to_light()
  require("mini.base16").setup {
    palette = Kauz_palette_light,
  }
end

function Kauz_switch_to_dark()
  require("mini.base16").setup {
    palette = Kauz_palette_dark,
  }
end

local function run_current_lua_file()
  local file = vim.fn.expand "%"
  vim.cmd("luafile " .. file)
end

if preview_dark then
  Kauz_switch_to_dark()
else
  Kauz_switch_to_light()
end

vim.api.nvim_create_user_command("KauzWriteSchemeToYaml", function()
  print "\n"
  write_yaml_base16()
  write_yaml_base24()
  print "done!"
end, { desc = "write Kauz scheme to yaml files" })

local group = vim.api.nvim_create_augroup("kauz", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "kauz-gen.lua",
  desc = "reload colorscheme on save",
  callback = function()
    run_current_lua_file()
  end,
  group = group,
})
