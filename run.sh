#!/bin/bash

set -e

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true

# Oh my posh theme
#curl -s https://ohmyposh.dev/install.sh | bash -s
#mkdir -p ~/.poshthemes
#mv ~/.cache/oh-my-posh/themes/blue-owl.omp.json ~/.poshthemes/

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
#mv ~/.bashrc ~/.bashrc.backup
stow -v tmux nvim 
tmux -f ~/.config/tmux/tmux.conf new-session -d || true
source ~/.bashrc
