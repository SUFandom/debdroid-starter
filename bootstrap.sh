#!/bin/bash
# Check if youre rooted
if [ "$EUID" -ne 0 ]
  then echo "Please log out to your user and then Use Root to continue..."
  exit
fi
mkdir /.debdroid-start
touch /.debdroid-start/keychain
echo "Debdroid-starter NO SERVICE PACK" > /.debdroid-start/keychain
echo "Installing Dependencies: Dialog, wget, gdebi, dbus* and others, may take while depending on these factors: Internet Speed and CPU/RAM Speed"
# Sending to /dev/null muffles the verbose output 
apt-get update > /dev/null
apt-get install apt-utils -y > /dev/null
apt-get install neofetch -y > /dev/null
apt-get install dialog -y > /dev/null
apt-get install wget -y > /dev/null
apt-get install gdebi -y > /dev/null
apt-get install dbus* -y > /dev/null
echo "Doing Additional Work"
# Prepares something
echo "Preparing Additional Work"
apt-mark hold tracker-miner-fs 
chmod +x resources/identify
cp resources/identify /usr/bin
mkdir /usr/share/image/
cp resources/icon.png /usr/share/image/
cp resources/os-release /usr/lib/os-release
mkdir /usr/lib/diagnose
chmod +x resources/diagnose
cp resources/diagnose /usr/bin
cp resources/Visual-Studio-alt.desktop /usr/lib/diagnose
cp resources/Visual-Studio.desktop /usr/lib/diagnose
mkdir $HOME/.config
cp -r resources/config/xfce4 $HOME/.config/
cp resources/config/.bashrc $HOME/.config/
mkdir /etc/skel/.config
cp -r resources/config/xfce4 /etc/skel/.config
cp resources/config/.bashrc /etc/skel/
chmod +x resources/diagnose
cp resources/diagnose /bin
mkdir /usr/share/images/
mkdir /usr/share/images/desktop-base
tar xfJ wp/destiny.tar.xz -C /usr/share/images/desktop-base



# Runs the script

bash runtime.sh
