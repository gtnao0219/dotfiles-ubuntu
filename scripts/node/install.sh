#/bin/bash

set -eu

version=16

sudo apt purge -y nodejs
curl -sSL https://deb.nodesource.com/setup_${version}.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install --global yarn
