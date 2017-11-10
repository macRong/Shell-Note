#!/bin/bash

while :
do 
	echo -n "Enter your secret num:"
	read num
	case $num in
		1|2|3|4|5|6|7) echo "The secret num is $num ❌"
		;;
		8) echo "right ✅"
		break
		;;
		*) echo "enter block *"
			continue
		echo "game over"
		;;
	esac
done
