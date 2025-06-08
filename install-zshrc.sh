#!/bin/bash
set -e

TARGET_PATH="$HOME"

for file in .zshrc .zshenv .zprofile; do
  src="$PWD/zsh/$file"
  dest="$TARGET_PATH/$file"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak"
    echo "Backed up $dest to $dest.bak"
  fi
  ln -sf "$src" "$dest"
done