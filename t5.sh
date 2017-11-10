#!/bin/bash

num1=$[(3+3)*2*3]
num2=$[2+3]

if  $num1 -eq $num2
then
echo "num1 == num2"
else 
echo "$num1"
fi
