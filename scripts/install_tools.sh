#!/bin/bash

set -eu

declare -a packages=( \
  tmux neovim tig \
  htop \
  fd-find delta \
)
sudo apt update
sudo apt install -y ${packages[@]}

# neovim
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt update
sudo apt -y install neovim

# https://askubuntu.com/questions/1290262/unable-to-install-bat-error-trying-to-overwrite-usr-crates2-json-which
sudo apt install -o -y Dpkg::Options::="--force-overwrite" bat ripgrep

# bat custom theme
# mkdir -p "$(bat --config-dir)/themes"
# cp temp/Gruvbox-N.tmTheme "$(bat --config-dir)/themes/Gruvbox-N.tmTheme"
# bat cache --build

