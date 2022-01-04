#!/bin/sh

ln -sfn "${PWD}/.gitignore_global" "${HOME}/.gitignore_global"
ln -sfn "${PWD}/.gitconfig" "${HOME}/.gitconfig"
ln -sfn "${PWD}/.zshenv" "${HOME}/.zshenv"
ln -sfn "${PWD}/.zshrc" "${HOME}/.zshrc"
ln -sfn "${PWD}/.vimrc" "${HOME}/.vimrc"
ln -sfn "${PWD}/.tmux.conf" "${HOME}/.tmux.conf"
ln -sfn "${PWD}/.peco" "${HOME}/.peco"
mkdir -p ~/.config/nvim
ln -sfn "${PWD}/.vimrc" "${HOME}/.config/nvim/init.vim"

