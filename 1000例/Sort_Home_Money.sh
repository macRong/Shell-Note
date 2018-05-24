#!/bin/bash

echo "请输入你的文件路径:"
echo "注意:文件格式类似 xx 6 88888"
# read FILE_PATH


# function calculate_Sort() {
# 	if [[ ! -f $FILE_PATH ]]; then
# 		echo "\033[31m 这不是文件 \033[0m"
# 		exit -1
# 	fi	

# 	for line in `cat $FILE_PATH`
# 	do
# 		echo "uuu $line"
# 	done

# }



#调函数
# calculate_Sort


[ $# -lt 1 ] && echo "please input the income file" && exit -1
[ ! -f $1 ] && echo "$1 is not a file" && exit -1

income=$1
awk '{
    printf("%d %0.2f\n", $1, $3/$2);
}'
$income | sort -k 2 -n -r

