#!/usr/bin/env bash

print_spotify_artist() {
  local artist=$(osascript -e 'tell application "Spotify" to artist of current track as string')
  echo "${artist}"
}

main() {
  print_spotify_artist
}

main
