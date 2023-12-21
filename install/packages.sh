#!/bin/bash

echo "Installing pacman packages..."
sudo pacman -S --noconfirm $(cat ./packages/pacman.txt)

echo "Installing yay packages..."
yay -S --noconfirm $(cat ./packages/yay.txt)
