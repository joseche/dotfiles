#!/bin/sh

if [ -f "~/Library/Fonts/Hack-Boldttf" ]; then
    [ ! -d ~/tmp ] && mkdir ~/tmp
    cd ~/tmp
    [ -d fonts ] && rm -rf fonts
    git clone https://github.com/powerline/fonts
    cd fonts
    source ./install.sh
fi

pip install powerline-status --user

