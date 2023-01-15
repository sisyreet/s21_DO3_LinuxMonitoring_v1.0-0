#!/bin/bash

. print.sh

start_time=$(date +%s.%N)

if [[ $# == 1 && -d $1 && "$1" =~ '/'$ ]]
then
	print_total_nummber_of_folders
	print_top_5
	print_total_numbers_of_files
	print_number_of_different_file_types
	print_top_10_files
	print_top_10_exec
	end_time=$(date +%s.%N)
	echo "Script execution time (in seconds) = " `echo "$end_time $start_time" | awk '{printf "%.1lf", $1-$2}'`
else
	echo "Wrong arguments! Usage: ./main.sh/sysireet/"
fi
