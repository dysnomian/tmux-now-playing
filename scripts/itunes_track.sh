#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/itunes_helpers.sh"

print_itunes_track() {
  itunes_current_track_property "name"
}

main() {
  print_itunes_track
}

main
