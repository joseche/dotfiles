#!/bin/sh

# check cool fonts
if ! stat -t "$HOME/Library/Fonts/Ubuntu Mono Nerd Font.ttf" > /dev/null; then
    pushd /tmp
    git clone https://github.com/ryanoasis/nerd-fonts
    cd nerd-fonts
    sudo ./install.sh
    popd
fi

# Neovim
printf  "\tConfiguring nvim\n"
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim
curl -s -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if ! stat -t ~/.config/nvim/init.vim 2>/dev/null ; then 
    ln -s ~/.vimrc ~/.config/nvim/init.vim
fi
nvim +PlugInstall +qall

# # Vim
# printf  "\tConfiguring vim\n"
# [ -d ~/.vim ] && rm -rf ~/.vim
# curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# \vim +PlugInstall +qall
