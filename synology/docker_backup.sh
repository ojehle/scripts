#!/bin/bash
DIR="/volume1/docker/#snapshot/"
#DIR="/volume1/H35/#snapshot/"
last=$(ls  -t $DIR|sort -k1.7 | grep -v desktop.ini | tail -1)
if [ -z $last ]; then
  exit 1
fi
rsync -axv --dry-run --exclude "*@eaDir*" $DIR/$LAST/*  /volume1/docker_backup/dream920/

