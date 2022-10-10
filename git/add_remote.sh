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
  git remote add gitlab git@gitlab.com:ojehle/$repo
fi
if git remote -v |  grep  github; then
  echo github ok
else
  git remote add github git@github.com:ojehle/$repo
  echo github nok
fi

if git remote -v |  grep  all; then
  echo all ok
else
  git remote add all dream920:/volume1/gitserver/oj/$repo
  git remote set-url --add all git@github.com:ojehle/$repo
  git remote set-url --add all git@gitlab.com:ojehle/$repo
fi
git push all
