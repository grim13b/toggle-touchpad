#!/bin/bash

state=$( gsettings list-recursively org.gnome.desktop.peripherals.touchpad | grep -i "send-events" | sed -nre "/send-events/s/.*'([a-z]*)'/\1/p" )

if test $state = 'enabled'
then
    gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled
    notify-send -i input-touchpad "Toggle Touchpad" "Disabled"
else
    gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
    notify-send -i input-touchpad "Toggle Touchpad" "Enabled"
fi
