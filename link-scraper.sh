#!/bin/bash

if [ "$1"=="" ]
then
	echo "*** YOU FORGOT THE URL ***"
	echo "example: https://webscraper.io/test-sites/e-commerce/allinone"
else
	wget -q -O - $1 | grep  -oP '(?<=<a href=").*?(?=")' | sort | uniq | grep -v "#"
fi
