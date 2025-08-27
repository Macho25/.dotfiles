#!/bin/bash

set -e

if command -v apt-get &>/dev/null; then
    sudo apt-get update
    xargs sudo apt-get install -y <pkglist.txt
elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed - <pkglist.txt
fi

cd ~/dotfiles
stow */
