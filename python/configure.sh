#!/bin/sh

CWD=$(pwd -P)

if [ -e ~/.config/flake8 ]; then 
    rm ~/.config/flake8
fi
ln -fs "$CWD/flake8rc" ~/.config/flake8

pip install --upgrade pip
pip install pdb
pip install neovim
pip install pep8-naming

