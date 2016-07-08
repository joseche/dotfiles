#!/bin/sh
#
# Homebrew
#

if test "$(uname -s)" = "Darwin"
then
    if test ! $(which brew)
    then
      echo "  Installing Homebrew"
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    cd "$(dirname $0)"
    brew tap homebrew/bundle
    brew bundle
fi
