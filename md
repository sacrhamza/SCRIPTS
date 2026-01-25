#!/bin/bash

if [[ $# -eq 1 ]]
then
	echo $1
	mkdir "$1" && cd "$1"
fi
