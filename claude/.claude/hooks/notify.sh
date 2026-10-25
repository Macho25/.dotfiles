#!/bin/bash
# Claude Code notification hook
#   notify.sh done   (Stop)         -> dunst popup + sound
#   notify.sh input  (Notification) -> dunst popup + terminal bell, i3 marks the window urgent
input=$(cat)

case "$1" in
  done)
    cwd=$(echo "$input" | jq -r '.cwd // empty' 2>/dev/null)
    notify-send -a "Claude Code" -i dialog-information "Claude Code" "Done in ${cwd##*/}" 2>/dev/null
    # setsid -f detaches it, so the sound survives the hook process exiting
    setsid -f paplay /usr/share/sounds/freedesktop/stereo/complete.oga >/dev/null 2>&1
    ;;
  input)
    msg=$(echo "$input" | jq -r '.message // empty' 2>/dev/null)
    notify-send -a "Claude Code" -i dialog-question "Claude Code" "${msg:-Waiting for your input}" 2>/dev/null
    # Bell on Claude's own tmux pane; tmux forwards it to Alacritty, which sets the urgency hint
    if [[ -n $TMUX_PANE ]]; then
      tty=$(tmux display -p -t "$TMUX_PANE" '#{pane_tty}' 2>/dev/null)
    else
      tty=/dev/tty
    fi
    [[ -n $tty && -w $tty ]] && printf '\a' > "$tty"
    ;;
esac

exit 0
