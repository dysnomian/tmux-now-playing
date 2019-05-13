#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PLAYING_ICON=""
PAUSED_ICON=""
STOPPED_ICON=""
OFF_ICON=""

ITUNES_ICON="ﭵ"
SPOTIFY_ICON=""
PANDORA_ICON=""

# TODO: player preference list
# TODO: detect open players
PLAYER_ICON="ﭵ"

# TODO: restore Spotify
# source "$CURRENT_DIR/scripts/spotify_helpers.sh"
# TODO: implement Pandora
# source "$CURRENT_DIR/scripts/pandora_helpers.sh"
source "$CURRENT_DIR/scripts/itunes_helpers.sh"

# TODO: unify scripts for all players
itunes_artist="$($CURRENT_DIR/scripts/itunes_artist.sh)"
itunes_album="$($CURRENT_DIR/scripts/itunes_album.sh)"
itunes_track="$($CURRENT_DIR/scripts/itunes_track.sh)"
itunes_status="$($CURRENT_DIR/scripts/itunes_status.sh)"

# TODO: restore Spotify
# spotify_artist="#($CURRENT_DIR/scripts/spotify_artist.sh)"
# spotify_album="#($CURRENT_DIR/scripts/spotify_album.sh)"
# spotify_track="#($CURRENT_DIR/scripts/spotify_track.sh)"
# spotify_status="#($CURRENT_DIR/scripts/spotify_status.sh)"

player_icon_interpolation="\#{player_icon}"

off_icon_interpolation="\#{off_icon}"
paused_icon_interpolation="\#{paused_icon}"
playing_icon_interpolation="\#{playing_icon}"
stopped_icon_interpolation="\#{stopped_icon}"

itunes_artist_interpolation="\#{itunes_artist}"
itunes_album_interpolation="\#{itunes_album}"
itunes_track_interpolation="\#{itunes_track}"
itunes_status_interpolation="\#{itunes_status}"

# TODO: restore Spotify
# # artist_interpolation="\#{spotify_artist}"
# # album_interpolation="\#{spotify_album}"
# # track_interpolation="\#{spotify_track}"
# # status_interpolation="\#{spotify_status}"

do_interpolation() {
  local output="$1"
  local output="${output/$itunes_artist_interpolation/$itunes_artist}"
  local output="${output/$itunes_album_interpolation/$itunes_album}"
  local output="${output/$itunes_track_interpolation/$itunes_track}"
  local output="${output/$itunes_status_interpolation/$itunes_status}"
  local output="${output/$player_icon_interpolation/$PLAYER_ICON}"
  local output="${output/$off_icon_interpolation/$OFF_ICON}"
  local output="${output/$stopped_icon_interpolation/$STOPPED_ICON}"
  local output="${output/$playing_icon_interpolation/$PLAYING_ICON}"
  local output="${output/$paused_icon_interpolation/$PAUSED_ICON}"

# TODO: restore Spotify
#   # local output="${output/$artist_interpolation/$spotify_artist}"
#   # local output="${output/$album_interpolation/$spotify_album}"
#   # local output="${output/$track_interpolation/$spotify_track}"
#   # local output="${output/$status_interpolation/$spotify_status}"
   echo "$output"
}

update_tmux_uptime() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}


main() {
  update_tmux_uptime "status-right"
  update_tmux_uptime "status-left"
}
main
