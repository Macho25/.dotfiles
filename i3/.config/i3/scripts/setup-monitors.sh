#!/usr/bin/env bash
# wait a bit for X to be ready
sleep 1

# DP-4 primary, 1920x1080@180Hz
xrandr --output DP-4 --primary --mode 1920x1080 --rate 180 --pos 1920x0

# HDMI-0 secondary, 1920x1080@60Hz, left of DP-4
xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --pos 0x0
