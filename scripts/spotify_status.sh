#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

playing_icon=""
paused_icon=""

playing_default="▶︎"
paused_default="■"

print_spotify_status() {
  local status=$(osascript -e 'tell application "Spotify" to player state as string')
  if [[ "$status" == "playing" ]]; then
    echo "${playing_icon}"
  else
    echo "${paused_icon}"
  fi
}

update_status_icon() {
  playing_icon=$(get_tmux_option "@spotify_playing_icon" "$playing_default")
  paused_icon=$(get_tmux_option "@spotify_paused_icon" "$paused_default")
}

main() {
  update_status_icon
  print_spotify_status
}

main


