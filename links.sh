#!/bin/bash

wget -q -O - https://webscraper.io/test-sites/e-commerce/allinone | grep  -E -o '<a href=".*">'
