#!/bin/bash

set -e

sudo apt update

sudo apt install -y unzip fontconfig dconf-cli tilix

xargs -a pkglist.txt sudo apt install -y

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# mkdir -p ~/.config/tmux
# touch ~/.config/tmux/tmux.conf

# git clone https://github.com/LazyVim/starter ~/.config/nvim
# rm -rf ~/.config/nvim/.git

# Neovim
sudo wget -O /usr/local/bin/nvim "https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.appimage"
chmod +x /usr/local/bin/nvim

# Fonts
sudo wget -O ~/.local/share/fonts "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/0xProto.zip"
unzip 0xProto.zip -d 0xProto
rm 0xProto.zip
fc-cache -fv

# Oh my posh theme
curl -s https://ohmyposh.dev/install.sh | bash -s
mkdir .poshthemes
mv ~/.cache/oh-my-posh/themes/blue-owl.omp.json ~/.poshthemes

# mkdir -p "$HOME/Picture"
# USE_IMAGE_BACKGROUND=true
# if ! wget -O "$HOME/Picture/starry-landscape.jpg" "https://images.wallpapersden.com/image/download/starry-landscape-4k-cool-blue-moon_bW5tbG6UmZqaraWkpJRobWllrWdma2U.jpg"; then
#     echo " Failed to download background image. Skipping image setup..."
#     USE_IMAGE_BACKGROUND=false
# fi
#
# BACKGROUND_IMAGE="$HOME/Picture/starry-landscape.jpg"
#
# if [ "$USE_IMAGE_BACKGROUND" = true ]; then
#     PROFILE_ID=$(dconf read /com/gexperts/Tilix/profiles/ | tr -d "[]' " | cut -d, -f1)
#     PROFILE_PATH="/com/gexperts/Tilix/profiles/$PROFILE_ID"
#     if [ -f "$BACKGROUND_IMAGE" ]; then
#         echo " Setting background image: $BACKGROUND_IMAGE"
#         dconf write ${PROFILE_PATH}/background-image "'$BACKGROUND_IMAGE'"
#         dconf write ${PROFILE_PATH}/background-transparency-percent 0
#         dconf write ${PROFILE_PATH}/background-transparency false
#     else
#         echo " Background image not found at $BACKGROUND_IMAGE"
#     fi
# else
# echo "Skipping background image setup"
# fi

# rm -rf ~/.config/tmux ~/.config/nvim
rm -rf ~/.bashrc
stow -v tmux nvim bash

tmux source $XDG_CONFIG_HOME/tmux/tmux.conf
source ~/.bashrc
