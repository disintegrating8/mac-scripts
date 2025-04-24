#!/bin/bash

# Clone the repo
git clone https://github.com/disintegrating8/mac-scripts.git
cd mac-scripts
chmod +x run.sh
./run.sh

# Exit on any error
set -e

# Source utility functions
source ./utils.sh

# Source the package list
if [ ! -f "packages.conf" ]; then
  echo "Error: packages.conf not found!"
  exit 1
fi

source ./packages.conf

echo "Starting system setup..."

# Update & upgrade Homebrew
echo "Updating Homebrew..."
brew update
brew upgrade

## Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

# Install core formulae by category
echo "Installing system utilities..."
install_packages "${SYSTEM_UTILS[@]}"

echo "Installing development tools..."
install_packages "${TERMINAL[@]}"

echo "Installing tiling setup..."
install_packages "${TILING[@]}"

echo "Installing casks..."
install_casks "${CASKS[@]}"

echo "Installing media packages..."
install_casks "${MEDIA[@]}"

echo "Installing fonts..."
install_casks "${FONTS[@]}"

# Sketchybar Plugins
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)

# Run dotfiles-setup
echo "Installing dotfiles"
. dotfiles-setup.sh

# Delete the cloned repo folder
rm -rf ~/mac-scripts

echo "Setup complete!"
