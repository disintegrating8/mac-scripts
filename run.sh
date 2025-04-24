#!/bin/bash

# Exit on any error
set -e

# Source utility functions
source utils.sh

# Source the package list
if [ ! -f "packages.conf" ]; then
  echo "Error: packages.conf not found!"
  exit 1
fi

source packages.conf

echo "Starting system setup..."

# Update & upgrade Homebrew
echo "Updating Homebrew..."
brew update
brew upgrade

# Install core formulae by category
echo "Installing system utilities..."
install_packages "${SYSTEM_UTILS[@]}"

echo "Installing development tools..."
install_packages "${DEV_TOOLS[@]}"

echo "Installing maintenance tools..."
install_packages "${MAINTENANCE[@]}"

echo "Installing desktop tools..."
install_packages "${DESKTOP[@]}"

echo "Installing office tools..."
install_packages "${OFFICE[@]}"

echo "Installing media packages..."
install_packages "${MEDIA[@]}"

echo "Installing fonts..."
install_packages "${FONTS[@]}"

echo "Setup complete!"
