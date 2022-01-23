#!/bin/bash

set -eu

version=3.10.2

sudo apt update
sudo apt install -y \
  libffi-dev libssl-dev zlib1g-dev liblzma-dev tk-dev \
  libbz2-dev libreadline-dev libsqlite3-dev libopencv-dev \
  build-essential git

rm -rf ~/.pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pyenv install ${version}
pyenv global ${version}

source ~/.zshenv
curl -sSL https://install.python-poetry.org | python -

pip install -U flake8 flake8-import-order autopep8 black isort

