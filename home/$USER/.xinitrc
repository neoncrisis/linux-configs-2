#!/bin/bash

## Wallpaper & Compositing
$( nitrogen --restore &>> /tmp/nitrogen.log ) || true
$( xcompmgr &>> /tmp/xcompmgr.log ) &

exec ck-launch-session dbus-launch openbox-session
