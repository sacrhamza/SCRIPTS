#!/bin/bash

declare -A executor
executor["c"]='cc'
executor["js"]='nodejs'
executor["cpp"]='g++'
executor["sh"]='bash'
executor["py"]='python3'

for file in "$@"
do 
  file_extension="${file: -1: 2}"
  "${executor[${file_extension}]}" "$file"
done
