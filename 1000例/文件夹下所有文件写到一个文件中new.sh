#!/bin/bash

# 把一个文件夹下所有文件全部写入到直定文件中（合并文件） (文件夹下的文件夹不行)

echo "请输入你要读取的哪个文件夹（包含下的所有文件）路径:"
read FILE_PATH

nullPath=`echo "\033[31m 空路径 ❌ \033[0m"`

if [[ -z $FILE_PATH ]]; then
    echo $nullPath
    exit 0
fi


#echo "支持哪些类型（如：txt, sh, word, h,m 或者 * 支持所有）"
#read FILE_TYPE
#




echo "请输入写到文本的路径："
read WRITEFILE_PATH

if [[ -z $WRITEFILE_PATH ]]; then
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
        #⚠️这里是什么后缀????
        if [ "${FILE##*.}"x = "java"x ]||[ "${FILE##*.}"x = "xml"x ];then
            echo "Hi `basename $FILE` =========== `dirname $FILE`"
            cat $FILE >> $WRITEFILE_PATH
            Total_dir=$[Total_dir +1]

        fi

    fi
    
}

for lll in $FILE_PATH/*
do
Hi_Dir $lll
done
 
 
echo "Thare are total $Total_dir files 🍺"
