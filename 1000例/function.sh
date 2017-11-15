#!/bin/bash

function sumArray() {

    local sum=0
    local newarray=(`echo "$*"`)

    for value in ${newarray[*]}
    do
        sum=$[ $sum+$value ]
    done

    echo "inlineLog= $sum"

    return $sum
}

arr=(6 7 8 9)
arg1=`echo ${arr[*]}`
result=`sumArray $arg1`
echo "The result is: $result \n return=$?"



##### 上面参数介绍 #####
#
# $? 接受返回值
# $* 获取所有的参数
# 转换为数组 ${arr[*]}
#
###### @end ########

