#!/bin/bash

if [ -z $1 ]
then
	echo "*** YOU FORGOT THE URL ***"
	echo "example: https://webscraper.io/test-sites/e-commerce/allinone"
	exit -1
else
	wget -q -O - $1 | grep  -oP '(?<=<a href=").*?(?=")' | sort | uniq | grep -v "#"
fi
