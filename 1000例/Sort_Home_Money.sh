#!/bin/bash

echo "请输入你的文件路径:"
echo "注意:文件格式类似 xx 6 88888"
read FILE_PATH


function calculate_Sort() {
	if [[ ! -f FILE_PATH ]]; then
		echo "\033[31m 这不是文件 \033[0m"
		exit -1
	fi	
}


calculate_Sort
