#!/bin/bash

symlink() {
    cp -rsf $1 $2
}

echo "Symlinking to home directory (~/)..."
symlink ~/.dotfiles/home/. ~/

echo "Symlinking to .config directory (~/.config)..."
symlink ~/.dotfiles/.config/. ~/.config
