#!/bin/bash

# greeting

cat << "HI"
 ___           _        _ _           
|_ _|_ __  ___| |_ __ _| | | ___ _ __ 
 | || '_ \/ __| __/ _` | | |/ _ \ '__|
 | || | | \__ \ || (_| | | |  __/ |   
|___|_| |_|___/\__\__,_|_|_|\___|_|   
HI

# variables for making text bold

bold=$(tput bold)
normal=$(tput sgr0)

# asking if user wants to install configs

while true; do
  read -p "${bold}DO YOU WANT TO START THE INSTALLATION NOW?${normal} (Yy/Nn): " yn
  case $yn in
  [Yy]*)
    echo ":: Installation started."
    echo
    break
   ;;
  [Nn]*)
    echo ":: Installation canceled"
    exit
    break
   ;;
  *)
    echo ":: Please answer yes or no."
    ;;
  esac
done

# checking if .config directory exists

echo "Searching for ${bold}~/.config${normal} directory..."

if test ! -d ~/.config/; then
  echo "Did not find ${bold}~/.config${normal} directory, creating..."
  mkdir ~/.config/

  if [ $? -eq 0 ]; then
    echo "Created ${bold}~/.config/${normal} directory!"
  else
    echo "Could not create ${bold}~/.config/${normal} directory :("
    exit 1
  fi
else
  echo "Found ${bold}~/.config${normal} directory"
fi


# installing hypr directory

if test -d ~/.config/hypr/; then
  echo "Found ${bold}~/.config/hypr${normal} directory, backuping it into ${bold}~/.config/hypr-backup..."
  mv ~/.config/hypr/ ~/.config/hypr-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/hypr-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/hypr ~/.config/
echo "Copied ${bold}hypr${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing waybar directory

if test -d ~/.config/waybar/; then
  echo "Found ${bold}~/.config/waybar${normal} directory, backuping it into ${bold}~/.config/waybar-backup..."
  mv ~/.config/waybar/ ~/.config/waybar-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/waybar-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/waybar ~/.config/
echo "Copied ${bold}waybar${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing swaync directory

if test -d ~/.config/swaync/; then
  echo "Found ${bold}~/.config/swaync${normal} directory, backuping it into ${bold}~/.config/swaync-backup..."
  mv ~/.config/swaync/ ~/.config/swaync-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/swaync-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/swaync ~/.config/
echo "Copied ${bold}swaync${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing rofi directory

if test -d ~/.config/rofi/; then
  echo "Found ${bold}~/.config/rofi${normal} directory, backuping it into ${bold}~/.config/rofi-backup..."
  mv ~/.config/rofi/ ~/.config/rofi-backup
   if [ $? -eq 0 ]; then
    echo "Now your old configs are in ${bold}~/.config/rofi-backup${normal} directory"
  fi
fi

cp -r DOTFILES/.config/rofi ~/.config/
echo "Copied ${bold}rofi${normal} directory from this repo to ${bold}~/.config/${normal} directory"

# installing scripts directory

if test -d ~/.config/scripts/; then
  echo "Found ${bold}~/.config/scripts${normal} directory, copying contents of ${bold}scripts${normal} directory into ${bold}~/.config/scripts${normal} directory"
  cp DOTFILES/.config/scripts/option_menu.sh ~/.config/scripts
   if [ $? -eq 0 ]; then
    echo "${bold}Done!"  
   fi
fi

cp -r DOTFILES/.config/scripts ~/.config/
echo "Copied ${bold}scripts${normal} directory from this repo to ${bold}~/.config/${normal} directory"

