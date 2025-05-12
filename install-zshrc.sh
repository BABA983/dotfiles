#!/bin/bash
set -e

TARGET_PATH="$HOME"

ln -s "$PWD/zsh/.zshrc" "$TARGET_PATH"
ln -s "$PWD/zsh/.zshenv" "$TARGET_PATH"
