#!/bin/bash

if [ -z $1 ];
then
	echo "*** YOU FORGOT THE URL ***"
	echo "example: $(<example-link)"
	exit -1
else
	if [ -z $2 ];
	then
		echo "insert name of text files containing regex you're looking for"
		echo "example: title price description"
		echo "If the example regex doesn't work for the website you want to scrap, edit regex file or create your own"
	else
		./subdir-lister.sh $1 > subdoms.txt
		regex1=$(<$2)
		regex2=""
		regex3=""

		if [ $# == 3 ]; then
			regex2=$(<$3)
		fi

		if [ $# == 4 ]; then
			regex2=$(<$3)
			regex3=$(<$4)
                fi
		while read line;
		do
			echo "$1""$line"
			echo "============================================================"
			wget -q -O - "$1""$line" | grep -oP "$regex1"\|"$regex2"\|"$regex3"
			echo "============================================================"
		done < subdoms.txt
		#test:
		#wget -q -O - $1 | grep -oP "$regex1"\|"$regex2"\|"$regex3"
		rm subdoms.txt
	fi
fi
