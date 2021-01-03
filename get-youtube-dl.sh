#!/bin/bash
#
# youtube-dl
# https://rg3.github.io/youtube-dl/download.html

## with curl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

## with wget
# sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
# sudo chmod a+rx /usr/local/bin/youtube-dl
