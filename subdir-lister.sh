#!/bin/bash

./link-scraper.sh $1 | sort | uniq | grep -v  'http\|#\|@'
