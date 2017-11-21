#!/bin/bash
#
#Author:macRong
#Create Date:2017.11.19

CURRENTPATH=`pwd` 
PROJECTPATH=${CURRENTPATH%/*}
TARGETPATH=$PROJECTPATH'/shell/limit_commit_temp.sh'
PREPARECOMPATH=$PROJECTPATH'/.git/hooks/prepare-commit-msg'
HOOKPATH=$PROJECTPATH'/.git/hooks'

if [[ ! -e "$HOOKPATH" ]]; then
	mkdir -p $HOOKPATH 
fi


cat $TARGETPATH > $PREPARECOMPATH
chmod u+x $PREPARECOMPATH


 
if [[ -x "$PREPARECOMPATH" ]]; then
	echo "\033[32m 🍺 安装成功 ✅ \033[0m"
else
	echo "\033[31m 安装失败 ❌ \033[0m"
fi



#
# 关于路径，一个思路要先获取绝对路径，不用来回cd
# 相对路径...
#