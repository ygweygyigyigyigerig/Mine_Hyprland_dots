#!/usr/bin/env bash
#fancy title
cat << "HI"
____       _
/ ___|  ___| |_ _   _ _ __
\___ \ / _ \ __| | | | '_ \
___) |  __/ |_| |_| | |_) |
|____/ \___|\__|\__,_| .__/
                    |_|
HI
set -euo pipefail

#================================================================
#  Hyprland Dotfiles Setup
#================================================================

bold=$(tput bold)
normal=$(tput sgr0)

# Where your repo lives (after running install script)
INSTALL_DIR="$HOME/.local/share/Mine_Hyprland_dots"
DOTFILES_DIR="$INSTALL_DIR/DOTFILES/.config"

# Verify the repo is present
if [[ ! -d "$DOTFILES_DIR" ]]; then
  echo "${bold}Error:${normal} Dotfiles directory not found at $DOTFILES_DIR"
  echo "Please run the install script first."
  exit 1
fi

echo "${bold}Starting setup of Hyprland dotfiles...${normal}"

# List of sub‑folders in .config to install
declare -a apps=(hypr waybar swaync rofi scripts kitty wlogout nvim)

for app in "${apps[@]}"; do
  SRC="$DOTFILES_DIR/$app"
  DEST="$HOME/.config/$app"

  # Ensure source exists
  if [[ ! -d "$SRC" ]]; then
    echo "${bold}Warning:${normal} Source folder '$SRC' not found—skipping."
    continue
  fi

  # Backup existing config if present
  if [[ -d "$DEST" ]]; then
    ts=$(date +%Y%m%d-%H%M%S)
    BACKUP="$HOME/.config/${app}-backup-$ts"
    echo "Backing up existing '$app' → $BACKUP"
    mv "$DEST" "$BACKUP"
  fi

  # Create target and copy
  echo "Installing '$app' configs → $DEST"
  mkdir -p "$DEST"
  cp -r "$SRC"/. "$DEST"/
done

cat << "BYE-SETUP"
 ____       _
/ ___|  ___| |_ _   _ _ __   __      ____ _ ___
\___ \ / _ \ __| | | | '_ \  \ \ /\ / / _` / __|
 ___) |  __/ |_| |_| | |_) |  \ V  V / (_| \__ \
|____/ \___|\__|\__,_| .__/    \_/\_/ \__,_|___/
                     |_|
                                  __       _
 ___ _   _  ___ ___ ___  ___ ___ / _|_   _| |
/ __| | | |/ __/ __/ _ \/ __/ __| |_| | | | |
\__ \ |_| | (_| (_|  __/\__ \__ \  _| |_| | |
|___/\__,_|\___\___\___||___/___/_|  \__,_|_|
BYE-SETUP
echo
echo "${bold}Setup complete!${normal}"
echo "Your configs live in ~/.config/{${apps[*]}}"
echo "Old versions (if any) backed up as *-backup-<timestamp>."
echo "run following commend to chose which network interface to use for waybar module"
echo "bash ~/.config/scripts/set_waybar_iface.sh" 
