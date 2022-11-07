#!/bin/bash
tokeep=$(log show --predicate 'subsystem == "com.apple.TimeMachine"' --info --last 4h | grep "Marked as reference snapshot: " | tail -1 | awk '{ print $NF }')
if [ -z "$tokeep" ]; then 
  exit 1
fi
echo "keep $tokeep"
snaps=$(tmutil listlocalsnapshots / |grep -v $tokeep | grep com. )
for i in $snaps
do
   timestamp=$(echo $i | awk -F. '{print $4}')
   sudo tmutil deletelocalsnapshots $timestamp
done
