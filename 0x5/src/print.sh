#!/bin/bash

path=$1
totalFolders=$(ls -R $path | grep ./ | wc -l)

function print_vars()
{
	echo "Total number of folders (including all nested ones) = $totalFolders"
	echo "TOP 5 folders of maximum size arranged in descending order (path and size):"

}