local util = require "lush_theme.utils"

local M = {}

function M.generate(colors)
  local tmux = util.template(
    [[
#!/usr/bin/env bash

# Kauz colors for Tmux

set -g mode-style "fg=${mode_fg},bg=${mode_bg}"

set -g message-style "fg=${message_fg},bg=${message_bg}"
set -g message-command-style "fg=${message_command_fg},bg=${message_command_bg}"

set -g pane-border-style "fg=${pane_border_fg}"
set -g pane-active-border-style "fg=${pane_active_border_fg}"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=${status_fg},bg=${status_bg}"

setw -g window-status-activity-style "underscore,fg=${window_status_activity_fg},bg=${window_status_activity_bg}"
setw -g window-status-separator ""
setw -g window-status-style "fg=${window_status_fg},bg=${window_status_bg}"
]],
    colors
  )
  return tmux
end

return M
