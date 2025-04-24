#!/bin/bash

declare -i i

i=0
FILES=("$@")

for (( i; i < $#; i++ ))
do
	norminette "${FILES[i]}"
done
