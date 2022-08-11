#!/bin/bash

if [ -z $1 ];
then
	echo "*** YOU FORGOT THE URL ***"
	echo "example: https://webscraper.io/test-sites/e-commerce/allinone"
	exit -1
else
	if [ -z $2 ];
	then
		echo "insert name of text file containing regex you're looking for"
		echo "example: "
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
		#while read line;
		#do
		#	wget -q -O - "$1""$line" | grep -oP "$regex1"\|"$regex2"\|"$regex3" &
		#done < subdoms.txt
		#test:
		wget -q -O - $1 | grep -oP "$regex1"\|"$regex2"\|"$regex3"
		rm subdoms.txt
	fi
fi
