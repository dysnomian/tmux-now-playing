#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/itunes_helpers.sh"

print_itunes_status() {
  "itunes_player_state_property"
}

main() {
  output=$(print_itunes_status)
  echo "#{${output}_icon}"
}

main
