local util = require("lush_theme.utils")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local fishColors = {}
  for k, v in pairs(colors) do
    if type(v) == "string" then
      fishColors[k] = v:gsub("^#", "")
    end
  end

  local fish = util.template(
    [[
    # Kauz

    # Syntax Highlighting Colors
    set -g fish_color_normal ${normal}
    set -g fish_color_command ${command}
    set -g fish_color_keyword ${keyword}
    set -g fish_color_quote ${quote}
    set -g fish_color_redirection ${redirection}
    set -g fish_color_end ${end}
    set -g fish_color_error ${error}
    set -g fish_color_param ${param}
    set -g fish_color_comment ${comment}
    set -g fish_color_selection --background=${selection}
    set -g fish_color_search_match --background=${selection}
    set -g fish_color_operator ${operator}
    set -g fish_color_escape ${escape}
    set -g fish_color_autosuggestion ${autosuggestion}

    # Completion Pager Colors
    set -g fish_pager_color_progress ${pager_progress}
    set -g fish_pager_color_prefix ${pager_prefix}
    set -g fish_pager_color_completion ${pager_completion}
    set -g fish_pager_color_description ${pager_description}
    set -g fish_pager_color_selected_background --background=${pager_selected_background}

  ]],
    fishColors
  )

  return fish
end

return M