#!/usr/bin/env bash
set -euo pipefail
trap 'echo "Error on line $LINENO"; exit 1' ERR

#----------------- Configurable Parameters -----------------#
REPO_URL="https://github.com/ygweygyigyigyigerig/Mine_Hyprland_dots.git"
INSTALL_DIR="$HOME/.local/share/Mine_Hyprland_dots"
DOTFILES_DIR="$INSTALL_DIR/DOTFILES/.config"

#----------------- Check Dependencies -----------------#
for cmd in git curl jq rsync; do
  if ! command -v "$cmd" &> /dev/null; then
    echo "Error: '$cmd' is required but not installed. Please install it first." >&2
    exit 1
  fi
done

#----------------- Choose Installation Type -----------------#
echo "Select installation type:"
echo "  1) Stable (latest GitHub release)"
echo "  2) Bleeding-edge (latest commits on 'main')"
read -rp "Enter choice [1/2]: " choice
case "$choice" in
  1)
    echo "Fetching latest release tag..."
    LATEST_TAG=$(curl -s https://api.github.com/repos/ygweygyigyigyigerig/Mine_Hyprland_dots/releases/latest \
      | jq -r .tag_name)
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

#----------------- Remove Existing Repo Safely -----------------#
if [[ -d "$INSTALL_DIR" ]]; then
  echo "Found existing repo at $INSTALL_DIR."
  read -rp "Delete and re‑clone? [y/N] " yn
  if [[ "$yn" =~ ^[Yy]$ ]]; then
    if [[ "$INSTALL_DIR" == "$HOME/.local/share/Mine_Hyprland_dots" ]]; then
      echo "Deleting $INSTALL_DIR..."
      rm -rf "$INSTALL_DIR"
    else
      echo "Refusing to delete unexpected path: $INSTALL_DIR" >&2
      exit 1
    fi
  else
    echo "Skipping delete; exiting to avoid stale repo." && exit 0
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
