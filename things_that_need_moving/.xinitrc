#!/bin/sh

session=${1:-bspwm}

case $session in
    lxqt              ) exec startlxqt;;
    xfce              ) exec startxfce4;;
    bspwm             ) exec bspwm;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
