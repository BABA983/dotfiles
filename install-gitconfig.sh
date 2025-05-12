#!/bin/bash
set -e

TARGET_PATH="$HOME"

ln -s "$PWD/gitconfig/.gitconfig" "$TARGET_PATH"
cp "$PWD/gitconfig/.gitconfig-company-template" "$TARGET_PATH/.gitconfig-company"
