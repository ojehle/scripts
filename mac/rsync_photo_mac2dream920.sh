#!/bin/bash

h=$(hostname -s)
if [ "$h" = "LuftikusNG" -o "$h" = "LuftikusNG-WLAN" ]; then
  x=1
else
  echo "wrong host"
  exit 1
fi

services=$(launchctl list | grep -i photo  | awk '{print $3}'  )
for i in $services
do
  launchctl stop $i
done
rsync -av /Users/oj/Pictures/* dream920:/volume1/MacPhoto
for i in $services
do
  launchctl start  $i
done
