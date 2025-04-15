#!/bin/bash

# Define options
options="Power Off\nHibernate\nSleep\nReboot"

# Show wofi menu and capture the selected option
chosen=$(echo -e "$options" | wofi --dmenu --prompt "Input choice:")

# Perform the corresponding action based on the choice
case "$chosen" in
    "Power Off")
        systemctl poweroff
        ;;
    "Hibernate")
        systemctl hibernate
        ;;
    "Sleep")
        systemctl suspend
        ;;
    "Reboot")
        systemctl reboot
        ;;
    *)
        echo "No action selected or invalid option."
        ;;
esac
