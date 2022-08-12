#!/bin/bash

if [ -z $1 ]
then
	echo "*** YOU FORGOT THE URL ***"
	echo "example: $(<example-link)"
	exit -1
else
	./link-scraper.sh $1 | sort | uniq | grep -v  'http\|#\|@' > temp.txt
	python3 subdir-lister-fix.py $1
#	cat temp.txt
	rm temp.txt
fi
