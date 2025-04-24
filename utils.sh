#!/bin/bash

# Function to check if a brew package is installed
is_installed() {
  brew list --formula | grep -qx "$1"
}

is_cask_installed() {
  brew list --cask | grep -qx "$1"
}

# Function to install packages if not already installed
install_packages() {
  local packages=("$@")
  local to_install=()

  for pkg in "${packages[@]}"; do
    if ! is_installed "$pkg"; then
      to_install+=("$pkg")
    fi
  done

  if [ ${#to_install[@]} -ne 0 ]; then
    echo "Installing: ${to_install[*]}"
    brew install "${to_install[@]}"
  fi
}

install_casks() {
  local casks=("$@")
  local to_install=()

  for cask in "${casks[@]}"; do
    if ! is_cask_installed "$cask"; then
      to_install+=("$cask")
    fi
  done

  if [ ${#to_install[@]} -ne 0 ]; then
    echo "Installing casks: ${to_install[*]}"
    brew install --cask "${to_install[@]}"
  fi
}
