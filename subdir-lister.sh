#!/bin/bash

if [ -z $1 ]
then
	echo "*** YOU FORGOT THE URL ***"
	echo "example: https://webscraper.io/test-sites/e-commerce/allinone"
	exit -1
else
	./link-scraper.sh $1 | sort | uniq | grep -v  'http\|#\|@'
fi
