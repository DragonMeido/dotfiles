#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1 and bar2
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
polybar main & 
polybar extend;

echo "Bars launched..."
