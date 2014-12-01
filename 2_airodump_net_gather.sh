#!/bin/bash

#######################################
#
#This script is for running airodump
#to check what wifi nets are around you
#it requires a manual CTRL+C to end
#and gives the user 2min to copy info
#before it closes automatically
#
#######################################


echo "This script doesn't stop by itself, CTRL+C to stop"
echo "after your target shows up"
sleep 10

airodump-ng mon0

echo "You have 120 seconds to collect the info needed"
echo "To copy from the command line, press CTRL+SHIFT+C"
echo "after highlighting needed info"
echo
echo "To paste to the command line, press CTRL+SHIFT+V"
echo
echo "Press CNTRL+C if finished early to end script"
sleep 120
