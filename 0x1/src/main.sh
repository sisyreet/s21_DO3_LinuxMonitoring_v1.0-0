#!/bin/bash

if [[ $# != 1 ]]
then 
	printf "Wrong number of arguments: $#\nUsage: ./main text\n"
else
	cmp='^[+-]?[0-9]+([.][0-9]+)?$' 
	if [[ $1 =~ $cmp ]]
	then
		printf "Argument must be a text!\nUsage: ./main text\n"
	else
		echo $1
	fi
fi

# ^ - с начала строки
# [+-] - набор допустимых символов 
# ? - указывает на то, что предшествующий символ может встретиться в тексте один раз или не встретиться вовсе
# [0-9]+ - диапазон символов, '+' означает что символов из этого набора может быть несколько
# $ - до конца строки
# https://habr.com/ru/company/ruvds/blog/327896/