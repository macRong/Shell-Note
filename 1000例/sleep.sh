#!/bin/bash
n=1
echo "检查xxx服务..."

BBCOUNT=99
export BBCOUNT

while true
do
	        echo "$kk"

        if test $n -gt 20
        then
                echo "xxx服务启动失败"
                break
        fi
               
        sleep 5
        n=$(($n+1))
        port=`netstat -antp | grep "0.0.0.0:8080"`
        if [ ${#port} -gt 3 ]; then
                echo "xxx服务已经启动"
                break;
        fi
done




#检查端口号是否已启动