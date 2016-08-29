#!/bin/sh

ZSH=$(echo $SHELL|grep zsh)
if [ -z "$ZSH" ]; then 
    echo -e "\nShell is NOT zsh, setting shell, it may ask your password"
    chsh -s /usr/local/bin/zsh
fi

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  if [ "$rcfile" = "zshrc" -o "$rcfile" = "zpreztorc" ]; then
    ; # ignore configurations I overwrite
  else
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  fi
done

