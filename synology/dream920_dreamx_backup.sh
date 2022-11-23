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
ssh dreamx sudo snapper -c data_backup cleanup timeline
ssh dreamx sudo snapper -c data_backup create 
rsync -azq --exclude ".snapshots" --exclude '*#snapshot*' --exclude '*@eaDir*' --exclude '*#recycle*' --delete /volume1/Calibre* dreamx:/data/backup/
for i in H35 OJ books gitserver_backup subversion_backup docker_backup 
do
rsync -azq --exclude ".snapshots" --exclude '*#snapshot*' --exclude '*@eaDir*' --exclude '*#recycle*' --delete /volume1/$i  dreamx:/data/backup/
done
ssh dreamx sudo snapper -c data_backup cleanup timeline
