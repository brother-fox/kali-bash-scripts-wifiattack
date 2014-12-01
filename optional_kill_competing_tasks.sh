#! /bin/bash

#######################################
#
#this is an optional script, it will kill
#tasks competing for the wireless chipset
#mainly the networkmanger, wpa_supplicant
#and dhclient, and will stop those
#annoying network connection dialogs
#
#######################################



echo "Do you want to kill NetworkManger?"
read KILLNETMAN

if [ "$KILLNETMAN" = "Y" ] || [ "$KILLNETMAN" = "y" ]; then

echo "Killing NetworkManager"
sleep 2
pkill NetworkManager
echo -e "\n"

else

echo "Okay, I'll leave it alone... for now..."
sleep 2
echo -e "\n"

fi

echo "Do you want to kill wpa_supplicant?"
read KILLWPASUPP

if [ "$KILLWPASUPP" = "Y" ] || [ "$KILLWPASUPP" = "y" ]; then

echo "Killing wpa_supplicant"
sleep 2
pkill wpa_supplicant
echo -e "\n"

else
echo "Okay, I'll leave it alone... for now..."
sleep 2
echo -e "\n"

fi




echo "Do you want to kill dhclient?"
read KILLDHCLIENT
if [ "$KILLDHCLIENT" = "Y" ] || [ "$KILLDHCLIENT" = "y" ]; then

echo "Killing dhclient"
sleep 2
pkill dhclient
echo -e "\n"

else

echo "Okay, I'll leave it alone... for now..."
sleep 2
echo -e "\n"

fi

echo "DONE"
sleep 3












