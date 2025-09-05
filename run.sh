#!/bin/bash

set -e

sudo apt update

sudo apt install -y unzip fontconfig dconf-cli tilix

xargs -a pkglist.txt sudo apt install -y
echo "ALL PACKAGES SHOULD BE INSTALLED"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

mkdir -p ~/.poshthemes
wget -O ~/.poshthemes/blue-owl.omp.json "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip"
unzip -j ~/.poshthemes/themes.zip "themes/blue-owl.omp.json" -d ~/.poshthemes/
rm ~/.poshthemes/themes.zip
echo "Oh My Posh should be installed"

sudo wget -O /usr/local/bin/nvim "https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage"
sudo chmod +x /usr/local/bin/nvim
echo "Neovim should be installed"

if [ ! -d ~/.config/nvim ]; then
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
else
    echo "~/.config/nvim already exists, skipping LazyVim clone"
fi

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/0xProto.zip
unzip 0xProto.zip -d 0xProto
rm 0xProto.zip
fc-cache -fv
echo "Nerdfonts should be installed"

echo 'eval "$(oh-my-posh init bash --config ~/.poshthemes/blue-owl.omp.json)"' >>~/.bashrc
echo 'export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"' >>~/.bashrc

mkdir -p "$HOME/Pictures"
wget -O "$HOME/Pictures/starry-landscape.jpg" "https://images.wallpapersden.com/image/download/starry-landscape-4k-cool-blue-moon_bW5tbG6UmZqaraWkpJRobWllrWdma2U.jpg"
echo "Wallpaper should be installed"

if command -v tilix &>/dev/null; then
    BACKGROUND_IMAGE="$HOME/Pictures/starry-landscape.jpg"
    if [ -f "$BACKGROUND_IMAGE" ]; then
        PROFILE_ID=$(dconf list /com/gexperts/Tilix/profiles/ | head -n1 | tr -d "/")
        if [ -n "$PROFILE_ID" ]; then
            PROFILE_PATH="/com/gexperts/Tilix/profiles/$PROFILE_ID"
            dconf write ${PROFILE_PATH}/background-image "'$BACKGROUND_IMAGE'"
            dconf write ${PROFILE_PATH}/background-transparency-percent 0
            dconf write ${PROFILE_PATH}/background-transparency false
        fi
    fi
fi

stow -t ~ tmux nvim bash

if [ -f ~/.tmux.conf ]; then
    tmux source ~/.tmux.conf || true
fi
source ~/.bashrc

echo "Setup completed!"
