#!/bin/bash

. print.sh

# ✓ 4 parameters
# ✓ parameters are numeric from 1 to 6 (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)
# ✓ font and background mustn't match and must be handled, suggest to try again and exit

if [[ $# != 4 ]]
then
	echo -e "\e[1;31mwrong number of parameters\n\e[1;35musage: ./main.sh 1 2 4 5\e[0m\ntry again..."
	exit
else
	cmp="^[1-6]$"
	if ! [[ $1 =~ $cmp && $2 =~ $cmp && $3 =~ $cmp && $4 =~ $cmp ]]
	then
		echo -e "\e[1;31mwrong parameters, it must be numbers from 1 to 6\n\e[1;34musage: ./main.sh 1 2 4 5\e[0m\ntry again..."
		exit
	else
		if [[ $1 == $2 || $3 == $4 ]]
		then
		echo -e "\e[1;31mwrong parameters, font and background colors mustn't match\n\e[1;36musage: ./main.sh 1 2 4 5\e[0m\ntry again..."
		exit
		fi
	fi
fi


#font colors
fcolors=("\e[1;37" "\e[0;31m" "\e[0;32m" "\e[0;34m" "\e[0;35m" "\e[0;30m")
bcolors=("\e[47m" "\e[41m" "\e[42m" "\e[44m" "\e[45m" "\e[40m")
NC='\e[0m' # No Color

HOSTNAME=$(hostname)
TIMEZONE="$(cat /etc/timezone) $(date -u "+%Z") $(date "+%z")"
USER=$(whoami)
OS=$(awk '{printf $1" "$2" "$3}' /etc/issue)
DATE=$(date "+%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(awk '{print $1}' /proc/uptime)
IP=$(hostname -I)
MASK=$(ifconfig | grep -m1 netmask | awk '{print $4}')
GATEWAY=$(ip r | grep default | awk '{print $3}')
RAM_TOTAL=$(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')
RAM_USED=$(free -m | grep Mem | awk '{printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | grep Mem | awk '{printf "%.3f GB", $4/1024}')
SPACE_ROOT=$(df /root/ | awk '/\// {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df /root/ | awk '/\// {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE=$(df /root/ | awk '/\// {printf "%.2f MB", $4/1024}')

print_vars "${fcolors[$2-1]}" "${bcolors[$1-1]}" "${fcolors[$4-1]}" "${bcolors[$3-1]}"