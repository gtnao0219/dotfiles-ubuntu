#!/bin/bash

set -eu

declare -a packages=( \
  tmux neovim tig \
  htop \
  fd-find delta \
)
sudo apt update
sudo apt install -y ${packages[@]}

# https://askubuntu.com/questions/1290262/unable-to-install-bat-error-trying-to-overwrite-usr-crates2-json-which
sudo apt install -o -y Dpkg::Options::="--force-overwrite" bat ripgrep
