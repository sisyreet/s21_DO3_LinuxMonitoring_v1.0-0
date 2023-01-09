#!/bin/bash

. print.sh

start_time="$(date -u +%s.%N)"

if [[ $# == 1 && -d $1 && "$1" =~ '/'$ ]]
then
	print_vars
else
	echo "Wrong arguments! Usage: ./main.sh/sysireet/"
fi

end_time="$(date -u +%s.%N)"

elapsed="$(bc <<<"$end_time-$start_time")"
echo "Total of $elapsed seconds elapsed for process"