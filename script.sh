#!/usr/bin/env bash

while echo -n 'hello$ ' && read -r line
do
	bash -c "docker $line"
done
