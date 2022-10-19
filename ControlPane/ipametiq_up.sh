#!/bin/bash
sudo route add -net 172.16.35.0/24 -interface ppp0
sudo route add -host 10.41.26.2 -interface ppp0
