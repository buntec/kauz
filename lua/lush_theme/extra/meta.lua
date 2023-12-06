local util = require "lush_theme.utils"

local M = {}

function M.generate(colors)
  local kitty = util.template(
    [[
c1 = ${c1}
c2 = ${c2}
c3 = ${c3}
c4 = ${c4}
c5 = ${c5}
fg = ${fg}
bg = ${bg}
comment = ${comment}
]],
    colors
  )
  return kitty
end

return M
