#!/bin/bash
set -e

TARGET_PATH="$HOME/.config/aerospace"

mkdir -p "$TARGET_PATH"
ln -s "$PWD/aerospace/aerospace.toml" "$TARGET_PATH"
