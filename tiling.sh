#!/bin/bash

echo "Installing Dependencies"
install_packages "${TILING[@]}"
install_packages "${FONTS[@]}"

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# SbarLua
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)

echo "Cloning Config"
git clone https://github.com/disintegrating8/dotfiles.git /tmp/dotfiles
mv $HOME/.config/sketchybar $HOME/.config/sketchybar_backup
mv /tmp/dotfiles/sketchybar/.config/sketchybar $HOME/.config/sketchybar
mv /tmp/dotfiles/borders/.config/borders $HOME/.config/borders
mv /tmp/dotfiles/yabai/.config/yabai $HOME/.config/yabai
mv /tmp/dotfiles/skhd/.config/skhd $HOME/.config/skhd
rm -rf /tmp/dotfiles

brew services start skhd
brew services start yabai
brew services start sketchybar
brew services start borders
