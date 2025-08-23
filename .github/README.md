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

![Image](https://github.com/user-attachments/assets/5a9802da-40d1-477b-a083-b5e4b8b24a35)
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

- **AUR helper**: yay

- **Audio**: pulseaudio

- **Bluetooth**: blueman and bluetooth-manager

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

- **Tui app for networkmanager**: nmtui

- **IDE/Text editor**: nvim (lazy vim)

- **Text editor**: vim

- **Clock app**: gnome-clocks

- **Installer dependencies**: 
rsync, jq

You can install all dependencies with commands below:

1. Packages that can be installed with pacman
```bash
sudo pacman -S networkmanager zsh pipewire blueman qt6-wayland qt5-wayland hyprpaper hyprland waybar rofi-wayland wofi firefox kitty dolphin curl nvim gnome-clocks rsync jq ttf-nerd-fonts-symbols breeze-gtk breeze-icons noto-fonts vim
```
2. Packages that can be installed with yay
```bash
yay -S hyprlock wlogout hyprshot
```
3. Packages to get from github
```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
```
There are also a few dependencies for notification center **swaync**:
```bash
sudo pacman -S swaync vala meson blueprint-compiler git scdoc sassc gtk4-layer-shell dbus glib2 gobject-introspection libgee json-glib libadwaita gvfs granite7
```

# Instalation process (Tested only on Arch and arch based distros)
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


**5. Get gtk theme set to breeze using commends below:**
```
mkdir -p ~/.config/gtk-3.0
vim ~/.config/gtk-3.0/settings.ini
```
Paste this to file you just opened, and then save file:
```
[Settings]
gtk-application-prefer-dark-theme=true
gtk-button-images=true
gtk-cursor-theme-name=breeze_cursors
gtk-cursor-theme-size=24
gtk-decoration-layout=icon:minimize,maximize,close
gtk-enable-animations=true
gtk-font-name=Noto Sans,  10
gtk-icon-theme-name=breeze-dark
gtk-menu-images=true
gtk-modules=window-decorations-gtk-module:colorreload-gtk-module
gtk-primary-button-warps-slider=true
gtk-sound-theme-name=ocean
gtk-theme-name=Breeze
gtk-toolbar-style=3
gtk-xft-dpi=98304
```
**6. Reboot**

Congratulation ! You've just installed your new shiny dotfiles.

# Credits

- I'd like to thank shdShadow for giving me base for waybar, which i modified. Here's link to his repo :  https://github.com/shdShadow/Hyprland-pokemon

- I'd like to thank BinaryHarbinger aswell for giving me swaync config. Here's link to his repo: https://github.com/BinaryHarbinger/Dotfiles

- And finally, a biggest shoutout to the co-developer and contributor, [FrogProg09](https://github.com/FrogProg09) that brings a lot into repo!

# Disclaimer
This project is still under development.
Some configurations may not work (because I could paste them wrongly) or It could miss few dependencies (since knowing my self there's vey high chance I forgot about them) there's also (not as big tho) chance of installe/setup script breaking, and changes will be made over time. 
If you encounter any issues, feel free to DM me on discord, and I'll do my best to assist.

My Discord user name is : szymonschabiak

