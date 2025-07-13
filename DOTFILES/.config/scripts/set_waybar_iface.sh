#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Determine config directory and file
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/waybar"
CONFIG_FILE="$CONFIG_DIR/config.jsonc"
mkdir -p "$CONFIG_DIR"

# 1) List IPv4 interfaces
echo "Available network interfaces:"
ip -o -4 addr show | awk '{ print $2 ": " $4 }'

# 2) Prompt for interface
while true; do
  read -rp $'Please enter your network interface (e.g. enp7s0): ' selected_iface
  if [[ -z "$selected_iface" ]]; then
    echo "  ❌ No interface entered."
    continue
  fi
  if ! ip link show "$selected_iface" &>/dev/null; then
    echo "  ❌ '$selected_iface' does not exist."
    continue
  fi
  if ! ip -o -4 addr show dev "$selected_iface" &>/dev/null; then
    echo "  ⚠️  '$selected_iface' has no IPv4 addr, but will be used anyway."
  fi
  break
done

# Save to a file for use by other scripts
echo "$selected_iface" > "$CONFIG_DIR/network_iface.txt"

# 3) Update Waybar config: both network blocks
if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Error: Waybar config not found at '$CONFIG_FILE'" >&2
  exit 1
fi

perl -i -pe '
  if (/^\s*"network(?:#net2)?":\s*\{/) {
    $in_block = 1;
  }
  if ($in_block && /^\s*"interface":/) {
    s/"interface":\s*"[^"]+"/"interface": "'$selected_iface'"/;
    $in_block = 0;
  }
' "$CONFIG_FILE"

echo "✅ Waybar config updated: interface set to '$selected_iface' in both network modules."

# 4) Reload Waybar
if pkill -SIGUSR1 waybar; then
  echo "✅ Sent SIGUSR1 to Waybar (reload triggered)."
else
  echo "⚠️ Could not signal Waybar – please restart it manually."
fi
