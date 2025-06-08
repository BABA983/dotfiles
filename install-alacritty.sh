#!/bin/bash
set -e

TARGET_PATH="$HOME/.config/alacritty"

mkdir -p "$TARGET_PATH"
ln -s "$PWD/alacritty/alacritty.toml" "$TARGET_PATH"
