#!/bin/bash
#automatically
#https://crontab.guru/#30_4_*_*_0
#crontab -l | { cat; echo "30_4_*_*_0 /bin/bash "path/to/server/cronjobupdate.sh""; } | crontab -
#
#enable next 3 lines when you use cron, to write a log file
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>log.out 2>&1

url=https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
infoFull=$(curl -sS ${url} |
    sed -e 's/^<a href=["'"'"']//i' |
    awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' |
    sed -n 's/.*href="..\([^"]*\).*/\1/p' | sort | tail -2 | head -1)
infoVersion=$(sed 's/\(^....\).*/\1/' <<< $infoFull)
infoFullpath=$"${url}${infoFull}"
echo "Updating now to Version: $infoVersion"
echo

echo "Downloading from url: $infoFullpath"
echo
curl -O "$infoFullpath"

echo "Stopping fivem.service"
echo
sudo systemctl stop fivem

echo "Deleting old files"
echo
rm -rf alpine

echo "Extracting"
echo
tar xf fx.tar.xz
rm fx.tar.xz

echo "Update done, restarting server"
sudo systemctl start fivem
sudo systemctl reboot
