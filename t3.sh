#!/bin/bash


if [ $1 = $2 ]
then 
echo "#1相等#2"
else 
echo "#!不等#2"
fi

echo "-------------------"
if [ -n $1 ]
then 
echo "#1长度不为0"
else
echo "#1长度为0"
fi

echo "-------------------"
if [ $1 ]
then
echo "#1 is not empty"
else 
echo "#1 is empty"
fi
