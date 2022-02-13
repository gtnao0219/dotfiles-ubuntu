#!/bin/bash

set -eu

cd `dirname $0`

ln -sfn "${PWD}/bin" "${HOME}/bin" 
ln -sfn "${PWD}/.dir_colors" "${HOME}/.dir_colors" 
ln -sfn "${PWD}/.gitconfig" "${HOME}/.gitconfig"
ln -sfn "${PWD}/.gitignore_global" "${HOME}/.gitignore_global"
ln -sfn "${PWD}/.peco" "${HOME}/.peco"
ln -sfn "${PWD}/.tigrc" "${HOME}/.tigrc"
ln -sfn "${PWD}/.tmux.conf" "${HOME}/.tmux.conf"
ln -sfn "${PWD}/.vim/ultisnips" "${HOME}/.vim/ultisnips" 
mkdir -p "${HOME}/.config/nvim"
ln -sfn "${PWD}/.vimrc" "${HOME}/.config/nvim/init.vim"
ln -sfn "${PWD}/coc-settings.json" "${HOME}/.config/nvim/coc-settings.json"
ln -sfn "${PWD}/.zshenv" "${HOME}/.zshenv"
ln -sfn "${PWD}/.zshrc" "${HOME}/.zshrc"

