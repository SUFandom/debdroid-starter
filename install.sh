#!/bin/bash
# This area has no Comment because its already effing messy

if [[ "$1" == "--basic" ]]
then 
if [ "$EUID" -ne 0 ]
  then ./runtime.sh --exit-0-uid-noroot-ins
  exit
fi
clear
echo "Loading"
apt-get update >> /dev/null
apt-get install sudo xfce4 xfce4-goodies tigervnc* firefox-esr -y | dialog --programbox 30 65
if (whereis firefox-esr)
then
echo ""
else 
bash runtime.sh --exit-1-ins
fi 
if (whereis xfce4-session)
then
echo ""
else 
bash runtime.sh --exit-1-ins
fi 
fi

if [[ "$1" == "--dev" ]]
then 
if [ "$EUID" -ne 0 ]
  then ./runtime.sh --exit-0-uid-noroot-ins
  exit
fi
clear
echo "Loading"
apt-get update > /dev/null
apt-get install sudo xfce4 xfce4-goodies qtcreator glade tigervnc* firefox-esr -y | dialog --progressbox 30 65
echo "Switching to Readline to download asset"
wget https://github.com/SUFandom/debdroid-gitserver/releases/download/vs-code-1.70/code_1.70.1-1660111763_armhf.deb 
mkdir $HOME/Desktop
wget https://github.com/SUFandom/debdroid-gitserver/releases/download/vs-code-1.70/Visual.Studio.Code.desktop.txt
mv Visual.Studio.Code.desktop.txt $HOME/Desktop/VSCode.desktop
dpkg -i code_1.70.1-1660111763_armhf.deb | dialog --programbox 30 65
if (whereis firefox-esr)
then
echo ""
else 
bash runtime.sh --exit-1-ins
fi 
if (whereis xfce4-session)
then 
echo ""
else 
bash runtime.sh --exit-1-ins
fi 
if (whereis code)
then 
echo ""
else 
bash runtime.sh --exit-1-ins 
fi
fi

if [[ "$1" == "--web" ]]
then 
if [ "$EUID" -ne 0 ]
  then ./runtime.sh --exit-0-uid-noroot-ins
  exit
fi
apt-get install sudo apache2 -y | dialog --progressbox 30 65
echo "Switching to Readline to Download and Install the following: Ngrok"
sleep 3
dpkg --add-architecture arm
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && apt-get update && sudo apt install ngrok
if (whereis apache2)
then ""
else 
bash runtime.sh --exit-1-ins
fi 
fi

if [[ "$1" == "--virtual" ]]
then 
if [ "$EUID" -ne 0 ]
  then ./runtime.sh --exit-0-uid-noroot-ins
  exit
fi
apt-get install sudo wine tigervnc* lxde -y | dialog --programbox 30 65
if (whereis wine)
then 
echo ""
else 
bash runtime.sh --exit-1-ins
fi 
if (whereis lxde)
then
echo ""
else 
bash runtime.sh --exit-1-ins
fi 
fi
