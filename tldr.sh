#!/bin/bash

#store all arguments in an array
#rights: oneperson
declare -a SUBJECT
SUBJECT=($@)

#if we have just one arment curl the url

if [[ $# -eq 1 ]]
then
	if [[ $1 == @(help|'-h'|'--help') ]]
	then
		printf "\n\t\e[34musage: $0 language/concept
	\e[33mif you need just a linux command you can use: $0 command\e[00m\n"
	else
		curl cheat.sh/${1}
	fi

#if we have multible ones curl one by one adding the phrase
#that contains the name of the subject in a pink color

elif [[ $# -gt 1 ]]
then
	declare -i i
	i=0
	for (( $i; $i < $#; i++ ))
	do
		echo -e "\n\e[41m${SUBJECT[i]}\e[00m\n"
		curl cheat.sh/${SUBJECT[i]}
	done
else
	printf "error"
fi
