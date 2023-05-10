#!/bin/bash

DIR="$1"
if [[ -z "$DIR" ]];then
	echo "Usage: bash $0 [ directory ]"
	exit 1
fi
if [[ -d "$DIR" ]];then
	DIR_USER=$(stat -c '%U' "$DIR")
	DIR_GRP=$(stat -c '%G' "$DIR")
	find "$DIR" -type f|while read FILE;do
		FILE_USER=$(stat -c '%U' "$FILE")
		FILE_GRP=$(stat -c '%G' "$FILE")
		if [[ $FILE_USER != $DIR_USER ]] || [[ $FILE_GRP != $DIR_GRP ]];then
			echo "$FILE" >&3
		fi
		PERM=$(stat -L -c "%A" "$FILE")
		if [[ ${PERM:8:1} == w ]];then
			echo "$FILE" >&4
		fi
		if [[ ${PERM:3:1} == s ]] &&  [[ ${PERM:9:1} == x ]] ;then
			echo "$FILE" >&5
		fi

	done
else
	echo "$DIR not found"
fi


exit 0