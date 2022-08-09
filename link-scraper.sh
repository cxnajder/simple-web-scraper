#!/bin/bash

wget -q -O - $1 | grep  -oP '(?<=<a href=").*?(?=")' | sort | uniq | grep -v "#"
