#!/bin/sh

CWD=$(pwd -P)

if [ -e ~/.config/flake8 ]; then 
    rm ~/.config/flake8
fi
ln -fs "$CWD/flake8rc" ~/.config/flake8

sudo pip install --upgrade pip
sudo pip install pdb
sudo pip install neovim
sudo pip install pep8-naming

sudo apt install python3-pudb

