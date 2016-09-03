#!/bin/sh

# Neovim
printf  "\tConfiguring nvim\n"
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim
curl -s -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vimrc ~/.config/nvim/init.vim
nvim +PlugInstall +qall

# # Vim
# printf  "\tConfiguring vim\n"
# [ -d ~/.vim ] && rm -rf ~/.vim
# curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# \vim +PlugInstall +qall
