#!/bin/bash

#file="/Users/rongtian/desktop/temp/temp/t.sh"

if [ -x $1 ]
then
echo "#1 可执行"
else 
echo "#1 不可执行"
fi

echo "--------------------------"
if [ -e $1 ]
then
echo "文件存在"
else
echo "文件不存在"
fi
