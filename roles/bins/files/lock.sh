#!/bin/bash

dir="$(mktemp --directory /tmp/lock-sh-XXXXXX)"
src="${dir}/src.png"
dst="${dir}/dst.png"

scrot "$src"
convert "$src" -scale 5% -scale 2000% "$dst"
i3lock -i "$dst" --ignore-empty-password --dpms --show-failed-attempts

rm -rf "$dir"
