#!/bin/bash

is_exists() {
  which "$1" > /dev/null 2>&1
  return $?
}

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

dotfiles_logo='
@gtnao''s
   ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
   ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
   ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
   ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██╗██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═╝╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
'

if [ -z "${DOTPATH:-}" ]; then
  DOTPATH=~/.dotfiles
  export DOTPATH
fi
DOTFILES_GITHUB="https://github.com/gtnao0219/dotfiles-ubuntu.git"
export DOTFILES_GITHUB

download_dotfiles() {
  if [ -d "${DOTPATH}" ]; then
    echo "${DOTPATH}: already exists\n"
    exit 1
  fi
  echo "\n"
  echo "Downloading dotfiles...\n"
  local tarball="https://github.com/gtnao0219/dotfiles-ubuntu/archive/refs/heads/master.tar.gz"
  if is_exists "curl"; then
    curl -L "${tarball}"
  elif is_exists "wget"; then
    wget -O - "${tarball}"
  else
    echo "curl or wget required\n"
    exit 1
  fi | tar xvz
  if [ ! -d dotfiles-ubuntu-master ]; then
    echo "dotfiles-ubuntu-master: not found\n"
    exit 1
  fi
  mv -f dotfiles-ubuntu-master "$DOTPATH"
  echo "Download\n"
}

deploy_dotfiles() {
  if [ ! -d "${DOTPATH}" ]; then
    echo "${DOTPATH}: not found\n"
    exit 1
  fi
  echo "\n"
  echo "Deploying dotfiles...\n"
  cd ${DOTPATH}
  bash "${DOTPATH}/deploy.sh"
}

echo "$dotfiles_logo"
download_dotfiles
deploy_dotfiles
bash "${DOTPATH}/scripts/install_essentials.sh"
bash "${DOTPATH}/scripts/install_tools.sh"

make install_node
nvim -E +PlugInstall +qall
nvim -E +"call coc#util#install()" +qall

if yes_or_no "Do you wish to change default shell to zsh"; then
  sudo chsh -s $(which zsh) "${USER}"
  exec $SHELL -l
fi


