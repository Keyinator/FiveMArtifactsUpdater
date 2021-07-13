# FiveM TxAdmin Updater Script

#Linux only
Update.sh:

1. Copy update.sh to your server where alpine and run.sh is located
2. Close txAdmin & screen  (when screen name is not txAdmin)
3. bash update.sh
4. follow instruction

You can run update.sh at anytime again, screen get automatically closed and reopen after update and you will always have a backup of last txAdmin version in backup folder

#Linux only
cronjobupdate.sh:
(No interaction necessary - always fetch LATEST OPTIONAL)

1. Copy cronjobupdate.sh to your server where alpine and run.sh is located
2. Close txAdmin & screen  (when screen name is not txAdmin)
3. bash cronjobupdate.sh
#Run update automatically:
4. crontab -l | { cat; echo "30_4_*_*_0 /bin/bash "path/to/server/cronjobupdate.sh""; } | crontab -
5. (optional) enable log in cronjobupdate.sh
6. Every Sunday 4.30am update starts automatically
