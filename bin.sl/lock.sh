#!/bin/bash

tmp="/tmp/screensaver-$(uuidgen)"
src="$tmp/screen.png"
dst="$tmp/out.png"

mkdir -p "$tmp"
scrot "$src"
convert "$src" -resize 5% -resize 2000% "$dst"
i3lock -i "$dst" --ignore-empty-password --dpms --show-failed-attempts

rm -rf "$tmp"

