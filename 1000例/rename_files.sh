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

index=0

function rename() {
	# echo $FILES
	if [[ ! -e "$TARGET_PATH/rename_files" ]]; then
		mkdir "$TARGET_PATH/rename_files"
	fi

	for f in `ls $TARGET_PATH`; do
		echo "yyyyyyy $f"
		# echo "nnnnnn $TARGET_PATH/$f"
	    cleanup_name="$(echo $f | sed 's/ /_-_/g')"
		echo "lll  $cleanup_name"
		fileType=`echo ${cleanup_name##*.}`

		if [[ $cleanup_name == *.* ]]; then
			fileType=".$fileType"
		else
			fileType=''
		fi

		target_file=$TARGET_PATH/rename_files/"$rename_name""$fileType"
		
		if [[ -e $target_file ]]; then
			index=$[$index+1]
			target_file=$TARGET_PATH/rename_files/"$rename_name"$index"$fileType"
		fi

		mv "$TARGET_PATH/$cleanup_name" "$target_file"
	done

}

rename


# 问题：  
#for f in `ls $TARGET_PATH`; do
# 比如： cao的副本 2.png    rename_files
# cao的副本 2.png 这其实是一个文件，名字只是有空格
# 如果有空格 读$f 就是错的 （文件分开了）