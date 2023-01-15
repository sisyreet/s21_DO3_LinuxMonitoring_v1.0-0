#!/bin/bash

path=$1

function print_total_nummber_of_folders
{
	echo -n "Total number of folders (including all nested ones) = "
	ls -R $path* | grep ./ | wc -l
}

function print_top_5
{
	echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
	du -h -- $path* | sort -rh | head -5 | awk 'BEGIN{i=1}{printf "%d - %s, %sB\n", i, $2, $1; i++}'
}

function print_total_numbers_of_files
{
	echo -n "Total number of files = "
	find $path -type f | wc -l
}

function print_number_of_different_file_types
{
	echo "Number of:"
	echo -n "Configuration files (with the .conf extension) = " ; find $path -type f -name \*.conf | wc -l
	echo -n "Text files = "; find $path* -type f -exec grep -Iq . {} \; -print | wc -l
	echo -n "Executable files = " ; find $path -type f -executable | wc -l
	echo -n "Log files (with the extension .log) = " ; find $path -type f -name \*.log | wc -l
	echo -n "Archive files = " ; find $path -type f -name \*.tar -o -name \*.zip -o -name \*.tar -o -name \*.7z | wc -l
	echo -n "Symbolic links = " ; ls -lR $path | grep ^l | wc -l
}

function print_top_10_files
{	
	echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
	for i in {1..10}
	do
		file_path=$(find $path -type f -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d") # найти по пути файлы, выполнить ду | сортировка реверс | top10 | взять ном строку, выйти очистить буфер
		if ! [[ -z $file_path ]]
		then
			echo -n "$i - "
			echo -n "$(echo $file_path | awk '{print $2}'), " # path
			echo -n "$(echo $file_path | awk '{print $1}'), " # size
			echo "$(echo $file_path | grep -o -E "\.[^/.]+$" | awk -F . '{print $2}')" # extension
		fi
	done
}

function print_top_10_exec
{
	echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
  	for i in {1..10}
  	do
		file_path=$(find $path -executable -type f -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d")
		if ! [[ -z $file_path ]]
		then
			echo -n "$i - "
			echo -n "$(echo $file_path | awk '{print $2}'), "
			echo -n "$(echo $file_path | awk '{print $1}'), "

			npath=$(echo $file_path | awk '{print $2}')
			MD5=$(md5sum $npath | awk '{print $1}')
			echo "$MD5"
		fi
	done
}