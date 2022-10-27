#!/bin/bash

pid=$(pgrep backupd$)
if [ ! -z "$pid" ]; then
  watch -n 3 "sudo lsof -p $pid"
fi
