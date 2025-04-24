#!/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/disintegrating8/dotfiles"
REPO_NAME="dotfiles"

is_stow_installed() {
  brew list --formula | grep -qx "stow"
}

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

cd ~

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone."
else
  echo "Cloning repository..."
  git clone "$REPO_URL"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  cd "$REPO_NAME"
  echo "Stowing configurations..."
  stow zsh
  stow p10k
  stow nvim
else
  echo "Failed to clone the repository."
  exit 1
fi

# Check if the stow was successful
if [ $? -eq 0 ]; then
  brew services start skhd
  brew services start yabai
  brew services start sketchybar
  brew services start borders
else
  echo "Failed to create a symlink."
  exit 1
fi
