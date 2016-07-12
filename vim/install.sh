#!/bin/sh
# Configure vim and neovim
set -e

# VIM
echo Configuring vim
# [ ! -r ~/.vim/bundle/Vundle.vim ] && \
#     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
[ -d ~/.vim/autoload ] && rm -rf ~/.vim/autoload
curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
\vim +PlugInstall +qall

# NEOVIM
echo Configuring nvim
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim
curl -s -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "$(dirname $0)/vimrc.symlink" ~/.config/nvim/init.vim
nvim +PlugInstall +qall

set +e
