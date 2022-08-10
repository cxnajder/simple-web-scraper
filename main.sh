#!/bin/bash

if [ -z $1 ]
then
	echo "*** YOU FORGOT THE URL ***"
	echo "example: https://webscraper.io/test-sites/e-commerce/allinone"
	exit -1
else
	./subdir-lister.sh $1 > temp.txt
	#loop/read line
	#	script.sh $line &
	#done < file
	rm temp.txt
fi
