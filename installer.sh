#!/usr/bin/env bash
set -euo pipefail
trap 'echo "Error on line $LINENO"; exit 1' ERR

#----------------- Configurable Parameters -----------------#
REPO_URL="https://github.com/ygweygyigyigyigerig/Mine_Hyprland_dots.git"
INSTALL_DIR="$HOME/.local/share/Mine_Hyprland_dots"
DOTFILES_DIR="$INSTALL_DIR/DOTFILES/.config"
BRANCH="${1:-main}"   # pass branch/tag as first argument, defaults to 'main'

#----------------- Remove Existing Repo Safely -----------------#
if [[ -d "$INSTALL_DIR" ]]; then
  echo "Found existing repo at $INSTALL_DIR."
  read -p "Delete and re‑clone? [y/N] " yn
  if [[ "$yn" =~ ^[Yy]$ ]]; then
    # safety check on INSTALL_DIR
    if [[ "$INSTALL_DIR" == "$HOME/.local/share/Mine_Hyprland_dots" ]]; then
      echo "Deleting $INSTALL_DIR..."
      rm -rf "$INSTALL_DIR"
    else
      echo "Refusing to delete unexpected path: $INSTALL_DIR" >&2
      exit 1
    fi
  else
    echo "Skipping delete; will exit to avoid stale repo." && exit 0
  fi
fi

#----------------- Clone Repository -----------------#
echo "Cloning '$BRANCH' from $REPO_URL into $INSTALL_DIR..."
git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$INSTALL_DIR"

#----------------- Validate DOTFILES -----------------#
if [[ ! -d "$DOTFILES_DIR" ]]; then
  echo "Error: DOTFILES directory not found at $DOTFILES_DIR" >&2
  exit 1
fi

#----------------- Directory Creation -----------------#
echo "Ensuring ~/.config subdirectories exist..."
declare -a dirs=(hypr waybar swaync rofi scripts)
for dir in "${dirs[@]}"; do
  mkdir -pv "$HOME/.config/$dir"
done

#----------------- Sync Files with rsync -----------------#
echo "Syncing dotfiles into ~/.config..."
for dir in "${dirs[@]}"; do
  SRC="$DOTFILES_DIR/$dir/"
  DEST="$HOME/.config/$dir/"
  if [[ -d "$SRC" ]]; then
    echo " → rsync $SRC → $DEST"
    rsync -a --delete "$SRC" "$DEST"
  else
    echo "Warning: $SRC does not exist in repo; skipping."
  fi
done

#----------------- Final Message -----------------#
echo "✅ Installation complete!"
echo "Review ~/.config for any manual tweaks if needed."
