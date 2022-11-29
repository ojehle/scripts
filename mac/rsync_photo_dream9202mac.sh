#!/bin/bash

services=$(launchctl list | grep -i photo  | awk '{print $3}'  )
for i in $services
do
  launchctl stop $i
done
rsync --dry-run -av dream920:/volume1/MacPhoto/* /Users/oj/Pictures/
for i in $services
do
  launchctl start  $i
done
