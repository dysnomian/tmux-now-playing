#!/usr/bin/env bash

print_spotify_album() {
  local album=$(osascript -e 'tell application "Spotify" to album of current track as string')
  echo "${album}"
}

main() {
  print_spotify_album
}

main

