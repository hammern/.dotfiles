#!/bin/bash

echo "Configuring pacman..."
./install/pacman.sh

echo "Installing packages..."
./install/packages.sh

echo "Creating symlinks..."
./install/symlink.sh

echo "Setting up zsh as default shell..."
chsh -s $(which zsh)

echo "Finished!"
