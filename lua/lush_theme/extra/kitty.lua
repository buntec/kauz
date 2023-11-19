local util = require "lush_theme.utils"

local M = {}

function M.generate(colors)
  local kitty = util.template(
    [[
# vim:ft=kitty
#: This is a template that can be used to create new kitty themes.
#: Theme files should start with a metadata block consisting of
#: lines beginning with ##. All metadata fields are optional.

## name: The name of the theme (if not present, derived from filename)
## author: The name of the theme author
## license: The license information
## upstream: A URL pointing to the location of this file upstream for auto-updates
## blurb: A description of this theme. This must be the
## last item in the metadata and can continue over multiple lines.

#: All the settings below are colors, which you can choose to modify, or use the
#: defaults. You can also add non-color based settings if needed but note that
#: these will not work with using kitty @ set-colors with this theme. For a
#: reference on what these settings do see https://sw.kovidgoyal.net/kitty/conf/

#: The basic colors

foreground                      ${foreground}
background                      ${background}
selection_foreground            ${selection_foreground}
selection_background            ${selection_background}


#: Cursor colors

cursor                          ${cursor}
cursor_text_color               ${cursor_text_color}


#: URL underline color when hovering with mouse

url_color                       ${url_color}


#: kitty window border colors and terminal bell colors

active_border_color             ${active_border_color}
inactive_border_color           ${inactive_border_color}
# bell_border_color               ${bell_border_color}
# visual_bell_color               none


#: OS Window titlebar colors

# wayland_titlebar_color          system
# macos_titlebar_color            system


#: Tab bar colors

# active_tab_foreground           ${active_tab_foreground}
# active_tab_background           ${active_tab_background}
# inactive_tab_foreground         ${inactive_tab_foreground}
# inactive_tab_background         ${inactive_tab_background}
# tab_bar_background              none
# tab_bar_margin_color            none


#: Colors for marks (marked text in the terminal)

# mark1_foreground black
# mark1_background #98d3cb
# mark2_foreground black
# mark2_background #f2dcd3
# mark3_foreground black
# mark3_background #f274bc


#: The basic 16 colors

#: black
color0 ${black}
color8 ${black_bright}

#: red
color1 ${red}
color9 ${red_bright}

#: green
color2  ${green}
color10 ${green_bright}

#: yellow
color3  ${yellow}
color11 ${yellow_bright}

#: blue
color4  ${blue}
color12 ${blue_bright}

#: magenta
color5  ${magenta}
color13 ${magenta_bright}

#: cyan
color6  ${cyan}
color14 ${cyan_bright}

#: white
color7  ${white}
color15 ${white_bright}
]],
    colors
  )
  return kitty
end

return M
