#!/bin/bash

set -eu

declare -a packages=( \
  build-essential \
  vim zsh git curl \
  unzip bzip2 gzip tar \
  ssh \
)
sudo apt update
sudo apt install -y ${packages[@]}

