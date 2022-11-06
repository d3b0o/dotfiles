#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q main -c ~/.config/polybar/config.ini &
#polybar -q top -c ~/.config/polybar/config.ini &
