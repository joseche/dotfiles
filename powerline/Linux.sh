#!/bin/sh

sudo apt install -y fonts-powerline powerline python3-powerline

pip show powerline-status > /dev/null
if [ $? -eq 1 ]; then
    pip install powerline-status --user
fi
