#!/bin/bash
cont_id=$(docker ps | grep subversion | awk '{print $1}')
#echo $cont_id
docker exec $cont_id /var/svn-backup/svn-backuper.sh
if [ ! -f /volume1/subversion_backup/last_backup.txt ]; then
  exit 0
fi
rsync -axq /volume1/docker/subversion/dav_svn /volume1/subversion_backup/
files=$(awk -F/ '{print $(NF)}' /volume1/subversion_backup/last_backup.txt)
for i in $files
do
	touch /volume1/subversion_backup/$i
	chmod 750 /volume1/subversion_backup/$i
done
