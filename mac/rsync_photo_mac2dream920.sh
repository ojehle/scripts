#!/bin/bash

services=$(launchctl list | grep -i photo  | awk '{print $3}'  )
for i in $services
do
  launchctl start $i
done
rsync -av /Users/oj/Pictures/* dream920:/volume1/MacPhoto
for i in $services
do
  launchctl start  $i
done
