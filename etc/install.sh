#!/bin/sh
set -eu

is_exists() {
  which "$1" > /dev/null 2>&1
  return $?
}

install_tmux() {
  ghq get https://github.com/tmux/tmux.git
  cd ~/dev/src/github.com/tmux/tmux
  sh autogen.sh
  ./configure && make && sudo make install
}

install_peco() {
  mkdir -p .tmp
  cd .tmp
  wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz
  tar xzvf peco_linux_amd64.tar.gz
  cd peco_linux_amd64
  sudo cp peco /usr/local/bin
}

if ! is_exists "tmux"; then
  install_tmux
fi

if ! is_exists "peco"; then
  install_peco
fi

