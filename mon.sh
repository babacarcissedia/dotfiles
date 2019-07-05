#! /bin/sh
INTERFACE=wlo1
ifconfig $INTERFACE down
iwconfig $INTERFACE mode monitor
ifconfig $INTERFACE up
