#!/bin/bash

repos=$(ssh dream920 find /volume1/gitserver/ -name "*.git")
for i in $repos
do
  lrepo=${i//gitserver/gitmirror}
# echo $i $lrepo
  p=${lrepo//\/volume1\/gitmirror\/}
  p=${p%/*}
  if [ ! -d $lrepo ]; then
	if [ ! -d $p ]; then
	 	mkdir -p $p
	fi
	pushd $p
	git clone --mirror git-oj@dream920:$i
	popd  
  else
	pushd $lrepo
	git remote update
	popd 
  fi
done
