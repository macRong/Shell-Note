#!/bin/bash

# 一个文件夹下所有文件的数量

echo "请输入你要读取的哪个文件夹（包含下的所有文件）路径:"
read FILE_PATH

nullPath=`echo "\033[31m 空路径 ❌ \033[0m"`

if [[ -z $FILE_PATH ]]; then
    echo $nullPath
    exit 0
fi



 
Total_dir=0
 
Hi_Dir () {

    FILE=$1
    if test -d $FILE
    then
        num=`ls $FILE | wc -l `
    else
        num=0
    fi


    if test -d $FILE -a $num -gt 0
    then

        for FILE1 in $FILE/*
        do
            Hi_Dir $FILE1
        done
    
    else
        echo "Hi `basename $FILE` =========== `dirname $FILE`"
        Total_dir=$[Total_dir +1]
    fi
    
}

for lll in $FILE_PATH/*
do
Hi_Dir $lll
done
 
 
 echTotal=`echo "\033[34m $Total_dir \033[0m"`

echo "Thare are total $echTotal files 🍺"
