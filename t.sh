#!/bin/bash

MINPARMS=10

echo 
echo "The name is \"$0\""
echo "The name is \"`basename $0`\""
echo

if [ -n "$1" ] 
then
 echo "Paraneter #1 is $1"
fi

if [ -n "${10}" ]
then
echo "Parameter #10 is ${10}"
fi

echo "---------------------------------"
echo "All the command-line parameter are : "$*""

if [  $# =-lt "$MINPARMS" ]
then
echo "$MINPARMS command-line arguments"
fi

echo

