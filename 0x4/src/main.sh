#!/bin/bash

. print.sh
. configs/configuration

#font colors
fcolors=("\e[1;37" "\e[0;31m" "\e[0;32m" "\e[0;34m" "\e[0;35m" "\e[0;30m")
bcolors=("\e[47m" "\e[41m" "\e[42m" "\e[44m" "\e[45m" "\e[40m")
ncolors=("white" "red" "green" "blue" "purple" "black" "no color")
def_colors=("2" "3" "3" "4")
NC='\e[0m' # No Color

HOSTNAME=$(hostname)
TIMEZONE="$(cat /etc/timezone) $(date -u "+%Z") $(date "+%z")"
USER=$(whoami)
OS=$(awk '{printf $1" "$2" "$3}' /etc/issue)
DATE=$(date "+%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(awk '{print $1}' /proc/uptime)
IP=$(hostname -I)
MASK=$(ip address | grep "scope global" | grep -o "/\w*")
GATEWAY=$(ip r | grep default | awk '{print $3}')
RAM_TOTAL=$(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')
RAM_USED=$(free -m | grep Mem | awk '{printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | grep Mem | awk '{printf "%.3f GB", $4/1024}')
SPACE_ROOT=$(df /root/ | awk '/\// {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df /root/ | awk '/\// {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE=$(df /root/ | awk '/\// {printf "%.2f MB", $4/1024}')

cmp="^[1-6]$"
if ! [[ $column1_font_color =~ $cmp && $column1_background =~ $cmp && $column2_font_color =~ $cmp && $column2_background =~ $cmp ]]
then
	echo -e "\e[1;31mwrong configuration, default color scheme was applied\e[0;m\n"
	print_vars "${fcolors[6]}" "${bcolors[6]}" "${fcolors[6]}" "${bcolors[6]}"
	exit
else
	if [[ $column1_font_color == $column1_background || $column2_font_color == $column2_background ]]
	then
	echo -e "\e[1;31mwrong configuration, default color scheme was applied\e[0;m\n"
	print_vars "${fcolors[6]}" "${bcolors[6]}" "${fcolors[6]}" "${bcolors[6]}"
	print_def
	exit
	fi
fi

print_vars "${fcolors[$column1_font_color - 1]}" "${bcolors[$column1_background - 1]}" "${fcolors[$column2_font_color - 1]}" "${bcolors[$column2_background - 1]}"