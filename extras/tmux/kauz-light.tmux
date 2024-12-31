#!/usr/bin/env bash

# Kauz colors for Tmux

set -g mode-style "fg=#807450,bg=#DDEAF4"

set -g message-style "fg=#807450,bg=#F4E7C5"
set -g message-command-style "fg=#B4557A,bg=#F4E7C5"

set -g pane-border-style "fg=#969696"
set -g pane-active-border-style "fg=#D27C9A"

set -g status-style "fg=#57798D,bg=#DDEAF4"
set -g status-left-style "fg=#807450,bg=#DDEAF4"
set -g status-right-style "fg=#807450,bg=#DDEAF4"

setw -g window-status-activity-style "underscore,fg=#547B7B,bg=#FEFCFD"
setw -g window-status-style "fg=#807450,bg=#F0D9EE"
