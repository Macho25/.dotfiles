#!/bin/bash

set -e

sudo apt update

sudo apt install -y unzip fontconfig dconf-cli tilix

xargs -a pkglist.txt sudo apt install -y

sudo wget -O /usr/local/bin/nvim "https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.appimage"
sudo chmod +x /usr/local/bin/nvim

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/0xProto.zip
unzip 0xProto.zip -d 0xProto
rm 0xProto.zip
fc-cache -fv

echo 'eval "$(oh-my-posh init bash --config ~/.poshthemes/blue-owl.omp.json)"' >>~/.bashrc

echo 'export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"' >>~/.bashrc

mkdir -p "$HOME/Pictures"

wget -O "$HOME/Pictures/starry-landscape.jpg" "https://images.wallpapersden.com/image/download/starry-landscape-4k-cool-blue-moon_bW5tbG6UmZqaraWkpJRobWllrWdma2U.jpg"

BACKGROUND_IMAGE="$HOME/Pictures/starry-landscape.jpg"
USE_IMAGE_BACKGROUND=true

PROFILE_ID=$(dconf read /com/gexperts/Tilix/profiles/ | tr -d "[]' " | cut -d, -f1)
PROFILE_PATH="/com/gexperts/Tilix/profiles/$PROFILE_ID"

if [ "$USE_IMAGE_BACKGROUND" = true ]; then
    if [ -f "$BACKGROUND_IMAGE" ]; then
        echo "🖼️ Setting background image: $BACKGROUND_IMAGE"
        dconf write ${PROFILE_PATH}/background-image "'$BACKGROUND_IMAGE'"
        dconf write ${PROFILE_PATH}/background-transparency-percent 0
        dconf write ${PROFILE_PATH}/background-transparency false
    else
        echo "⚠️ Background image not found at $BACKGROUND_IMAGE"
    fi
else
    echo "Skipping background image setup"
fi

stow tmux nvim bash

tmux source ~/.tmux.conf
source ~/.bashrc
