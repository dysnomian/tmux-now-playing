get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

itunes_player_state_property() {
read -r -d '' SCRIPT <<'END'
set theApp to "iTunes"

tell application "System Events" to (name of processes) contains theApp

if application theApp is running then
    tell application "iTunes"
       return player state
    end tell
else
    return "off"
end if
END

echo $(osascript -e "$(printf "${SCRIPT}")")
}

itunes_current_track_property() {
  local prop="${1}"
read -r -d '' SCRIPT <<'END'
set theApp to "iTunes"

tell application "System Events" to (name of processes) contains theApp

if application theApp is running then
    tell application "iTunes"
       if player state is playing then
           return %s of current track as string
       else if player state is paused then
          return %s of current track as string
       else
          return ""
       end if
    end tell
end if
END

osascript -e "$(printf "${SCRIPT}" "$prop" "$prop")"
}
