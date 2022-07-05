#!/bin/bash
if [[ $(command -v curl) ]]; then
curl -# -64 https://antizapret.prostovpn.org/domains-export.txt > ./russia-blacklist.txt;
else
if [[ $(command -v wget) ]]; then
wget -4 -t 3 https://antizapret.prostovpn.org/domains-export.txt -O - > ./russia-blacklist.txt;
fi
fi
exit 0
