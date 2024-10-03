local k = require "lush_theme.kauz_light"

return {
  normal = {
    a = { fg = k.LualineNormalA.fg.hex, bg = k.LualineNormalA.bg.hex, gui = "bold" },
    b = { fg = k.LualineNormalB.fg.hex, bg = k.LualineNormalB.bg.hex },
    c = { fg = k.LualineNormalC.fg.hex, bg = k.LualineNormalC.bg.hex },
  },
  insert = {
    a = { fg = k.LualineInsertA.fg.hex, bg = k.LualineInsertA.bg.hex, gui = "bold" },
    b = { fg = k.LualineInsertB.fg.hex, bg = k.LualineInsertB.bg.hex },
    c = { fg = k.LualineInsertC.fg.hex, bg = k.LualineInsertC.bg.hex },
  },
  visual = {
    a = { fg = k.LualineVisualA.fg.hex, bg = k.LualineVisualA.bg.hex, gui = "bold" },
    b = { fg = k.LualineVisualB.fg.hex, bg = k.LualineVisualB.bg.hex },
    c = { fg = k.LualineVisualC.fg.hex, bg = k.LualineVisualC.bg.hex },
  },
  replace = {
    a = { fg = k.LualineReplaceA.fg.hex, bg = k.LualineReplaceA.bg.hex, gui = "bold" },
    b = { fg = k.LualineReplaceB.fg.hex, bg = k.LualineReplaceB.bg.hex },
    c = { fg = k.LualineReplaceC.fg.hex, bg = k.LualineReplaceC.bg.hex },
  },
  command = {
    a = { fg = k.LualineCommandA.fg.hex, bg = k.LualineCommandA.bg.hex, gui = "bold" },
    b = { fg = k.LualineCommandB.fg.hex, bg = k.LualineCommandB.bg.hex },
    c = { fg = k.LualineCommandC.fg.hex, bg = k.LualineCommandC.bg.hex },
  },
  inactive = {
    a = { fg = k.LualineInactiveA.fg.hex, bg = k.LualineInactiveA.bg.hex, gui = "bold" },
    b = { fg = k.LualineInactiveB.fg.hex, bg = k.LualineInactiveB.bg.hex },
    c = { fg = k.LualineInactiveC.fg.hex, bg = k.LualineInactiveC.bg.hex },
  },
}
