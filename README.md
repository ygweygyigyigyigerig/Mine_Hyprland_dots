<div align="center">
  <img alt="Profiles Pictures" src="https://github.com/user-attachments/assets/c5663bff-358e-4727-99c2-6345eea5c2bd" width="200" height="200"/>
</div>
<div align="center">
    <h1> Simons's Hyprland Dotfiles</h1>
    <h4> This repository contains a few basic configuration files I use for my Hyprland setup.</h4>
</div>
</div>

## Things that are used in setup

| System part | Name |
| --- | --- |
| Compositor | [Hyprland 🌌](https://github.com/hyprwm/Hyprland) |
| Bar | [Waybar 🎑](https://github.com/Alexays/Waybar) |
| App launcher | [Rofi 🚀](https://github.com/davatorium/rofi) |
| Notifications | [Swaync ⚠️](https://github.com/ErikReider/SwayNotificationCenter) |
| Lock | [Hyprlock 🔒](https://github.com/hyprwm/hyprlock) |
| Shell | [Zsh 🐚](https://zsh.sourceforge.io/) (in progress) |
| Terminal | [Kitty 🐱](https://github.com/kovidgoyal/kitty) |
| Power menu | [Wlogout ⏻](https://github.com/ArtsyMacaw/wlogout) |

![Image](https://github.com/user-attachments/assets/b1c5f48a-5519-4f76-b890-fb08380da746)
> Desktop with rofi and swaync open
# Shortcuts 

|keybind|result|
|---|---|
| ```Mod + Return``` |	Launch terminal ($terminal) |
| ```Mod + Q```	| Kill active window |
| ```Mod + M```	| Exit Hyprland |
| ```Mod + E```	| Launch file manager ($fileManager) |
| ```Mod + F```	| Toggle floating mode |
| ```Mod + A```	| Launch application menu ($menu) |
| ```Mod + B```	| Launch browser ($browser) |
| ```Mod + P```	| Toggle pseudo mode (dwindle) |
| ```Mod + J```	| Toggle split layout (dwindle) |
| ```Mod + W``` |	Open power option menu |
| ```Mod + PrintScreen``` | Take screenshot |
| ```Mod + N``` | Maximize window |
| ```Mod + Z``` | Re-load waybar config |
| ```Mod + D``` | Fully close discord (it won't run in background) |


# Dependencies

- **System dependencies**: ```sudo pacman -Syu```

- **Netwrok**: networkmanager

- **Shell**: zsh (config will be uploaded in future)

- **Audio**: pulseaudio

- **Bluetooth**: bluez and bluez-utils

- **Qt based software support**: qt6-wayland and qt5-wayland
  
- **Fonts**: nerd-fonts

- **Lock screen**: hyprlock

- **Wallpaper managing**: hyprpaper
  
- **Window Manager**: hyprland
  
- **Status Bar**: waybar
  
- **App launcher**: rofi-wayland

- **Power option menu**: wlogout
  
- **Browser**: firefox
  
- **Terminal**: kitty

- **File manager**: dolphin

- **Screnshot software**: hypershot

- **Notification center**: swaync

- **Gui app for networkmanager**: nm-connection-editor

You can install all dependencies with commands below:

1. Packages that can be installed with pacman
```bash
sudo pacman -S networkmanager zsh pulseaudio bluez bluez-utils qt6-wayland qt5-wayland nerd-fonts hyprlock hyprpaper hyprland waybar rofi-wayland wofi firefox kitty dolphin curl nm-connection-editor
```
2. Packages that can be installed with yay
```bash
yay -S hyprlock wlogout
```
There are also a few dependencies for notification center **swaync**:
```bash
sudo pacman -S swaync vala meson blueprint-compiler git scdoc sassc gtk4 gtk4-layer-shell dbus glib2 gobject-introspection libgee json-glib libadwaita gvfs granite7
```

# Instalation process (works only for arch and arch based distros)
If everything worked, or didn't work at all, either way please contact me in discord.
My nick is at [disclaimer](#Disclaimer) section.

**BE SURE TO GET ALL DEPENDENCIES BEFORE STARTING INSTALLATION**



**1. Instal setup and installation script**

  ```bash
    curl -L -O https://raw.githubusercontent.com/ygweygyigyigyigerig/Mine_Hyprland_dots/main/installer.sh
  ```
   
  ```bash
    curl -L -O https://raw.githubusercontent.com/ygweygyigyigyigerig/Mine_Hyprland_dots/main/setup.sh
  ```
**2.Run installation and setup script**

```bash
  bash installer.sh
```

```bash
  bash setup.sh
```

**3. Wait for installation to end**

**4. Do whatever installer potentionally told you to**

**5. Reboot**

Congratulation ! You've just installed your new shiny dotfiles.

# Credits

- I'd like to thank shdShadow for giving me base for waybar, which i modified. Here's link to his repo :  https://github.com/shdShadow/Hyprland-pokemon

- I'd like to thank BinaryHarbinger aswell for giving me swaync config. Here's link to his repo: https://github.com/BinaryHarbinger/Dotfiles

- And finally, a biggest shoutout to the co-developer and contributor, [FrogProg09](https://github.com/FrogProg09) that brings a lot into repo!

# Disclaimer
This project is still under development.
Some configurations may not work (beacaucse I could paste them wrongly) or It could miss few dependencies (since knowing my self there's vey high chance I forgot about them) there's also (not as big tho) chance of installe/setup script breaking, and changes will be made over time. 
If you encounter any issues, feel free to DM me on discord, and I'll do my best to assist.

My Discord user name is : szymonschabiak

