#!/bin/bash

set -eu

tmp_dir=/tmp/install_aws_valut
mkdir -p ${tmp_dir}
cd ${tmp_dir}

version="v6.3.1"
wget -O aws-vault "https://github.com/99designs/aws-vault/releases/download/${version}/aws-vault-linux-amd64"
sudo mv aws-vault /usr/local/bin/ 
sudo chmod +x /usr/local/bin/aws-vault

sudo apt-get update
sudo apt-get install -y pass gnupg

echo ''
echo 'Please exec: gpg --gen-key'
echo 'Please exec: pass init "YOUR PUBLIC KEY"'

cd ~
rm -rf ${tmp_dir} 
