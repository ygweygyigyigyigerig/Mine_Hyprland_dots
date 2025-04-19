#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Determine config directory
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/waybar"
CONFIG_FILE="$CONFIG_DIR/config.jsonc"  # updated extension

# 1) List all IPv4 interfaces with their addresses
echo "Available network interfaces:"
ip -o -4 addr show \
  | awk '{ print $2 ": " $4 }'

# 2) Prompt until we get a valid interface name
while true; do
  read -rp "Please enter your network interface (e.g. enp7s0): " selected_iface

  if [[ -z "$selected_iface" ]]; then
    echo "  ❌ No interface entered."
    continue
  fi

  if ! ip link show "$selected_iface" &>/dev/null; then
    echo "  ❌ '$selected_iface' does not exist."
    continue
  fi

  # Optional: Warn if interface has no IPv4
  if ! ip -o -4 addr show dev "$selected_iface" &>/dev/null; then
    echo "  ⚠️  '$selected_iface' has no IPv4 addr, but we'll use it anyway."
  fi

  break
done

# 3) Save selection for other scripts/modules
mkdir -p "$CONFIG_DIR"
echo "$selected_iface" > "$CONFIG_DIR/network_iface.txt"

# 4) Update only the 'network' module block in Waybar config
if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Error: Waybar config not found at '$CONFIG_FILE'" >&2
  exit 1
fi

# Edit config.jsonc: only replace the first "interface": "..." in the "network" block
perl -i -pe '
  if (/^\s*\"network\":\s*\{/) {
    $in_net = 1;
  }
  if ($in_net && /^\s*\"interface\":/) {
    s/\"interface\":\s*\"[^\"]+\"/\"interface\": "'$selected_iface'\"/;
    $in_net = 0;  # only replace first match inside the block
  }
' "$CONFIG_FILE"

echo "✅ Waybar network interface set to '$selected_iface'."

# 5) Tell Waybar to reload config
pkill -SIGUSR1 waybar || echo "⚠️ Could not signal Waybar—please restart it manually."
