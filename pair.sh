#!/bin/bash

MAC_ADDRESS='MAC_ADDRESS'

throw_error()
{
	printf "\nuasge:\npair.sh [pair|unpair]"
}

if [[ $# -eq 1 ]]
then
	if [[ "$1" == "pair" ]]
	then
		bluetoothctl power on
		bluetoothctl pair  "$MAC_ADDRESS"
		bluetoothctl connect "$MAC_ADDRESS"
	elif [[ "$1" -eq "unpair" ]]
	then
		bluetoothctl disconnect  "$MAC_ADDRESS"
		bluetoothctl power off
	else
		throw_error
	fi
else
	throw_error
fi
