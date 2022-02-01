#!/bin/bash

set -eu

default_version="1.1.4"

# requirements: brew
brew install tfenv
tfenv install ${default_version}
tfenv use ${default_version}

#######
# coc #
#######

# Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
# Add the official HashiCorp Linux repository
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install terraform-ls

