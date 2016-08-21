#!/bin/sh
if test "$(uname -s)" = "Darwin"
then
    brew update
    brew upgrade
fi
