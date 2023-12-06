#!/usr/bin/env bash

# Kauz colors for Tmux

set -g mode-style "fg=#B9B9B9,bg=#334A57"

set -g message-style "fg=#CAB882,bg=#17232A"
set -g message-command-style "fg=#87C3C2,bg=#17232A"

set -g pane-border-style "fg=#B9B9B9"
set -g pane-active-border-style "fg=#8DBFDD"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#DDA8DA,bg=#121D23"

setw -g window-status-activity-style "underscore,fg=#8DBFDD,bg=#17232A"
setw -g window-status-separator ""
setw -g window-status-style "fg=#87C3C2,bg=#17232A"
