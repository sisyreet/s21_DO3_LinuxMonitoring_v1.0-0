#!/bin/bash

. print.sh

start_time="$(date +%s.%1N)"

if [[ $# == 1 && -d $1 && "$1" =~ '/'$ ]]
then
	printTotalNumberOfFolders
	printTop5
	printTotalNumberOfFiles
	printNumberOfDifferentFileTypes
	print_top_10_files
	print_top_10_exec
	end_time="$(date +%s.%1N)"
	total_time="$(bc <<<"$end_time-$start_time")"
	echo "Script execution time (in seconds) = $total_time"
else
	echo "Wrong arguments! Usage: ./main.sh/sysireet/"
	exit
fi

# edit last 2 top 10 funcs
# fix measurement of execution time