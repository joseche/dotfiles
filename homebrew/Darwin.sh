#!/bin/sh
if test ! $(which brew)
then
  echo -e "\tInstalling Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew tap homebrew/bundle
echo -e "\tChecking brew packages"
brew bundle|grep Success
