#!/bin/bash

p=$1
if [ ! -d "$p" ]; then
  echo $p not exists
  exit 1
fi
pushd $p
url=$(git remote -v | grep fetch | tail -1 | awk '{print $2}')
repo=${url##*/}
# check gitlab
if git remote -v |  grep  gitlab; then
  echo gitlab ok
else
  echo gitlab nok
  git remote add git@gitlab.com:ojehle/$repo
fi
if git remote -v |  grep  github; then
  echo github ok
else
  git remote add git@github.com:ojehle/$repo
  echo github nok
fi
