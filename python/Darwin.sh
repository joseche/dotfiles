#!/bin/sh

CWD=$(pwd -P)

if [ -e ~/.config/flake8 ]; then 
    rm ~/.config/flake8
fi
ln -fs "$CWD/flake8rc" ~/.config/flake8

sudo easy_install pip
sudo -H pip install --upgrade pip --upgrade
sudo -H pip install --upgrade pdb neovim pep8-naming flask nose nose-cov rednose pytest pytest-cov mock requests Django mccabe pylama pycodestyle

