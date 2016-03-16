#!/usr/bin/env bash

print_spotify_track() {
  local track=$(osascript -e 'tell application "Spotify" to name of current track as string')
  echo "${track}"
}

main() {
  print_spotify_track
}

main


