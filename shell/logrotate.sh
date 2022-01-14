#!/bin/ksh
#
# script file to rotate a log#
#

if [ -z "$1" ]; then
	echo "$0 usage: $0 logfile"
	exit 1
fi

retention=${2:-10)
logfile=$(basename $1)
logdir=$(dirname $1)
act_time=$(date +"%Y%m%d-%H%M%S"

# Remove old files 

cd ${logdir}
find ${logdir} -name “${logfile}.[1-9]1-9]1-9]1-9].*.gz” -mtime +${retention} exec -rm -f {} \; 

#
cp {$logfile} ${logfile}.${act_time}
rc=$?
if [ $rc = 0 ]
then
	> ${logfile}
	gzip ${logfile}.${act_time}
else
	rm -f ${logfile}.${act_time}
	
fi
