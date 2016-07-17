#!/usr/bin/env bash
#

# Exit on errors
set -e

# Change dir to dotfiles dir
cd "$(dirname "$0")"

DOTFILESDIR=$(pwd -P)
echo "dotfiles folder: $DOTFILESDIR"

link_file() {
  # $1 - source file or dir to link
  # $2 - destination file or dir
  if [ -e "$2" ]; then
      rm -rf "$2"
      echo -e "\tExisting $2 removed!"
  fi
  ln -sf "$1" "$2" && echo -e "\tLinked: $2 -> $1"
}

remove_files() {
  for src in $(find -H $DOTFILESDIR -maxdepth 4 -name '*.symlink' -not -path '*.git*')
  do
      # remove the extension '.symlink'
      dst="$HOME/.$(basename "${src%.*}")"
      # if file exists, check if different
      if [ -e "$dst" ]; then
          rm -rf "$dst" && echo "$dst removed"
      fi
  done
}

symlink_files() {
  for src in $(find -H $DOTFILESDIR -maxdepth 4 -name '*.symlink' -not -path '*.git*')
  do
      DF=1

      # remove the extension '.symlink'
      dst="$HOME/.$(basename "${src%.*}")"

      # if file exists, check if different
      if [ -e "$dst" ]; then
          diff "$src" "$dst" > /dev/null 2>/dev/null
      DF=$?
      fi

      # if different, remove and link
      if [ ! $DF -eq 0 ]; then
          link_file "$src" "$dst"
      fi
  done
}

run_files(){
    # $1 is the pattern to search and run
    for src in $(find -H $DOTFILESDIR -maxdepth 4 -name "$1" -not -path '*.git*')
    do
        DIR=$(dirname "$src")
        SCRIPT=$(basename "$src")

        cd "$DIR"
        echo "Running: $DIR"
        source "$SCRIPT"
        cd "$DOTFILESDIR"
    done
}

args="$@"
if [ -z "$*" ]; then
    args="-i"
fi

for arg in $args; do
    if [ -z "$arg" ] || [ "$arg" == "-i" ]; then
        git pull
        symlink_files
        run_files "configure.sh"
    elif [ "$arg" == "-u" ]; then
        git pull
        run_files "update.sh"
    elif [ "$arg" == "-c" ]; then
        remove_files
    elif [ "$arg" == "-h" ]; then
        echo -e "\nRun '$0 -i' for installing the dotfiles"
        echo -e "Run '$0 -u' for updates to gems, packages, etc..."
        echo -e "Run '$0 -c' for removing the dotfiles"
    fi
done

set +e
