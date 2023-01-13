#!/bin/bash

. print.sh

start_time_sec=`date +%s`

if [[ $# == 1 && -d $1 && "$1" =~ '/'$ ]]
then
	printTotalNumberOfFolders
	printTop5
	printTotalNumberOfFiles
	printNumberOfDifferentFileTypes
	print_top_10_files
	print_top_10_exec
	end_time_sec=`date +%s)`
	elapsed=$(($end_time_sec-$start_time_sec))
	echo "Script execution time (in seconds) = $elapsed"
else
	echo "Wrong arguments! Usage: ./main.sh/sysireet/"
	exit
fi

# fix measurement of execution time