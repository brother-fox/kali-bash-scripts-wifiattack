#!/bin/bash


#
#general script to start and get info about a certain
#access point
#

echo "What interface do you want to capture on?: "
read CAPINTERFACE

echo "Please tell me the bssid (MAC of AP):"
read APBSSID

echo "Please tell me which channel that AP is on: "
read APCHANNEL

echo "What is the name prefix you'd like to"
echo "assign to the write file?: "
read NAMEPREFIX

echo "Do you want to capture only IVS's?: "
echo "(Y or N)"
read IVSANSWER

#
#beginning of ivs capture mode
#

if [ "$IVSANSWER" = "Y" ] || [ "$IVSANSWER" = "y" ]; then

echo "Capturing only IVS's on $CAPINTERFACE"
echo "Targeting $APBSSID on channel: $APCHANNEL"
sleep 5

echo "Press CTRL+C to end capture"
sleep 10

echo "Capture commencing..."
sleep 3

mkdir /usr/airodump_cap/$APBSSID
airodump-ng --ivs -w /usr/airodump_cap/$APBSSID/$NAMEPREFIX --bssid $APBSSID --channel $APCHANNEL $CAPINTERFACE

else

echo "Capturing all traffic on $CAPINTERFACE"
echo "Targeting $APBSSID on channel: $APCHANNEL"
sleep 5

echo "Press CTRL+C to end capture"
sleep 7

echo "Capture commencing..."
sleep 3
mkdir /usr/airodump_cap/$APBSSID
airodump-ng -w /usr/airodump_cap/$APBSSID/$NAMEPREFIX --bssid $APBSSID --channel $APCHANNEL $CAPINTERFACE

fi
#
#end of ivs capture mode
#


echo "Files have been saved under /usr/airodump_cap/"

sleep 10















