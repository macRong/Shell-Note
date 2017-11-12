#!/bin/bash


fun(){

if test  $[$1] -eq $[$2]
then
	echo "相等"
else 	
	echo "不相等"
fi


}


filefune(){

cd /bin

if test -e ./bash
then
	echo "文件已存在"
else
	echo "文件不存在"
fi
}

filefune
