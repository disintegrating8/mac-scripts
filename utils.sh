#!/bin/bash

# Function to check if a brew package is installed
is_formulae_installed() {
  brew list --formula | grep -qx "$1"
}

is_cask_installed() {
  brew list --cask | grep -qx "$1"
}

# Function to install packages if not already installed
install_formulaes() {
  local formulaes=("$@")
  local to_install=()

  for formulae in "${formulaes[@]}"; do
    if ! is_installed "$formulae"; then
      to_install+=("$formulae")
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
