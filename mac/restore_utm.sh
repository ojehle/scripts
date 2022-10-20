#!/bin/bash

x=$(mount |grep /Volumes/VirtualBoxImages)
if [ -z "$x" ]; then
  echo mount first 
  exit 1
fi
rm -rf /Users/oj/Library/Containers/com.utmapp.UTM/Data/Documents/*.utm
cp -pr /Volumes/VirtualBoxImages/UTM/*.utm /Users/oj/Library/Containers/com.utmapp.UTM/Data/Documents/
