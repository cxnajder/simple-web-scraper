#!/bin/bash

wget -q -O - https://webscraper.io/test-sites/e-commerce/allinone | grep "<h4 class=\"pull-right price\">" | tr -d '<h4 class="pull\-right price">''</h4>'
