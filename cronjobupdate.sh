#!/bin/bash
#automatically
#https://crontab.guru/#30_4_*_*_0
#crontab -l | { cat; echo "30_4_*_*_0 /bin/bash "path/to/server/cronjobupdate.sh""; } | crontab -
#
#enable next 3 lines when you use cron, to write a log file
#exec 3>&1 4>&2
#trap 'exec 2>&4 1>&3' 0 1 2 3
#exec 1>backup/log.out 2>&1

url=https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/

version=$(curl  -sS 'https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/' | grep OPTIONAL  | sort | tail -1 | sed -n 's/.*LATEST OPTIONAL.."*//p' | sed 's/.$//')
echo "Updating now to Version: $version"
echo 
getnewversion=$(curl 'https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/' |
    sed -e 's/^<a href=["'"'"']//i' | 
    awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' |  grep $version | awk '{ print $2 }' | sed -n 's/.*href="..\([^"]*\).*/\1/p')
echo
echo $getnewversion
echo
echo "converting to url ..."
echo
newversion=$"${url}${getnewversion}"
echo $newversion
echo
echo "Starting update ..."
echo
echo "Try now to close fivem with default script screen Name: txAdmin"
screen -S txAdmin -p 0 -X quit
echo
curl -O "$newversion"
echo
mkdir -p backup
mv alpine backup/"$(date +"%d-%m-%y")"-alpine && mv run.sh backup/"$(date +"%d-%m-%y")"-run.sh
tar xf fx.tar.xz
echo
rm fx.tar.xz
echo
echo "Update done!"
echo
echo "Starting now screen with default script screen Name: txAdmin"
echo
echo "All done - Happy Playing! Made with love by cfx/github zatu22"
screen -dmS txAdmin bash run.sh; exec bash
