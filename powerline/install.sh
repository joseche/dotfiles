#!/bin/sh

[ ! -d ~/tmp ] && mkdir ~/tmp
cd ~/tmp
[ -d fonts ] && rm -rf fonts
git clone https://github.com/powerline/fonts
cd fonts
source ./install.sh

pip install powerline-status --user

