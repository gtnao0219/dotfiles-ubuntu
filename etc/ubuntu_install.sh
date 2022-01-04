#!/bin/bash

yes_or_no() {
  while true; do
    read -p "${1} (y/n)" yn
    case $yn in
      [Yy]* ) return 0;;
      [Nn]* ) return 1;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

install_essential_packages() {
  local -a packages
  packages=( \
    build-essential \
    vim zsh git curl \
    htop iftop \
    unzip bzip2 gzip tar \
    ssh \
  )
  sudo apt update
  sudo apt install -y ${packages[@]}
}

install_other_packages() {
  local -a packages
  packages=( \
    tig
  )
  sudo apt update
  sudo apt install -y ${packages[@]}
}

install_node() {
  curl -sSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install nodejs
  sudo npm install --global yarn
}

install_go() {
  mkdir -p /tmp/install_go
  wget -P /tmp/install_go https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf /tmp/install_go/go1.17.5.linux-amd64.tar.gz
  rm -rf /tmp/install_go
}

install_ruby() {
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git “$(rbenv root)“/plugins/ruby-build
}

install_docker() {
  sudo apt update
  sudo apt install -y ca-certificates curl gnupg lsb-release
  curl -sSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io

  sudo gpasswd -a $(whoami) docker
  sudo chgrp docker /var/run/docker.sock
  sudo systemctl restart docker
  
  sudo curl -L “https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)” -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}

install_peco() {
  mkdir -p /tmp/install_peco
  wget -P /tmp/install_peco https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz
  tar xzvf /tmp/install_peco/peco_linux_amd64.tar.gz -C /tmp/install_peco
  sudo cp /tmp/install_peco/peco_linux_amd64/peco /usr/local/bin
  rm -rf /tmp/install_peco
}
install_go_packages() {
  local -a packages
  packages=( \
    github.com/x-motemen/ghq@latest \
  )
  go install ${packages[@]}
}

install_essential_packages
if yes_or_no "Do you wish to change default shell to zsh"; then
  sudo chsh -s $(which zsh) "${USER}"
fi

