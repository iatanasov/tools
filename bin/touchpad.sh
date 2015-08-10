#!/bin/sh
 
# this script sets some parameters to get a useable configuration
# these changes are not persistent, you may want to include this in your autostart
 
# 1 finger = left click, 2 finger = right click, 3 finger = middle click
synclient TapButton2=2
synclient TapButton3=3
synclient ClickFinger2=2
synclient ClickFinger3=3
 
# enable horizontal two-finger scrolling (vertical is enabled by default)
synclient HorizTwoFingerScroll=1
 
# disable the top edge of the touchpad to prevent jittering when using the trackpoint
synclient AreaTopEdge=2500
 
# configure trackpoint buttons
synclient RightButtonAreaLeft=3700
synclient RightButtonAreaRight=0
synclient RightButtonAreaTop=0
synclient RightButtonAreaBottom=2300
synclient MiddleButtonAreaLeft=2900
synclient MiddleButtonAreaRight=3500
synclient MiddleButtonAreaTop=0
synclient MiddleButtonAreaBottom=2300


#other options
synclient PalmDetect=2
synclient PalmMinWidth=1
synclient PalmMinZ=2
