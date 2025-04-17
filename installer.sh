#!/usr/bin/env bash
set -euo pipefail

#----------------- Repo Configuration -----------------#
REPO_URL="https://github.com/ygweygyigyigyigerig/Mine_Hyprland_dots.git"
INSTALL_DIR="$HOME/.local/share/Mine_Hyprland_dots"
DOTFILES_DIR="$INSTALL_DIR/DOTFILES/.config"

#----------------- Clone or Update Repository -----------------#
if [[ ! -d "$INSTALL_DIR" ]]; then
  echo "Cloning repository into $INSTALL_DIR..."
  git clone "$REPO_URL" "$INSTALL_DIR"
else
  echo "Repository already exists. Checking for updates..."
  cd "$INSTALL_DIR"
  git pull origin install-script  # Replace 'install-script' with the correct branch name if needed
fi

#----------------- Directory Creation -----------------#
echo "Creating necessary directories in $HOME/.config"

# List of directories to create based on your repo structure
declare -a dirs=("hypr" "waybar" "swaync" "rofi" "scripts")

for dir in "${dirs[@]}"; do
  DEST_DIR="$HOME/.config/$dir"
  
  # Create the directory if it doesn't exist
  if [[ ! -d "$DEST_DIR" ]]; then
    echo "Creating directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
  else
    echo "Directory $DEST_DIR already exists."
  fi
done

#----------------- Copy Files -----------------#
echo "Copying files from $DOTFILES_DIR to ~/.config..."

# For each directory in the repository, copy files into corresponding directories
for dir in "${dirs[@]}"; do
  SRC_DIR="$DOTFILES_DIR/$dir"
  DEST_DIR="$HOME/.config/$dir"
  
  if [[ -d "$SRC_DIR" ]]; then
    echo "Copying contents of $SRC_DIR to $DEST_DIR..."
    cp -r "$SRC_DIR"/. "$DEST_DIR"/
  else
    echo "Warning: Directory $SRC_DIR does not exist in the repository!"
  fi
done

#----------------- Final Messages -----------------#
echo "Installation and update completed. All directories and files are now in place."
echo "Please verify the contents of ~/.config and adjust if necessary."
