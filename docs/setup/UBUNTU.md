- [Create Virtual Machine](#create-virtual-machine)
- [Setup Virtual Machine](#setup-virtual-machine)
  - [Stop `sudo` password prompt](#stop-sudo-password-prompt)
  - [Update Ubuntu](#update-ubuntu)
  - [Update VMware Tools](#update-vmware-tools)
  - [Enable shared folders](#enable-shared-folders)
  - [Enable minimize click action to dock](#enable-minimize-click-action-to-dock)
  - [Disable core dumps](#disable-core-dumps)
  - [Change `journald` size](#change-journald-size)
  - [Settings - Appearance](#settings---appearance)
  - [Settings - Power](#settings---power)
  - [Settings - Keyboard](#settings---keyboard)
  - [Settings - Users](#settings---users)
  - [Install `chromium`](#install-chromium)
  - [Install `curl`](#install-curl)
  - [Install `dconf-editor`](#install-dconf-editor)
  - [Install `gnome-tweaks`](#install-gnome-tweaks)
  - [Install `gnome-shell-extension-manager`](#install-gnome-shell-extension-manager)
  - [Install `jq`](#install-jq)
  - [Install `neofetch`](#install-neofetch)
  - [Install `terminator`](#install-terminator)
  - [Install `tldr`](#install-tldr)
  - [Install `tree`](#install-tree)
  - [Install `ubuntu-restricted-extras`](#install-ubuntu-restricted-extras)
  - [Install `vlc`](#install-vlc)
  - [Install `xclip`](#install-xclip)
  - [Install `yarn`](#install-yarn)
  - [Add `New Document` Template](#add-new-document-template)
  - [Show hidden files](#show-hidden-files)
  - [Remove `Ctrl` + `Alt` + `Fn` shortcuts](#remove-ctrl--alt--fn-shortcuts)
  - [Remove `Ctrl` + `Alt` + `Arrow` shortcut](#remove-ctrl--alt--arrow-shortcut)
  - [Remove `Ctrl` + `Shift` + `U` shortcut - toggle case in InteliJ IDEA](#remove-ctrl--shift--u-shortcut---toggle-case-in-intelij-idea)
  - [Fix AppImages require FUSE to run](#fix-appimages-require-fuse-to-run)
  - [Fix Mozilla Firefox dark theme bug](#fix-mozilla-firefox-dark-theme-bug)
  - [Fix missing network after Resume from Suspend](#fix-missing-network-after-resume-from-suspend)
- [Setup Vim](#setup-vim)
  - [Install NeoVim](#install-neovim)
  - [Install SpaceVim](#install-spacevim)
  - [Configure SpaceVim](#configure-spacevim)
  - [Install Nerd Font](#install-nerd-font)
  - [Install VimTutor](#install-vimtutor)

# Create Virtual Machine

Open VMware Workstation -> `File` -> `New Virtual Machine` -> `Typical` -> `Browse Installer disc image file (iso)` (https://ubuntu.com/download/desktop)

Easy install operation:
- Full name: `mp`
- User name: `mp`
- Password: `password`

Name the Virtual Machine:
- Virtual Machine name: `mp-vm`
- Location: `D:\VM\mp-vm`

Specify disk capacity:
- Maximum disk size: `50 GB`
- Split virtual disk into multiple files

Ready to create Virtual Machine:
- Customize Hardware:
  - Memory: `8 GB`
  - Number of processors: `4`
  - Remove USB controller
  - Remove printer
  - Accelerate 3D graphics: `turn off` to avoid glitches

Keyboard layout:
- `Polish`/`Polish`

Updates and other software:
- Minimal installation
- Download updates while installing Ubuntu
- Install third-party software for graphics and Wi-Fi hardware and additional media formats

Installation type:
- `Erase disk and install Ubuntu` -> `Install now` -> `Continue`

Where are you?
- `Warsaw`

Who are you?
- Your name: `mp`
- Your computer's name: `vm`
- Pick a username: `mp`
- Choose a password: `password`
- Log in automatically

Ubuntu post-installation:
- Online Accounts: `skip`
- Livepatch: `skip`
- Help improve Ubuntu: `no`
- Privacy: `off`
- Software Updater: `Install now`

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
- Remove CD/DVD
- Remove CD/DVD 2
- Remove Floppy
- Add `CD/DVD (SATA)` as `Auto Detect` without `Connect at power on`

In VM Options:
- `Synchronize guest time with host`
- Set `VMware Tools` to `Update automatically`

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
- Set shared folders to `Always enabled`
- Add shared folder
- `sudo gedit /etc/fstab`
  - Add `.host:/ /mnt/hgfs fuse.vmhgfs-fuse defaults,allow_other 0 0`
- Restart VM

## Enable minimize click action to dock

```bash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

## Disable core dumps

`sudo gedit /etc/security/limits.conf`:
- Change `#- soft core 0` to `- hard core 0`

## Change `journald` size

`sudo gedit /etc/systemd/journald.conf`:
- Add `SystemMaxUse=100M`
- Restart with `sudo systemctl restart systemd-journald`

## Settings - Appearance

`Settings` -> `Appearance`:
- Style: `Dark`
- Position of new icons: `Top Left`
- Icon size: `30`
- Position on screen: `Bottom`
- Configure dock behavior:
  - Show trash: `Off`

## Settings - Power

`Settings` -> `Power`:
- Screen blank: `Never`

## Settings - Keyboard

`Settings` -> `Keyboard`:
- `View and Customize shortcuts`:
  - `Switch windows of an app directly`: remove `Alt+F6`

## Settings - Users

`Settings` -> `Users`:
- Add photo from `~/Pictures`

## Install `chromium`

Web browser, open-source version of Google Chrome

```bash
sudo snap install chromium
```

## Install `curl`

Transfers a URL

```bash
sudo apt install curl
```

## Install `dconf-editor`

Graphical editor for `gsettings` and `dconf`

```bash
sudo apt install dconf-editor
```

## Install `gnome-tweaks`

Customizes GNOME desktop

```bash
sudo apt install gnome-tweaks
```

## Install `gnome-shell-extension-manager`

Extension manager for GNOME desktop

```bash
sudo apt install gnome-shell-extension-manager
```

Run `extension-manager` and install extensions:
- `Applications Overview Tooltip`
- `Apt Update Indicator`
- `Clock Override`
- `Force Quit`

## Install `jq`

Command-line JSON processor

```bash
sudo apt install jq
```

## Install `neofetch`

Fast, highly customizable system info script

```bash
sudo apt install neofetch
```

## Install `terminator`

Multiple GNOME terminals in one window

```bash
sudo apt install terminator
```

https://github.com/Stunkymonkey/nautilus-open-any-terminal

```bash
sudo apt install python3-pip
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
- Change `Exec=terminator` to `Exec=terminator --title Terminal --working-directory=/home/mp/projects`

## Install `tldr`

Simplified and community-driven man pages

https://tldr.sh
```bash
sudo apt install npm
sudo npm install -g tldr
```

## Install `tree`

Lists content of directories in a tree-like format

```bash
sudo apt install tree
```

## Install `ubuntu-restricted-extras`

Support for MP3 and unencrypted DVD playback, Microsoft TrueType core fonts, Adobe Flash plugin and codecs for common audio and video files

```bash
sudo apt install ubuntu-restricted-extras
```

## Install `vlc`

Multimedia player

```bash
sudo snap install vlc
```

## Install `xclip`

Command line interface to the X11 clipboard. It allows you to put the output of a command directly into the clipboard so that you don't have to copy & paste from the terminal manually (which can be a tedious task especially if the output is very long). It also allows you to put the contents of a file directly into the clipboard

```bash
sudo apt install xclip
```

## Install `yarn`

Compiles Casper theme for Ghost

```bash
sudo apt install npm
sudo npm install -g yarn
```

## Add `New Document` Template

```bash
touch "/home/mp/Templates/New Document"
```

## Show hidden files

`Files` -> `Settings`:
- `Show Hidden Files`

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
- Find `switch-to-workspace-down` and other `switch-to`: put `['disabled']` instead of `default`

## Remove `Ctrl` + `Shift` + `U` shortcut - toggle case in InteliJ IDEA

`Settings` -> `Region & Language` -> `Manage Installed Languages` -> `Remind Me Later`:
- Change `Keyboard input method system` from `IBus` to `XIM`
- `Apply system wide`and Reboot

## Fix AppImages require FUSE to run

`sudo apt install libfuse2`

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

# Setup Vim

## Install NeoVim

```bash
sudo apt install neovim
```

## Install SpaceVim

```bash
curl -sLf "https://spacevim.org/install.sh" | bash
```

## Configure SpaceVim

```bash
sudo apt install fonts-powerline
```
`sudo gedit ~/.SpaceVim.d/init.toml` and change `statusline_separator = "nil"` to `statusline_separator = "arrow"`

## Install Nerd Font

Search for `SourceCodePro` on https://www.nerdfonts.com/font-downloads

Download it and unzip it to `~/.local/share/fonts` and run `fc-cache -fv`

## Install VimTutor

```bash
sudo apt install vim-runtime
```