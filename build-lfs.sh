#!/bin/sh

set -e

SCRIPTS_PATH="02-build-lfs"

for script in `ls $SCRIPTS_PATH`
do
	start_time=`date +"%Y-%m-%d %H:%M:%S"`
	echo ">>>>>>>> $start_time  RUN $script START"
	chmod +x $SCRIPTS_PATH/$script
	$SCRIPTS_PATH/$script
	if [ $? -ne 0 ]; then
		exit 0
	fi
	end_time=`date +"%Y-%m-%d %H:%M:%S"`
	echo ">>>>>>>> $end_time  RUN $script END"
done
