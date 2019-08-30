#!/usr/bin/env bash

setxkbmap -option "grp:caps_toggle" -layout "us,ru"

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run xscreensaver -no-splash
run akonadictl start
