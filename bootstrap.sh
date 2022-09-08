#!/bin/bash
# Check if youre rooted
if [ "$EUID" -ne 0 ]
  then echo "Please log out to your user and then Use Root"
  exit
fi

echo "Installing Dependencies: Dialog, wget, gdebi"
# Sending to /dev/null muffles the verbose output 
apt update > /dev/null
apt install dialog -y > /dev/null
apt install wget -y > /dev/null
apt install gdebi -y > /dev/null


# Runs the script

bash runtime.sh
