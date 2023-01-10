#!/bin/bash

path=$1

function printTotalNumberOfFolders
{
	echo -n "Total number of folders (including all nested ones) = "
	ls -R $path* | grep ./ | wc -l
}

function printTop5
{
	echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
	du -sh -- $path* | sort -rh | head -5 | awk 'BEGIN{i=1}{printf "%d - %s, %sB\n", i, $2, $1; i++}'
}

function printTotalNumberOfFiles
{
	echo -n "Total number of files = "
	find $path -type f | wc -l
}

function printNumberOfDifferentFileTypes
{
	echo "Number of:"
	echo -n "Configuration files (with the .conf extension) = " ; find $path -name \*.conf | wc -l
	echo -n "Text files = "; find $path -type f -exec grep -Iq . {} \; -print | wc -l
	echo -n "Executable files = " ; find $path -type f -executable -print | wc -l
	echo -n "Log files (with the extension .log) = " ; find $path -name \*.log | wc -l
	# echo -n "Archive files = " ; find $path -type f -archive | wc -l
	echo -n "Symbolic links = " ; ls -lR $path | grep ^l | wc -l
	
	
}