#!/bin/bash

function print_vars()
{
	NC='\e[0m' # No Color
	
	printf "$1$2HOSTNAME${NC} = $3$4$HOSTNAME${NC}\n"
	printf "$1$2TIMEZONE${NC} = $3$4$TIMEZONE${NC}\n"
	printf "$1$2OS${NC} = $3$4$OS${NC}\n"
	printf "$1$2DATE${NC} = $3$4$DATE${NC}\n"
	printf "$1$2UPTIME${NC} = $3$4$UPTIME${NC}\n"
	printf "$1$2UPTIME_SEC${NC} = $3$4$UPTIME_SEC${NC}\n"
	printf "$1$2IP${NC} = $3$4$IP${NC}\n"
	printf "$1$2MASK${NC} = $3$4$MASK${NC}\n"
	printf "$1$2GATEWAY${NC} = $3$4$GATEWAY${NC}\n"
	printf "$1$2RAM_TOTAL${NC} = $3$4$RAM_TOTAL${NC}\n"
	printf "$1$2RAM_USED${NC} = $3$4$RAM_USED${NC}\n"
	printf "$1$2RAM_FREE${NC} = $3$4$RAM_FREE${NC}\n"
	printf "$1$2SPACE_ROOT${NC} = $3$4$SPACE_ROOT${NC}\n"
	printf "$1$2SPACE_ROOT_USED${NC} = $3$4$SPACE_ROOT_USED${NC}\n"
	printf "$1$2SPACE_ROOT_FREE${NC} = $3$4$SPACE_ROOT_FREE${NC}\n"
}

function print_report()
{
	echo ; echo "Column 1 background = $1 ($2)"
	echo "Column 1 font color = $3 ($4)"
	echo "Column 2 background = $5 ($6)"
	echo "Column 2 font color = $7 ($8)"
}