<!-- TOC -->
* [Create Virtual Machine](#create-virtual-machine)
* [Setup Virtual Machine](#setup-virtual-machine)
  * [Stop `sudo` password prompt](#stop-sudo-password-prompt)
  * [Update Ubuntu](#update-ubuntu)
  * [Update VMware Tools](#update-vmware-tools)
  * [Enable shared folders](#enable-shared-folders)
  * [Enable minimize click action to dock](#enable-minimize-click-action-to-dock)
  * [Disable core dumps](#disable-core-dumps)
  * [Change `journald` size](#change-journald-size)
  * [Settings: Appearance](#settings-appearance)
  * [Settings: Power](#settings-power)
  * [Settings: Keyboard](#settings-keyboard)
  * [Settings: Users](#settings-users)
  * [Install `chromium` (web browser, open-source version of Google Chrome)](#install-chromium-web-browser-open-source-version-of-google-chrome-)
  * [Install `curl` (transfers a URL)](#install-curl-transfers-a-url-)
  * [Install `dconf-editor` (graphical editor for gsettings and dconf)](#install-dconf-editor-graphical-editor-for-gsettings-and-dconf-)
  * [Install `gnome-tweaks` (customizes GNOME desktop)](#install-gnome-tweaks-customizes-gnome-desktop-)
  * [Install `gnome-shell-extension-manager` (extension manager for GNOME desktop)](#install-gnome-shell-extension-manager-extension-manager-for-gnome-desktop-)
  * [Install `jq` (command-line JSON processor)](#install-jq-command-line-json-processor-)
  * [Install `neofetch` (fast, highly customizable system info script)](#install-neofetch-fast-highly-customizable-system-info-script-)
  * [Install `pip` (package installer for Python)](#install-pip-package-installer-for-python-)
  * [Install `terminator` (multiple GNOME terminals in one window)](#install-terminator-multiple-gnome-terminals-in-one-window-)
  * [Install `tldr` (simplified and community-driven man pages)](#install-tldr-simplified-and-community-driven-man-pages-)
  * [Install `tree` (lists contents of directories in a tree-like format)](#install-tree-lists-contents-of-directories-in-a-tree-like-format-)
  * [Install `ubuntu-restricted-extras` (support for MP3 and unencrypted DVD playback, Microsoft TrueType core fonts, Adobe Flash plugin and codecs for common audio and video files)](#install-ubuntu-restricted-extras-support-for-mp3-and-unencrypted-dvd-playback-microsoft-truetype-core-fonts-adobe-flash-plugin-and-codecs-for-common-audio-and-video-files-)
  * [Install `vlc` (multimedia player)](#install-vlc-multimedia-player-)
  * [Install `yarn` (compiles Casper theme for Ghost)](#install-yarn-compiles-casper-theme-for-ghost-)
  * [Add `New Document` Template](#add-new-document-template)
  * [Remove `Ctrl` + `Alt` + `Fn` shortcuts](#remove-ctrl-alt-fn-shortcuts)
  * [Remove `Ctrl` + `Alt` + `Arrow` shortcut](#remove-ctrl-alt-arrow-shortcut)
  * [Remove `Ctrl` + `Shift` + `U` (toggle case in InteliJ IDEA) shortcut](#remove-ctrl-shift-u-toggle-case-in-intelij-idea-shortcut)
  * [Fix Mozilla Firefox dark theme bug](#fix-mozilla-firefox-dark-theme-bug)
  * [Fix missing network after Resume from Suspend](#fix-missing-network-after-resume-from-suspend)
<!-- TOC -->

# Create Virtual Machine

Open VMware Workstation -> `File` -> `New Virtual Machine` -> `Typical` -> `Browse Installer disc image file (iso)` (https://ubuntu.com/download/desktop)

Easy install operation:
* Full name: `mp`
* User name: `mp`
* Password: `password`

Name the Virtual Machine:
* Virtual Machine name: `mp-vm`
* Location: `D:\VM\mp-vm`

Specify disk capacity:
* Maximum disk size: `50 GB`
* Split virtual disk into multiple files

Ready to create Virtual Machine:
* Customize Hardware:
    * Memory: `8 GB`
    * Number of processors: `4`
    * Remove USB controller
    * Remove printer
    * Graphics memory: `1 GB`

Keyboard layout:
* `Polish`/`Polish`

Updates and other software:
* Minimal installation
* Download updates while installing Ubuntu
* Install third-party software for graphics and Wi-Fi hardware and additional media formats

Installation type:
* `Erase disk and install Ubuntu` -> `Install now` -> `Continue`

Where are you?
* `Warsaw`

Who are you?
* Your name: `mp`
* Your computer's name: `vm`
* Pick a username: `mp`
* Choose a password: `password`
* Log in automatically

Ubuntu post-installation:
* Online Accounts: `skip`
* Livepatch: `skip`
* Help improve Ubuntu: `no`
* Privacy: `off`
* Software Updater: `Install now`

# Setup Virtual Machine

## Stop `sudo` password prompt

`sudo visudo` and paste the below at the end of the file:
```bash
mp ALL=(ALL) NOPASSWD: ALL
```

## Update Ubuntu

```bash
echo "Kernel version: $(uname -r)"; echo "$(cat '/etc/os-release' | grep 'VERSION=' | sed 's/VERSION=/Ubuntu version: /;s/"//g')"; sudo apt -y update; sudo apt -y upgrade; sudo apt dist-upgrade; sudo apt autoremove --purge; sudo apt -y autoclean; echo "Kernel version: $(uname -r)"; echo "$(cat '/etc/os-release' | grep 'VERSION=' | sed 's/VERSION=/Ubuntu version: /;s/"//g')"
```

## Update VMware Tools

`Power off` -> `Edit virtual machine settings`:
* Remove CD/DVD
* Remove CD/DVD 2
* Remove Floppy
* Add `CD/DVD (SATA)` as `Auto Detect` without `Connect at power on`

In VM Options:
* `Synchronize guest time with host`
* Set `VMware Tools` to `Update automatically`

<details>
<summary>Reinstall VMWare Tools in case of problems (usually not needed)</summary>

Use `sudo apt upgrade open-vm-tools` or below if still the problem persists.

When starting Ubuntu, click `Player` -> `Manage` -> `Reinstall VMWare Tools`
```bash
tar -xvzf VMwareTools-version.tar.gz -C ~/Pulpit
sudo ~/Pulpit/vmware-tools-distrib/vmware-install.pl
sudo rm -r ~/Pulpit/vmware-tools-distrib
```

</details>

## Enable shared folders

In VM Options:
* Set shared folders to `Always enabled`
* Add shared folder
* `sudo gedit /etc/fstab`
  * Add `.host:/ /mnt/hgfs fuse.vmhgfs-fuse defaults,allow_other 0 0`
* Restart VM

## Enable minimize click action to dock

```bash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

## Disable core dumps

`sudo gedit /etc/security/limits.conf`:
* Change `#* soft core 0` to `* hard core 0`

## Change `journald` size

`sudo gedit /etc/systemd/journald.conf`:
* Add `SystemMaxUse=100M`
* Restart with `sudo systemctl restart systemd-journald`

## Settings: Appearance

`Settings` -> `Appearance`:
* Style: `Dark`
* Position of new icons: `Top Left`
* Icon size: `30`
* Position on screen: `Bottom`
* Configure dock behavior:
  * Show trash: `Off`

## Settings: Power

`Settings` -> `Power`:
* Screen blank: `Never`

## Settings: Keyboard

`Settings` -> `Keyboard`:
* `View and Customize shortcuts`:
  * `Switch windows of an app directly`: remove `Alt+F6`

## Settings: Users

`Settings` -> `Users`:
* Add photo from `~/Pictures`

## Install `chromium` (web browser, open-source version of Google Chrome)

```bash
sudo snap install chromium
```

## Install `curl` (transfers a URL)

```bash
sudo apt install curl
```

## Install `dconf-editor` (graphical editor for gsettings and dconf)

```bash
sudo apt install dconf-editor
```

## Install `gnome-tweaks` (customizes GNOME desktop)

```bash
sudo apt install gnome-tweaks
```

## Install `gnome-shell-extension-manager` (extension manager for GNOME desktop)

```bash
sudo apt install gnome-shell-extension-manager
```

Run `extension-manager` and install extensions:
* `Applications Overview Tooltip`
* `Apt Update Indicator`
* `Clock Override`
* `Force Quit`

## Install `jq` (command-line JSON processor)

```bash
sudo apt install jq
```

## Install `neofetch` (fast, highly customizable system info script)

```bash
sudo apt install neofetch
```

## Install `pip` (package installer for Python)

```bash
sudo apt install python3-pip
```

## Install `terminator` (multiple GNOME terminals in one window)

```bash
sudo apt install terminator
```

https://github.com/Stunkymonkey/nautilus-open-any-terminal

```bash
sudo apt install python3-nautilus
pip install nautilus-open-any-terminal
nautilus -q
git clone https://github.com/Stunkymonkey/nautilus-open-any-terminal.git nautilus-open-any-terminal
sudo nautilus-open-any-terminal/tools/update-extension-system.sh install
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal terminator
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal flatpak system
pip uninstall nautilus-open-any-terminal
rm -rf nautilus-open-any-terminal
```

`sudo gedit /usr/share/applications/terminator.desktop`:
* Change `Exec=terminator` to `Exec=terminator --title Terminal --working-directory=/home/mp/projects`

## Install `tldr` (simplified and community-driven man pages)

https://tldr.sh
```bash
sudo apt install npm
sudo npm install -g tldr
```

## Install `tree` (lists contents of directories in a tree-like format)

```bash
sudo apt install tree
```

## Install `ubuntu-restricted-extras` (support for MP3 and unencrypted DVD playback, Microsoft TrueType core fonts, Adobe Flash plugin and codecs for common audio and video files)

```bash
sudo apt install ubuntu-restricted-extras
```

## Install `vlc` (multimedia player)

```bash
sudo snap install vlc
```

## Install `yarn` (compiles Casper theme for Ghost)

```bash
sudo apt install npm
sudo npm install -g yarn
```

## Add `New Document` Template

```bash
touch "/home/mp/Templates/New Document"
```

## Remove `Ctrl` + `Alt` + `Fn` shortcuts

`sudo gedit /etc/X11/xorg.conf` and add:
```
Section "ServerFlags"
    Option "DontVTSwitch" "on"
EndSection
Section "InputClass"
    Identifier "keyboard defaults"
    MatchIsKeyboard "on"
    Option "XKbOptions" "srvrkeys:none"
EndSection
```

## Remove `Ctrl` + `Alt` + `Arrow` shortcut

In `dconf-editor` go to: `/org/gnome/desktop/wm/keybindings/`:
* Find `switch-to-workspace-down` and other `switch-to`: put `['disabled']` instead of `default`

## Remove `Ctrl` + `Shift` + `U` (toggle case in InteliJ IDEA) shortcut

`Settings` -> `Region & Language` -> `Manage Installed Languages` -> `Remind Me Later`:
* Change `Keyboard input method system` from `IBus` to `XIM`
* `Apply system wide`and Reboot

## Fix Mozilla Firefox dark theme bug

`sudo gedit /usr/lib/firefox/firefox.sh` and add:
```bash
GTK_THEME=Adwaita:light

export GTK_THEME
export MOZ_APP_LAUNCHER
```

## Fix missing network after Resume from Suspend

`sudo gedit /etc/pm/sleep.d/network_restart` and add:
```bash
case "${1}" in
  resume|thaw)
    sudo systemctl restart NetworkManager docker
;;
esac
```
Then `sudo chmod +x /etc/pm/sleep.d/network_restart`