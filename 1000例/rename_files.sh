#!/bin/bash

LOCATION=$1
cd $LOCATION
# LOCATION_FILES_NUM=`ls -l | grep "IMG" | wc -l `
CUREENPATH=`pwd`

# arr=()
index=0
function rename() {
	# echo $FILES
	if [[ ! -e "$CUREENPATH/rename_files" ]]; then
		mkdir 'rename_files'
	fi

	for f in `ls`; do
		index=$[$index+1]

		mv $CUREENPATH/$f $CUREENPATH/rename_files/'王家康'$index".mp4"
	done

}

rename


# example:
# sh /Users/rongshouzhen/Downloads/rename.sh /Users/rongshouzhen/Downloads/wang 