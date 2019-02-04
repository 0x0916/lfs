#!/bin/sh

set -e

SCRIPTS_PATH="01-constructing-temporary-system"

for script in `ls $SCRIPTS_PATH`
do
	echo ">>>>>>>>  RUN $script START"	
	chmod +x $SCRIPTS_PATH/$script
	$SCRIPTS_PATH/$script
	if [ $? -ne 0 ]; then
		exit 0
	fi
	echo ">>>>>>>>  RUN $script END"	
done
