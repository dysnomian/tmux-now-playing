#!/usr/bin/env bats

load "itunes_helpers"

@test "getting itunes track info" {
  run itunes_current_track_property
  [ "$status" -eq 0 ]
  [ "$output" = "foo: no such file 'nonexistent_filename'" ]
}
