#!/bin/bash


eqfunc(){

if [ $1 = $2 ]
then
        echo -e "相等 \n"
	echo "file is 。。"
else
        echo "不相等"
fi
}

cfunc(){

echo "shengshui.com \c"
echo "It is name"

echo `date`
}


formatfunc(){

printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876 

printf %s abc def
}

formatfunc
