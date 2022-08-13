#!/bin/bash
echo "##==================================##"
echo "||  WELCOME TO SILMPLE WEB SCRAPER  ||"
echo "##==================================##"
echo "|| Please input the website link    ||"
echo "##==================================##"
read -p 'link: ' link
ip_adr=""
ip_adr=$(ping -c 1 $link | grep "64 bytes" | cut -d " " -f 5 | tr -d "():")
if [ $ip_adr != "" ]; then

    echo "IP: $ip_adr"
    
    site_cont=$(wget -q -O - $link)
    echo $site_cont | grep -oP '(?<=href=").*?(?=")' | sort | uniq > greped_links.txt
    echo "##==================================##"
    echo "||              MAILE:              ||"
    cat greped_links.txt | grep '@'
    echo "##==================================##"
    echo "||         http/https links:        ||"
    cat greped_links.txt | grep "http"
    echo "##==================================##"
    echo "||             subdomains:          ||"
    cat greped_links.txt |  grep -oP "(?<=https://).*(?=.$link/)" | sort | uniq
    echo "##==================================##"
    echo "||          sub directories:        ||"
    cat greped_links.txt | grep -oP "(?<=https://www.$link/).*"



    rm greped_links.txt
else
    echo "##==================================##"
    echo "||       Strona nie odpowiada       ||"
    echo "##==================================##"
fi
#echo "|| ||"
#echo "##==================================##"