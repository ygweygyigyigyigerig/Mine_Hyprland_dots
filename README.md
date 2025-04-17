# Mine Hyprland dots
This repository contains a few basic configuration files I use for my Hyprland setup. These configs include:

- rofi

- waybar

- hyprpaper

- hyprlock

- swaync

- zsh (config will be uploaded in future) 
  
![Image](https://github.com/user-attachments/assets/828b07a4-6e2a-472d-ad90-9cd37e728b4b)

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
| ```Mod + I``` |	Open custom option menu |
| ```Mod + PrintScreen``` | Take screenshot |

# Dependencies
- **System dependencies**: ```sudo pacman -Syu```

- **Netwrok**: networkmanager

- **Shell**: zsh (config will be uploaded in future)

- **Audio**: pulseaudio

- **Bluetooth**: bluez and bluez-utils

- **Qt based software support**: qt6-wayland and qt5-wayland
  
- **Fonts**: ttf-font-awesome

- **Lock screen**: hyprlock

- **Wallpaper managing**: hyprpaper
  
- **Window Manager**: hyprland
  
- **Status Bar**: waybar
  
- **App launcher**: rofi-wayland

- **Options menu launcher**: wofi
  
- **Browser**: firefox
  
- **Terminal**: kitty

- **File manager**: dolphin

**Commend to get all dependencies listed above**: ```sudo pacman -S networkmanager zsh pulseaudio bluez bluez-utils qt6-wayland qt5-wayland ttf-font-awesome hyprlock hyprpaper hyprland waybar rofi-wayland wofi firefox kitty dolphin```

- **Notifications center**: swaync
  
**Commad to get swaync and alll swaync dependencies**: ```sudo pacman -S swaync vala meson blueprint-compiler git scdoc sassc gtk4 gtk4-layer-shell dbus glib2 gobject-introspection libgee json-glib libadwaita gvfs granite7```

# Instalation process (BETA)
I've made instalation and setup script with helep of Frogprog,  it worked fine in vm, and then on bare metal (my pc). All needed dircetories were created in right places and every content of config file was transported fine but as coding rule says if code works on your machine it doesn't mean it have to on somone's other. That's why it's marked as beta. If you succesfully used it and it worked pls contact with me on discord, it's in disclaimer session.

**BE SURE TO GET ALL DEPENDENCIES BEFORE STARTING INSTALLATION**



**1. Instal setup and installation script**

   ```curl -L -O https://raw.githubusercontent.com/ygweygyigyigyigerig/Mine_Hyprland_dots/install-script/installer.sh```
   
   ```curl -L -O https://raw.githubusercontent.com/ygweygyigyigyigerig/Mine_Hyprland_dots/install-script/setup.sh```
**2.Run installation and setup script**

```bash installer.sh```

```bash setup.sh```

**3. Wait for installation to end.**

**4. Do whatever installer potentionally told you to**

**5. Reboot**
Congratulation ! you've just installed your new shiny dotfiles.
# Credits

I'd like to thank shdShadow for giving me base for waybar, which i modified. Here's link to his repo : 
https://github.com/shdShadow/Hyprland-pokemon

I'd like to thank BinaryHarbinger aswell for giving me swaync config. Here's link to his repo:
https://github.com/BinaryHarbinger/Dotfiles

And finally, a big shoutout to the co-developer and contributor, FrogProg09 that brings a lot into repo !

# Disclaimer
This project is still under development.
Some configurations may not work (beacaucse I could paste them wrongly) or It could miss few dependencies (since knowing my self there's vey high chance i forgot about them), and changes will be made over time. If you encounter any issues, feel free to DM me on discord, and I'll do my best to assist.

My Discord user name is : szymonschabiak
