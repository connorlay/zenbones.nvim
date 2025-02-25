local template = [[set -g status-left ' #[fg=${color5},bold]#{s/root//:client_key_table} '
set -g status-right '#[fg=${color5},bold] [#S]#[fg=${color5},bold] [%d/%m] #[fg=${color5},bold][%I:%M%p] '
set -g status-style fg='${color5}',bg='${color7}'

set -g window-status-current-style fg='${color5}',bg='${color7}',bold

set -g pane-border-style fg='${color5}'
set -g pane-active-border-style fg='${color5}'

set -g message-style fg='${color0}',bg='${selection_background}'

set -g display-panes-active-colour '${color5}'
set -g display-panes-colour '${color5}'

set -g clock-mode-colour '${color5}'

set -g mode-style fg='${color0}',bg='${selection_background}'
]]

local theme = require "zenbones"
local terminal = require "zenbones.terminal"

local values = {
	selection_background = theme.Visual.bg.hex,
}
for i, v in ipairs(terminal.colors) do
	values["color" .. (i - 1)] = v.hex
end

return { "extras/tmux/zenbones.tmux", template, values }
