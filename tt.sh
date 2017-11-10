#!/bin/bash

a=8
b=10
val=`expr $a + $b`
echo "$val"

if [ $a == $b ]
then 
echo "a==b"
else 
echo "a!=b"
fi

