#!/bin/bash

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
	elif [[ "$1" == @(unpair|remove) ]]
	then
		if [[ "$1" == unpair ]]
		then
			bluetoothctl disconnect  "$MAC_ADDRESS"
		else
			bluetoothctl remove  "$MAC_ADDRESS"
		fi
		bluetoothctl power off
	else
		throw_error
	fi
else
	throw_error
fi
