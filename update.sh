#!/bin/bash
#manually
echo "Hello, lets update your txAdmin!"
echo
echo "https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/"
echo
read -p "Please paste the direct URL from LATEST RECOMMENDED " url
echo
echo "Got it! Check URL and confirm with enter or abort with CTR+C: "
echo
read -p "$url " -n 1 -r
echo
echo "Starting update ..."
echo
echo "Try now to close txAdmin with default script screen Name: txAdmin"
screen -S txAdmin -p 0 -X quit
echo
curl -O "${url}"
echo
mkdir -p backup && mv alpine backup/"$(date +"%d-%m-%y")"-alpine && mv run.sh backup/"$(date +"%d-%m-%y")"-run.sh
tar xf fx.tar.xz
echo
rm fx.tar.xz
echo
echo "Update done!"
echo
read -p "Press Enter to confirm screen start and close after check with CTR A+D script will be exit with that to" -n 1 -r
echo
echo "Starting now screen with default script screen Name: txAdmin"
echo
echo "All done - Happy Playing! Made with love by cfx zatu22"
screen -S txAdmin bash run.sh; exec bash

