#!/bin/bash

# 把一个文件夹下所有文件全部写入到直定文件中（合并文件） (文件夹下的文件夹不行)

echo "请输入你要读取的哪个文件夹（下的所有文件）路径:"
read FILE_PATH

nullPath=`echo "\033[31m 空路径 ❌ \033[0m"`

if [[ -z $FILE_PATH ]]; then
	echo $nullPath
	exit 0
fi


echo "请输写入到文件的路径："
read WRITEFILE_PATH

if [[ -z $WRITEFILE_PATH ]]; then
	echo $nullPath
	exit 0
fi


cat "$FILE_PATH"/* > $WRITEFILE_PATH

echo "success!"