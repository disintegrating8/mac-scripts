echo "Installing Dependencies"
# Packages
brew install lua
brew install switchaudio-osx
brew install nowplaying-cli

brew tap FelixKratz/formulae
brew install sketchybar

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# SbarLua
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)

echo "Cloning Config"
git clone https://github.com/FelixKratz/dotfiles.git
#mv $HOME/.config/sketchybar $HOME/.config/sketchybar_backup
#mv /tmp/dotfiles/.config/sketchybar $HOME/.config/sketchybar
#rm -rf /tmp/dotfiles

brew services restart sketchybar
