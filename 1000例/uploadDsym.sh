#!/bin/bash
#Author:macRong
#Create Date:2019.04.01
export LANG=en_US.UTF-8


hintStr=`echo "\033[37m *上传dsym请按照如下步骤就ok* \033[0m"`

echo $hintStr
echo "【1】请输入你要上传的绝对路径 (如：/Users/rongtian/work/jenkinsserver/123.zip):"

read TARGET_PATH
nullPath=`echo "\033[31m 空路径 ❌ \033[0m"`

if [[ -z $TARGET_PATH ]]; then
	echo $nullPath
	exit 0
fi


expect -c "
set timeout 1200;
spawn /usr/bin/scp  $TARGET_PATH ios@172.16.111.250:/Users/ios/webServer/UHDsyms/
expect {
	\"*yes/no*\" {send \"yes\r\"; exp_continue}
	\"*Password*\" {send \"ios1234qwer\r\";}
}
expect eof;"
