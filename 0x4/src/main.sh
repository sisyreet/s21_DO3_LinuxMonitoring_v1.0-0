#!/bin/bash

. print.sh
. parse_sys_info.sh
. configs/custom_configuration.conf
. configs/default_configuration.conf

f_colors_codes=("\e[1;37" "\e[0;31m" "\e[0;32m" "\e[0;34m" "\e[0;35m" "\e[0;30m")
b_colors_codes=("\e[47m" "\e[41m" "\e[42m" "\e[44m" "\e[45m" "\e[40m")
ncolors=("white" "red" "green" "blue" "purple" "black")
names=("", "", "", "")

colors[0]=$column1_background
colors[1]=$column1_font_color
colors[2]=$column2_background
colors[3]=$column2_font_color

def_colors[0]=$column1_dbackground
def_colors[1]=$column1_dfont_color
def_colors[2]=$column2_dbackground
def_colors[3]=$column2_dfont_color

#check colors numbers
for i in {0..3}
do
	if [[ ${colors[$i]} =~ ^[1-6]$ ]]
	then
		names[$i]=${colors[$i]}
	else
		colors[$i]=${def_colors[$i]}
		names[$i]="default"
	fi
done

#check occurrences in left part
if [[ ${colors[1]} == ${colors[0]} ]]
then
	colors[1]=${def_colors[1]}
	names[1]="default"
	if [[ ${colors[1]} == ${colors[0]} ]]
	then
		colors[1]=${def_colors[0]}
	fi
fi

#check occurrences in right part
if [[ ${colors[3]} == ${colors[2]} ]]
then
	colors[3]=${def_colors[3]}
	names[3]="default"
	if [[ ${colors[3]} == ${colors[2]} ]]
	then
		colors[3]=${def_colors[2]}
	fi
fi

parse_sys_info
print_vars "${f_colors_codes[colors[1] - 1]}" "${b_colors_codes[colors[0] - 1]}" "${f_colors_codes[colors[3] - 1]}" "${b_colors_codes[colors[2] - 1]}" 
print_report "${names[0]}" "${ncolors[colors[0] - 1]}" "${names[1]}" "${ncolors[colors[1] - 1]}" "${names[2]}" "${ncolors[colors[2] - 1]}" "${names[3]}" "${ncolors[colors[3] - 1]}" 
