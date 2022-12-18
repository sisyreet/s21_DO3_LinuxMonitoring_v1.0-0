#!/bin/bash

if [[ $# != 1 ]]
then 
	printf "Wrong number of arguments: $#\nUsage: ./main 21\n"
else
	cmp='^[+-]?[0-9]+([.][0-9]+)?$'
	if ! [[ $1 =~ $cmp ]]
	then
		printf "Argument must be a number!\nUsage: ./main 21\n"
	else
		echo $1
	fi
fi