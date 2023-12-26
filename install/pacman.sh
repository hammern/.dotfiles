#!/bin/bash

pacmanconf="/etc/pacman.conf"

echo "Styling pacman..."
sudo sed -i "s/^#Color$/Color/" ${pacmanconf}
if ! test "$(grep ^ILoveCandy$ "${pacmanconf}")"; then
  sudo sed -i "/^Color$/a ILoveCandy" ${pacmanconf}
fi

echo "Parallelizing pacman..."
sudo sed -i "s/^#ParallelDownloads = \([0-9]\+\)$/ParallelDownloads = 5/" ${pacmanconf}

echo "Installing yay..."
sudo pacman -S --noconfirm yay
