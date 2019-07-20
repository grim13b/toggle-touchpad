#!/bin/bash

device_id=$( xinput | grep -i touchpad | sed -nre '/Touchpad/s/.*id=([0-9]*).*/\1/p' )
state=$( xinput list-props "$device_id" | grep -i "device enabled" | grep -o "[01]$" )

if test $state = '1'
then
	xinput disable "$device_id" && notify-send -i input-touchpad "Toggle Touchpad" "Disabled"
else
	xinput enable "$device_id" && notify-send -i input-touchpad "Toggle Touchpad" "Enabled"
fi
