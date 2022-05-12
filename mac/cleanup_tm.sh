#!/bin/bash
dates=$(tmutil listlocalsnapshots / | awk -F. '{print $4}')
for i in $dates; do
  tmutil deletelocalsnapshots $i
done
