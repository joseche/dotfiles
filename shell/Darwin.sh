#!/bin/sh

ZSH=$(echo $SHELL|grep zsh)
if [ -z "$ZSH" ]; then 
    echo -e "\nShell is NOT zsh, setting shell, it may ask your password"
    chsh -s /usr/local/bin/zsh
fi
