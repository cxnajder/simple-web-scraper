#!/bin/bash

wget -q -O - https://webscraper.io/test-sites/e-commerce/allinone | grep -oP  '(?<=<h4 class="pull-right price">).*?(?=</h4>)'

