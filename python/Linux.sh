#!/bin/sh

CWD=$(pwd -P)

if [ -e ~/.config/flake8 ]; then 
    rm ~/.config/flake8
fi
ln -fs "$CWD/flake8rc" ~/.config/flake8

sudo easy_install pip
sudo pip install --upgrade pip --upgrade
sudo pip install --upgrade pdb
sudo pip install --upgrade neovim
sudo pip install --upgrade pep8-naming
sudo pip install --upgrade flask
sudo pip install --upgrade nose
sudo pip install --upgrade nose-cov
sudo pip install --upgrade rednose
sudo pip install --upgrade pytest
sudo pip install --upgrade pytest-cov
sudo pip install --upgrade mock
sudo pip install --upgrade requests
sudo pip install --upgrade Django

sudo apt -y autoremove
sudo apt -y install python3-pudb
sudo apt -y install virtualenv
sudo apt -y install virtualenvwrapper

