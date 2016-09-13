#!/bin/sh

sudo apt install -y sysstat lm-sensors sensord vim-gtk3 i2c-tools terminology \
   zsh git python3-pudb virtualenv rubygems ruby-all-dev \
   python-setuptools python-dev build-essential \
   awscli curl wget nmap exuberant-ctags wifite wireshark \
   macchanger bpython3 gitk virtualbox-qt virtualbox-ext-pack \
   virtualbox-dkms virtualbox-guest-dkms virtualbox-guest-x11 \
   virtualbox-guest-utils libvirt-bin vagrant vagrant-lxc \
   qemu-kvm mailutils lxctl virtualbox-guest-additions-iso \
   sqlite3 virtualbox golang

sudo apt -y autoremove

sudo easy_install pip

