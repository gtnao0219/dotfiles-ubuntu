#/bin/bash

set -eu

version=1.17.5
tmp_dir=/tmp/install_go

mkdir -p ${tmp_dir}
wget -P ${tmp_dir} https://go.dev/dl/go${version}.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ${tmp_dir}/go${version}.linux-amd64.tar.gz
rm -rf ${tmp_dir} 

