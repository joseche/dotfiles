#!/bin/sh
if test "$(uname -s)" = "Darwin"
then
    if test ! $(which brew)
    then
      echo -e "\tInstalling Homebrew"
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew tap homebrew/bundle
    brew bundle
fi
