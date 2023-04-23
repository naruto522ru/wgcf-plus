#!/usr/bin/env bash
if [[ $(command -v curl) ]]; then
curl -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0' -# -64 https://antizapret.prostovpn.org/domains-export.txt > ./russia-blacklist.txt;
else
if [[ $(command -v wget) ]]; then
wget -4 -t 3 https://antizapret.prostovpn.org/domains-export.txt -O - > ./russia-blacklist.txt;
fi
fi
exit 0
