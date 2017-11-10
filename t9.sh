#!/bin/bash

echo "Enter a number betwween 1 and 5:"
echo 'The number you entered is:'
read aNum

case $aNum in
	1) echo 'print 1'
	;;
	2) echo 'print 2'
	;;
        3) echo 'print 3'
	;;
	4) echo 'print 4'
	;;
	*) echo "print *"
        ;;
esac

