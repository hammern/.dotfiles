#!/bin/bash

echo "Updating mirrors..."
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

echo "Updating system..."
sudo pacman -Syu --noconfirm
yay -Syu --noconfirm

echo "Installing pacman packages..."
sudo pacman -S --noconfirm $(cat ~/.dotfiles/install/packages/pacman.txt)

echo "Installing yay packages..."
yay -S --noconfirm $(cat ~/.dotfiles/install/packages/yay.txt)
