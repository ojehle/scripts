#/usr/bin/bash
pids=$(ps -ef |grep -v grep|grep rsync | grep -v show_rsync |awk '{ print $2 }')
for i in $pids
do
ls -l /proc/$i/fd |grep -v socket | grep -v /dev | grep -v /var/log | grep -v pipe | grep -v @tmp | grep -v anon
done
