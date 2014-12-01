#! /bin/bash


#######################################
#
#This script will collect general info
#about local wifi nets that have WPS
#enabled, use reaver_script.sh after
#you collect the info needed from this
#script
#
#######################################

echo "This script gathers info about WPS enabled wifi nets in the area"
echo "Shall I use mon0 to gather info?"
echo "(Y or N)"
read INTERFACEANSWER
echo "How long shall I scan?"
echo "(>30 seconds recommended)"
read SCANTIMER

case $INTERFACEANSWER in

[Yy] )
echo "Then mon0 it is for $SCANTIMER seconds"
sleep 3
wash -i mon0 -C & sleep $SCANTIMER
pkill -f "wash -i mon0 -C"
echo "120 seconds now to take down the info"
echo "Press CTRL+C if finished early to exit script"
sleep 120
;;



[Nn] )
ifconfig
echo "Which interface would you like to use?"
read INTERFACECHOICE
echo "Then $SCANTIMER seconds on $INTERFACECHOICE"
sleep 3
wash -i $INTERFACECHOICE -C & sleep $SCANTIMER
pkill -f "wash -i mon0 -C"
echo "120 seconds to collect needed info"
echo "Press CTRL+C if finished early to exit script"
sleep 120
;;



*)
echo "Please make a valid selection..."
sleep 3
;;

esac

