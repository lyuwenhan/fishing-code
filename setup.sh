#!/bin/bash
now=$(stty -g)
stty sane
cd "$(dirname "$0")"
stty -echo raw
clear
echo -e "loading...\r"
if [[ " $* " == *" -CN "* ]]; then
	./main.run
elif [[ " $* " == *" -EN "* ]]; then
	./mainEN.run
else
	./main.run
fi
if ! [ $? -eq 0 ];then
	clear
	stty echo cooked
	echo "运行错误"
	exit 1
fi
stty "$now"
