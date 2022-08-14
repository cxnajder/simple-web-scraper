#!/bin/bash
echo "##==================================##"
echo "||  WELCOME TO SILMPLE WEB SCRAPER  ||"
echo "##==================================##"
echo "|| Please input the website link    ||"
echo "##==================================##"
read -p 'link: ' link
ip_adr=""
#ip_adr=$(ping -c 1 $link | grep "64 bytes" | cut -d " " -f 5 | tr -d "():")
ip_adr=$(ping -c 1 $link | grep -oE "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | uniq)
if [ $ip_adr != "" ]; then

    echo "IP: $ip_adr"
    
    site_cont=$(wget -q -O - $link)
    echo $site_cont | grep -oP '(?<=href=").*?(?=")' | grep -v '#' | sort | uniq > greped_links.txt


    while read url;
    do
		if echo "$url" | grep -q "$link"; then
            #wget -q -O - $url | grep -oP '(?<=href=").*?(?=")' | grep -v '#' | sort | uniq > "$url".txt &
            #NO SUCH FILRE OR DIRECTORY ERROR -> '"$url".txt'

        elif echo "$url" | grep -qv "http\|@"; then
            #wget -q -O - $link$url | grep -oP '(?<=href=").*?(?=")' | grep -v '#' | sort | uniq > "$link""$url".txt &
            #NO SUCH FILRE OR DIRECTORY ERROR -> '"$link""$url".txt'
        fi
	done < greped_links.txt

    echo "##==================================##"
    echo "||              MAILE:              ||"
    cat greped_links.txt | grep '@'
    echo "##==================================##"
    echo "||             subdomains:          ||"
    cat greped_links.txt |  grep -oP "(?<=https://).*(?=.$link/)" | sort | uniq > subdoms.txt
    cat subdoms.txt
    echo "##==================================##"
    echo "||          sub directories:        ||"

    echo "====== "$link"/ ==="
    cat greped_links.txt | grep -oP "/$link/.*"
    cat greped_links.txt | grep -v "http\|@\|#" | grep "/"
    while read line;
	do
		echo "====== "$line"."$link"/ ==="
		cat greped_links.txt | grep -oP "$line.$link/.*"
        #cat greped_links.txt | grep -oP "(?<=https://$line.$link/).*"
	done < subdoms.txt

    #cat greped_links.txt | grep -oP "(?<=https://www.$link/).*"
    echo "##==================================##"
    echo "||            other links:          ||"   
    cat greped_links.txt | grep -v "$link\|@"


    rm greped_links.txt
    rm subdoms.txt
else
    echo "##==================================##"
    echo "||       Strona nie odpowiada       ||"
    echo "##==================================##"
fi
#echo "|| ||"
#echo "##==================================##"