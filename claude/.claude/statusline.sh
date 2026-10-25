#!/bin/bash
# Tokyo Night status line: model │ context │ 5h usage │ 7d usage
input=$(cat)

IFS=$'\t' read -r MODEL CTX CTX_TOK CTX_MAX H5 H5_RESET D7 D7_RESET < <(echo "$input" | jq -r '[
  (.model.display_name // "?"),
  (.context_window.used_percentage // 0 | floor),
  ((.context_window.total_input_tokens // 0)),
  (.context_window.context_window_size // 0),
  (.rate_limits.five_hour.used_percentage // "" | if . == "" then "-" else floor end),
  (.rate_limits.five_hour.resets_at // "-"),
  (.rate_limits.seven_day.used_percentage // "" | if . == "" then "-" else floor end),
  (.rate_limits.seven_day.resets_at // "-")
] | @tsv')

# Tokyo Night palette (truecolor)
fg() { printf '\033[38;2;%d;%d;%dm' "0x${1:0:2}" "0x${1:2:2}" "0x${1:4:2}"; }
BLUE=$(fg 7aa2f7); CYAN=$(fg 7dcfff); MAGENTA=$(fg bb9af7)
GREEN=$(fg 9ece6a); YELLOW=$(fg e0af68); RED=$(fg f7768e)
COMMENT=$(fg 565f89); DIM=$(fg 3b4261); RESET=$'\033[0m'
SEP=" ${DIM}│${RESET} "

level_color() {
  if (( $1 >= 80 )); then echo "$RED"; elif (( $1 >= 50 )); then echo "$YELLOW"; else echo "$GREEN"; fi
}

bar() {
  local pct=$1 width=10 filled
  filled=$(( pct * width / 100 )); (( filled > width )) && filled=$width
  local on off
  printf -v on '%*s' "$filled" ''; printf -v off '%*s' "$(( width - filled ))" ''
  printf '%s%s%s%s%s' "$(level_color "$pct")" "${on// /━}" "$DIM" "${off// /━}" "$RESET"
}

human() {  # 83312 -> 83.3k, 1000000 -> 1m
  awk -v n="$1" 'BEGIN { if (n >= 1e6) printf "%gm", n/1e6; else if (n >= 1e3) printf "%.1fk", n/1e3; else printf "%d", n }'
}

until_reset() {  # epoch -> "2h13m" / "3d4h"
  [[ $1 == "-" ]] && return
  local s=$(( $1 - $(date +%s) )); (( s < 0 )) && s=0
  if (( s >= 86400 )); then printf '%dd%dh' $(( s / 86400 )) $(( s % 86400 / 3600 ))
  else printf '%dh%02dm' $(( s / 3600 )) $(( s % 3600 / 60 )); fi
}

usage() {  # label pct reset
  if [[ $2 == "-" ]]; then printf '%s%s%s %s–%s' "$MAGENTA" "$1" "$RESET" "$COMMENT" "$RESET"; return; fi
  printf '%s%s%s %s%s%%%s %s↻ %s%s' "$MAGENTA" "$1" "$RESET" "$(level_color "$2")" "$2" "$RESET" "$COMMENT" "$(until_reset "$3")" "$RESET"
}

out="${BLUE}󰚩 ${MODEL}${RESET}"
out+="${SEP}${CYAN}ctx${RESET} $(bar "$CTX") $(level_color "$CTX")${CTX}%${RESET} ${COMMENT}$(human "$CTX_TOK")/$(human "$CTX_MAX")${RESET}"
out+="${SEP}$(usage 5h "$H5" "$H5_RESET")"
out+="${SEP}$(usage 7d "$D7" "$D7_RESET")"
printf '%s\n' "$out"
