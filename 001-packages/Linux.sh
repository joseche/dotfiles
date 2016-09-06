#!/bin/sh

which apt 2>/dev/null
if [ $? -eq 0 ]; then 
    . ./apt.sh
else 
    . ./pacman.sh
fi
