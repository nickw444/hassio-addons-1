#!/bin/sh

#adapted from sretalla/kevineye

#set to use host dbus in HA config file

avahi-daemon --daemonize --no-chroot

mkdir -p /config/forked-daapd/cache
[[ ! -f /config/forked-daapd/forked-daapd.conf ]] && cp /usr/local/etc/forked-daapd.conf /config/forked-daapd/forked-daapd.conf
mkdir -p /config/forked-daapd/music
[[ ! -f /config/forked-daapd/music/HomeAssistantAnnounce ]] && mkfifo -m 666 /config/forked-daapd/music/HomeAssistantAnnounce

exec forked-daapd -f -c /config/forked-daapd/forked-daapd.conf -P /var/run/forked-daapd.pid