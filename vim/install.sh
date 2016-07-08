#!/bin/sh
# Configure vim and neovim

# VIM 
echo Configuring vim
[ ! -r ~/.vim/bundle/Vundle.vim ] && \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
\vim +PluginInstall +qall

# NEOVIM
echo Configuring nvim
[ ! -d ~/.config/nvim ] && mkdir -p ~/.config/nvim
[ ! -r ~/.config/nvim/init.vim ] && ln -s "$(dirname $0)/nvim.init" ~/.config/nvim/init.vim
[ ! -r ~/.config/nvim/autoload/plug.vim ] && curl -s -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
