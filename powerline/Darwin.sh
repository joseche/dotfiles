#!/bin/sh

if [ -z "$(ls ~/Library/Fonts/*Powerline*)" ]; then
    echo -e "\tPowerline fonts not found, installing"
    [ ! -d ~/tmp ] && mkdir ~/tmp
    cd ~/tmp
    [ -d fonts ] && rm -rf fonts
    git clone https://github.com/powerline/fonts
    cd fonts
    source ./install.sh
fi

pip show powerline-status > /dev/null
if [ $? -eq 1 ]; then
    pip install powerline-status --user
fi
