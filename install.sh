#!/usr/bin/env bash
set -euo pipefail

#================================================================
#  Hyprland & Related Config Installer with Auto-Clone
#================================================================

# Formatting
bold=$(tput bold)
normal=$(tput sgr0)

#------------- Repo Configuration ------------#
# Change this to your actual dotfiles repo URL
REPO_URL="https://github.com/yourusername/Mine_Hyprland_dots.git"
# Local clone destination
INSTALL_DIR="${HOME}/.local/share/Mine_Hyprland_dots"

# Clone repository if not already present
if [[ ! -d "$INSTALL_DIR" ]]; then
  echo "${bold}Cloning Hyprland dotfiles repository into $INSTALL_DIR...${normal}"
  git clone "$REPO_URL" "$INSTALL_DIR"
  echo "${bold}Clone complete.${normal}"
fi

# Use INSTALL_DIR as base for all operations
SCRIPT_DIR="$INSTALL_DIR"

#------------- Greeting Banner ------------#
cat << "HI"
 ___           _        _ _           
|_ _|_ __  ___| |_ __ _| | | ___ _ __ 
 | || '_ \/ __| __/ _` | | |/ _ \ '__|
 | || | | \__ \ || (_| | | |  __/ |   
|___|_| |_|___/\__\__,_|_|_|\___|_|   
HI

echo

#------------- User Prompt ------------#
while true; do
  read -rp "${bold}START INSTALLATION? (Y/N)${normal} " yn
  case "${yn,,}" in
    y|yes) echo ":: Installation started."; echo; break ;;
    n|no)  echo ":: Installation canceled."; exit 0 ;;
    *)     echo ":: Please answer Y or N." ;;
  esac
done

#------------- Ensure ~/.config Exists ------------#
echo "Ensuring ${bold}~/.config${normal} exists..."
mkdir -p "$HOME/.config"

declare -a apps=(hypr waybar swaync rofi scripts)

for app in "${apps[@]}"; do
  SRC="$SCRIPT_DIR/DOTFILES/.config/$app"
  DEST="$HOME/.config/$app"

  # Verify source exists
  if [[ ! -e "$SRC" ]]; then
    echo "Error: Source '$SRC' not found. Aborting." >&2
    exit 1
  fi

  # Backup if destination exists
  if [[ -e "$DEST" ]]; then
    ts=$(date '+%Y%m%d-%H%M%S')
    BAK="$HOME/.config/${app}-backup-$ts"
    echo "Backing up existing '$app' to '$BAK'..."
    mv "$DEST" "$BAK"
    echo "  → Backup complete: $BAK"
  fi

  # Create destination and copy
  echo "Installing '$app' configs..."
  mkdir -p "$DEST"
  cp -rv "$SRC"/. "$DEST"/
  echo "  → '$app' installed successfully."
done

#------------- Farewell Banner ------------#
cat << "BYE"
 ____       _                 _                          _       
/ ___|  ___| |_ _   _ _ __   (_)___   _ __ ___  __ _  __| |_   _ 
\___ \ / _ \ __| | | | '_ \  | / __| | '__/ _ \/ _` |/ _` | | | |
 ___) |  __/ |_| |_| | |_) | | \__ \ | | |  __/ (_| | (_| | |_| |
|____/ \___|\__|\__,_| .__/  |_|___/ |_|  \___|\__,_|\__,_|\__, |
                     |_|                                   |___/ 
BYE

echo "Setup complete! If anything went wrong, check backups in ~/.config/*-backup-* or report an issue."

