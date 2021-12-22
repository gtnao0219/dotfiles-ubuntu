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

if ! is_exists "tmux"; then
  install_tmux
fi

