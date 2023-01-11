#!/bin/bash

ssh dreamx true >/dev/null  2>&1
up=$?
while [[ $up  -ne 0 ]]
do
 sudo synonet --wake 9c:5c:8e:21:77:9b eth0
 sleep 5
 ssh dreamx true >/dev/null  2>&1
 up=$?
done
sleep 10
cd /volume1/
ssh dreamx sudo snapper -c data_backup cleanup all
ssh dreamx sudo snapper -c data_backup create 
rsync -azq --exclude ".snapshots" --exclude '*#snapshot*' --exclude '*@eaDir*' --exclude '*#recycle*' --delete /volume1/Calibre* dreamx:/data/backup/
for i in H35 OJ books gitserver_backup subversion_backup docker_backup 
do
rsync -azq --exclude ".snapshots" --exclude '*#snapshot*' --exclude '*@eaDir*' --exclude '*#recycle*' --delete /volume1/$i  dreamx:/data/backup/
done
ssh dreamx sudo snapper -c data_backup cleanup all
#
#
keep=40
from=$(ssh dreamx sudo snapper -c data_backup list | awk '{ print $1}' | grep ^[0-9] | grep -v 0 | head -1)
to=$(ssh dreamx sudo snapper -c data_backup list | awk '{ print $1}' | grep ^[0-9] | grep -v 0 | tail -$keep | head -1)
if [ -z "$to" -o -z "$from" ]; then
	exit 0
fi
let diff=$to-$from
if [ "$diff" -lt $keep ]; then
  exit 0
fi
echo delete from $from to $to
for (( i=${from}; i<=${to}; i++ ))
do
  ssh dreamx sudo  snapper -c data_backup delete $i
done

