#!/bin/bash

ping -q -c 1 -W 1 dreamx >/dev/null 2>&1 
up=$?
while [[ $up  -ne 0 ]]
do
 /usr/local/bin/wakeonlan 9c:5c:8e:21:77:9b  
 sleep 5
 ping -q -c 1 -W 1 dreamx >/dev/null 2>&1 
 up=$?
done
ssh dreamx
