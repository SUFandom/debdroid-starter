# Debroid-Starter

A script utility to use the [Debdroid](https://github.com/SUFandom/debdroid) Properly


### Tags

![deb](https://img.shields.io/badge/-Debian-red?style=flat-square&logo=debian) ![bash](https://img.shields.io/badge/-Bash_5-green?style=flat-square&logo=gnubash)

## Dependencies that will be installed after first run

- apt-utils (To make process faster )
- Neofetch (will be installed in first run)
- dbus (because X11 and some other services don't work without these )
- Dialog (will install in startup when not found)
- dpkg (already in your fs)
- gdebi (optional but installs default on startup)
- apt-utils (for faster package configuration)
- **IMPORTANT**: debdroid proot installed (Get it on [here](https://github.com/SUFandom/debdroid) )

## Getting Started

First, get in to your debdroid proot by doing: `proot-distro login debian11-arm32` if installed and then clone this repository, (but first, run `apt install git` to get it)

Then cd to this repo and then run `./bootstrap.sh` to start

and then a dialog prompt will try to meet you and then theres a selection for every tools for specific user

## Tools

- Basic

  Just standard XFCE and Firefox-esr

- Dev

  VS Code Ready and Glade for GTK Development, bonus with XFCE and Firefox-esr Ready 

- Virtualization (Emulation idk)

  Wine included with LXDE WM for smooth use of Wine.

- Web

  For people who want to turn their Proot OS into a Web Server, Equipped with Apache and Ngrok. (No WM)
  
  
## Questions

All questions can be asked at Discussions page.
