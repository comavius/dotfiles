#!/usr/bin/env bash
# Only for the first time

# Install necessary packages
sudo apt update
sudo apt upgrade -y
sudo apt install -y git curl swaylock
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix sh -s -- install
git clone https://github.com/comavius/dotfiles.git ~/.dotfiles

# Build home-manager
cd ~/.dotfiles
nix-shell -p home-manager --run "home-manager --flake . switch"

# Change system configuration as root user
sudo chsh -s ~/.nix-profile/bin/zsh $USER
sudo cp ~/.home-manager/sway/sway.desktop /usr/share/wayland-sessions
