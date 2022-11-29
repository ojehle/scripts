#!/bin/bash

h=$(hostname -s)
if [ "$h" = "LuftikusNG" ]; then
  echo "wrong host"
  exit 1
fi
services=$(launchctl list | grep -i photo  | awk '{print $3}'  )
for i in $services
do
  launchctl stop $i
done
rsync -av dream920:/volume1/MacPhoto/* /Users/oj/Pictures/
for i in $services
do
  launchctl start  $i
done
