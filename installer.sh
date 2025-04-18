#!/usr/bin/env bash
set -euo pipefail
trap 'echo "Error on line $LINENO"; exit 1' ERR

#================================================================
#  Hyprland Dotfiles Installer (installer.sh)
#================================================================

# Repo and paths
REPO_URL="https://github.com/ygweygyigyigyigerig/Mine_Hyprland_dots.git"
INSTALL_DIR="$HOME/.local/share/Mine_Hyprland_dots"
DOTFILES_DIR="$INSTALL_DIR/DOTFILES/.config"

# Check dependencies
for cmd in git curl jq rsync; do
  if ! command -v "$cmd" &> /dev/null; then
    echo "Error: '$cmd' is required but not installed. Please install it first." >&2
    exit 1
  fi
done

# Prompt for installation type
echo "Select installation type:"
echo "  1) Stable (latest GitHub release)"
echo "  2) Bleeding-edge (latest commits on 'main')"
read -rp "Enter choice [1/2]: " choice
case "$choice" in
  1)
    echo "Fetching latest release tag..."
    LATEST_TAG=$(curl -s https://api.github.com/repos/ygweygyigyigyigerig/Mine_Hyprland_dots/releases/latest | jq -r .tag_name)
    if [[ -z "$LATEST_TAG" || "$LATEST_TAG" == "null" ]]; then
      echo "Error: Unable to retrieve latest release. Exiting." >&2
      exit 1
    fi
    BRANCH="$LATEST_TAG"
    echo "Selected stable release: $BRANCH"
    ;;
  2)
    BRANCH="main"
    echo "Selected bleeding-edge branch: $BRANCH"
    ;;
  *)
    echo "Invalid choice. Exiting." >&2
    exit 1
    ;;
esac

# Remove existing installation if desired
if [[ -d "$INSTALL_DIR" ]]; then
  read -rp "Found existing repo at $INSTALL_DIR. Delete and re-clone? [y/N] " yn
  if [[ "$yn" =~ ^[Yy]$ ]]; then
    rm -rf "$INSTALL_DIR"
    echo "Deleted old installation."
  else
    echo "Skipping re-clone. Exiting to avoid stale files." && exit 0
  fi
fi

# Clone requested branch/tag
echo "Cloning '$BRANCH' into $INSTALL_DIR..."
git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$INSTALL_DIR"

# Validate dotfiles
if [[ ! -d "$DOTFILES_DIR" ]]; then
  echo "Error: Dotfiles directory not found at $DOTFILES_DIR" >&2
  exit 1
fi

# Create ~/.config dirs and sync
declare -a apps=(hypr waybar swaync rofi scripts kitty)
echo "Syncing dotfiles to ~/.config/..."
for app in "${apps[@]}"; do
  SRC="$DOTFILES_DIR/$app/"
  DEST="$HOME/.config/$app/"
  mkdir -p "$DEST"
  if [[ -d "$SRC" ]]; then
    echo " → rsync $SRC → $DEST"
    rsync -a --delete "$SRC" "$DEST"
  else
    echo "Warning: '$SRC' missing; skipping."
  fi
done

echo " 
____       _                                   
/ ___|  ___| |_ _   _ _ __   __      ____ _ ___ 
\___ \ / _ \ __| | | | '_ \  \ \ /\ / / _` / __|
 ___) |  __/ |_| |_| | |_) |  \ V  V / (_| \__ \
|____/ \___|\__|\__,_| .__/    \_/\_/ \__,_|___/
                     |_|                        
                     __       _ _       
 ___ _   _  ___ ___ / _|_   _| | |_   _ 
/ __| | | |/ __/ _ \ |_| | | | | | | | |
\__ \ |_| | (_|  __/  _| |_| | | | |_| |
|___/\__,_|\___\___|_|  \__,_|_|_|\__, |
                                  |___/ 
"
echo "Configs installed under ~/.config/{${apps[*]}}"
echo "Review and tweak as needed."
