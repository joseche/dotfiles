#!/bin/sh

sudo apt install -y sysstat lm-sensors sensord vim-gtk3 i2c-tools terminology \
   zsh git python3-pudb virtualenv rubygems ruby-all-dev \
   python-setuptools python-dev build-essential \
   awscli curl wget nmap

sudo apt -y autoremove

sudo easy_install pip

