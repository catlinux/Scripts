#!/bin/sh

if [ "`ps -e | grep gdm`" ]; then
ADR=$(zenity --width=500 --height=400 --list --radiolist --title="Script Sopcast - Vlc" --text "Escull el canal que vols veure" \
 --column "opció" --column "Enllaç" --column "Canal" \
FALSE "sop://broker2.sopcast.com:3912/151169" "ArenaVision 1" \
FALSE "sop://broker2.sopcast.com:3912/151170" "ArenaVision 2" \
FALSE "sop://broker2.sopcast.com:3912/151171" "ArenaVision 5" \
FALSE "sop://broker2.sopcast.com:3912/151172" "ArenaVision 7" \
FALSE "sop://broker2.sopcast.com:3912/151173" "ArenaVision 9" \
FALSE "sop://broker2.sopcast.com:3912/151174" "ArenaVision 11" \
FALSE "sop://broker2.sopcast.com:3912/151175" "ArenaVision 13")
elif [ "`ps -e | grep kdm`" ]; then
ADR=$(kdialog --menu "Escull el canal que vols veure" \
sop://broker2.sopcast.com:3912/151169 "ArenaVision 1" \
sop://broker2.sopcast.com:3912/151170 "ArenaVision 2" \
sop://broker2.sopcast.com:3912/151171 "ArenaVision 5" \
sop://broker2.sopcast.com:3912/151172 "ArenaVision 7" \
sop://broker2.sopcast.com:3912/151173 "ArenaVision 9" \
sop://broker2.sopcast.com:3912/151174 "ArenaVision 11" \
sop://broker2.sopcast.com:3912/151175 "ArenaVision 13";);
else
exit 0
fi

sp-sc-auth $ADR \ 10034 2050 > /dev/null &
sleep 5
vlc http://localhost:2050/tv.asf > /dev/null &
kill_sp_sc=`jobs -l | grep sp-sc-auth | awk '{print $2}'`
wait_for_vlc=`jobs -l | grep vlc | awk '{print $2}'`
wait $wait_for_vlc
kill $kill_sp_sc
