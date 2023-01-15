#!/bin/bash

. print.sh

HOSTNAME=$(hostname) #host's name
TIMEZONE="$(cat /etc/timezone) $(date -u "+%Z") $(date "+%z")" #timezone, UTC, +xx00
USER=$(whoami) #name of currently logged in user
OS=$(awk '{print $1, $2, $3}' /etc/issue) #prints only os name w/o '/n' '/l'
DATE=$(date "+%d %b %Y %H:%M:%S") # prints date in proper format
UPTIME=$(uptime -p) 
UPTIME_SEC=$(awk '{print $1}' /proc/uptime)
IP=$(hostname -I) # prints ip addr instead of name
MASK=$(ifconfig | grep -m1 netmask | awk '{print $4}') # mask in xxx.xxx.xxx.xxx format
GATEWAY=$(ip r | grep default | awk '{print $3}') # ip of default gateway
RAM_TOTAL=$(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}') 
RAM_USED=$(free -m | grep Mem | awk '{printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | grep Mem | awk '{printf "%.3f GB", $4/1024}')
SPACE_ROOT=$(df /root/ | awk '/\// {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df /root/ | awk '/\// {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE=$(df /root/ | awk '/\// {printf "%.2f MB", $4/1024}')

print_vars
question