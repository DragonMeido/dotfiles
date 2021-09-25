#!/bin/sh
if ! mpc > /dev/null 2>&1; then
    echo Server offline
    exit 1
elif mpc status | grep -q playing; then
    ( mpc current | zscroll -l 10 -d 0.1 -n ) &
else
    echo Not Playing
fi
mpc idle > /dev/nll 