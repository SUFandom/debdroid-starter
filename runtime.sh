#!/bin/bash
# Exit Vars
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_ESC=255}

# EOP (ERROR OF PROCEEDING)

if [[ "$1" == "--exit-0-uid-noroot-ins" ]]
then
dialog --backtitle "Error: No Access" --title "Permission Issues" --infobox "Script is not in Root Environment to continue installing, Abort All operations (Error: 0x01GEIDN0)" 0 0
sleep 10
exit 1
fi 

if [[ "$1" == "--exit-1-ins" ]]
then
dialog --backtitle "Error Fault" --title "Something went Wrong" --infobox "One or more Packages wasn't installed properly, See Git Issues to fix. (Error 1x0000INS_FAULT_BY_FIND). Starting Main Process Again in 10 seconds" 0 0
sleep 10
fi

# Tag
BG="Debian ARMv7 Wizard Installer"


dialog --backtitle "Wizard Setup by SUFandom" --title "Welcome" --infobox "Welcome to the installer, this script is equipped to install stuff needed for your needs" 0 0
sleep 5

install_src(){
  dialog --backtitle "$BG" \
  --title "$1" \
  --no-collapse \
  --msgbox "$out" 0 0
}
exec 3>&1
MENU=$( dialog \
  --backtitle "Debian ARMv7 Setup" \
  --title "Selection" \
  --menu "Welcome to Debian ARMv7 Setup, Choose what do you want for this script to do, (Developer's Handy Tools, Basic User, Web Server User, Virtual NT User (Wine))" 0 0 0 \
  "Basic" "Basic Usage - XFCE with Browser" \
  "Dev" "Developer Tools - Code, Glade, with XFCE as WM" \
  "Web" "Web Server - Only Terminal Mode, Apache nd Ngrok" \
  "Virtual" "Virtual people who likes to use .exe Files, Wine with LXDE WM" \
  2>&1 1>&3
  )
exitvar=$?
case $exitvar=$? in 
 $DIALOG_CANCEL)
 exit 0 ;;
 $DIALOG_ESC)
 exit 255 ;;
esac
case $MENU in
 "Basic")
 if ( dialog --backtitle "Install" --title "Are you sure, you want to install: Basic ?" --yes-label "Install" --no-label "Cancel" --yesno "Basic offers you: XFCE4 WM, Firefox ESR only." 0 0 )
 then 
 bash install.sh --basic
 else 
 bash runtime.sh 
 fi 
 ;;
 "Dev")
 if (dialog --backtitle "Install" --title "Are you sure you want to install: Dev ?" --yes-label "Install" --no-label "Cancel" --yesno "You want to install Dev Packages? Includes Working VS Code, Firefox-esr, Glade, XFCE and Tools" 0 0)
 then
 bash install.sh --dev
 else
 bash runtime.sh 
 fi 
 "Web")
 if (dialog --backtitle "Install" --title "Are you sure you want to install: Webserver?" --yes-label "Install" --mo-label "Cancel" --yesno "Are you sure to install Web server Packages?" 0 0)
 then
 bash install.sh --web
 else
 bash runtime.sh 
 fi 
 
