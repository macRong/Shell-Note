#!/bin/bash


# LOCATION=$1
# cd $LOCATION
hintStr=`echo "\033[37m *该功能实现的是 在指定文件夹下，批量重命名文件的名字* \033[0m"`
echo $hintStr
echo "【1】请输出要转换的文件夹路径:"

read TARGET_PATH
nullPath=`echo "\033[31m 空路径 ❌ \033[0m"`

if [[ -z $TARGET_PATH ]]; then
	echo $nullPath
	exit 0
fi

# LOCATION_FILES_NUM=`ls -l | grep "IMG" | wc -l `
CUREENPATH=`pwd`

echo "【2】请输出重命名的文件名字(如 zhang)后面会自增123..:"
read rename_name


# arr=()
index=0
function rename() {
	# echo $FILES
	if [[ ! -e "$TARGET_PATH/rename_files" ]]; then
		mkdir "$TARGET_PATH/rename_files"
	fi

	for f in `ls $TARGET_PATH`; do
		index=$[$index+1]
		# echo "nnnnnn $TARGET_PATH/$f"
	    cleanup_name="$(echo $f | sed 's/ /_-_/g')"
		echo "lll   $cleanup_name"
		mv "$TARGET_PATH/$cleanup_name" $TARGET_PATH/rename_files/"$rename_name"$index".jpg"
	done

}

rename


# example:
# sh /Users/rongshouzhen/Downloads/rename.sh /Users/rongshouzhen/Downloads/wang 