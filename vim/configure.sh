#!/bin/sh

# VIM
echo -e "\tConfiguring vim"
[ -d ~/.vim/autoload ] && rm -rf ~/.vim/autoload
curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
\vim +PlugInstall +qall

# NEOVIM
echo -e "\tConfiguring nvim"
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim
curl -s -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vimrc ~/.config/nvim/init.vim
nvim +PlugInstall +qall
