#!/bin/bash
#
brew update
brew upgrade
#
packages=$(brew list --casks -1 -l)
for i in $packages; do
    brew upgrade $i
done
