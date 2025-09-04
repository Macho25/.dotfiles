#!/bin/bash

set -e

xargs -a pkglist.txt sudo apt install -y

sudo wget -O /usr/local/bin/nvim "https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.appimage"
sudo chmod +x /usr/local/bin/nvim

cd ~/dotfiles
stow */

source ~/.bashrc
