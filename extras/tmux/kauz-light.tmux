#!/usr/bin/env bash

# Kauz colors for Tmux

set -g mode-style "fg=#807450,bg=#C7DDED"

set -g message-style "fg=#807450,bg=#FEFCFD"
set -g message-command-style "fg=#B4557A,bg=#F0D9EE"

set -g pane-border-style "fg=#807450"
set -g pane-active-border-style "fg=#A35A9F"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#57798D,bg=#C7DDED"

setw -g window-status-activity-style "underscore,fg=#547B7B,bg=#FEFCFD"
setw -g window-status-separator ""
setw -g window-status-style "fg=#A35A9F,bg=#F0D9EE"
