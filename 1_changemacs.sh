#! /bin/bash


##############################################
#
#This is a macchanger script, it's very basic
#so far, meant for spoofing mac's on kali
#please use it for legitimate purposes :)
#and have a nice day!
#
###############################################




###TELL USER WHAT INTERFACES ARE AVAILABLE 
###THEN ASK WHICH TO USE
ifconfig -a
echo "This script is to change mac address on specified interface"
echo "Scroll up to see interfaces"
echo "Which interface do you want to change and start monitoring on?"
read SPECINTERFACE

echo "Do you want to use a (R)andom mac or (Y)our choice of mac's?"
read MACCHOICE


case $MACCHOICE in

[rR] )
echo "We will use a random mac address then"
ifconfig $SPECINTERFACE down
macchanger -r $SPECINTERFACE
ifconfig $SPECINTERFACE UP
airmon-ng start $SPECINTERFACE
ifconfig mon0 down
macchanger -r $SPECINTERFACE
ifconfig mon0 up
echo "Monitor mode enabled on mon0 and macs changed for mon0 and $SPECINTERFACE"
sleep 10
;;



[yY] )
echo "We will use your specified mac address then"
echo "What is your chosen mac address to spoof?"
echo "(IE xx:xx:xx:xx:xx:xx)"
read USERMAC
ifconfig $SPECINTERFACE down
macchanger -m $USERMAC $SPECINTERFACE
ifconfig $SPECINTERFACE up
airmon-ng start $SPECINTERFACE
ifconfig mon0 down
macchanger -m $USERMAC mon0
ifconfig mon0 up

;;


esac

ifconfig -a
echo "Macs have been changed on $SPECINTERFACE and mon0"
echo "Happy pentesting!!!"
sleep 15


