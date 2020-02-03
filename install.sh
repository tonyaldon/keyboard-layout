#!/bin/bash
# -*- coding: utf-8 -*-
# copyright (c): 2019 Tony Aldon <aldon.tony@gmail.com>
# License: MIT


# [file] "evdev.xml"
if [[ -e "backup/backup-evdev.xml" ]]; then
    echo "[file: evdev.xml] You've already made a backup"
else
    mkdir backup
    cp /usr/share/X11/xkb/rules/evdev.xml backup/backup-evdev.xml
    echo "[file: evdev.xml] backup file has been created"
fi

rm -rf /usr/share/X11/xkb/rules/evdev.xml
ln xkb/evdev.xml /usr/share/X11/xkb/rules/evdev.xml

# [file] "takbl" keyboard layout
if [[ -e /usr/share/X11/xkb/symbols/takbl ]]; then
    echo "[file: takbl] this keyboald layout already exist in directory:"
    echo "/usr/share/X11/xkb/symbols/"
    echo "you can't make hard link."
else
    ln xkb/takbl /usr/share/X11/xkb/symbols/takbl
fi
