#! /bin/bash

function parse_sys_info
{
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
}