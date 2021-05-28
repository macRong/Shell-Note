#!/bin/bash
#------------------------------------------------------
# 功能：修改xcodeproj中target的plist中 CFBundleShortVersionString 、CFBundleVersion、和项目的PRODUCT_BUNDLE_IDENTIFIER
#
# 参数说明：	-h               查看命令的使用
#           -av              c
#           -bv              修改BuildVersion
#				-bi				  修改BundleIdentifier
#          


#定义project名字
# lg_root_path=$(dirname $(dirname "$PWD"))
projectName=$PWD"/Runner.xcodeproj" 

# echo $projectName

# exit 0;
# echo "脚本名$0"
# echo "第一个参数$1"
# echo "第二个参数$2"
# echo "第三个参数$3"

tmp_arg1=$1 
tmp_arg2=$2
tmp_arg3=$3


# help
usage(){
	echo "-------------项目版本号等配置修改器 v1.0-----------------"
	echo "放在项目的.xcodeproj同级目录下"
	echo "Usage:  changeAVBVBI.sh -av 1.0.0 "
	echo "Options:"
	echo "    -av 1.0.0           修改AppVersion为1.0.0"
	echo "    -bv 1               设置BuildVersion为1"
	echo "    -bi com.xxx.xxx     修改BundleIdentifier为com.xxx.xxx"
	echo "    -h                  help"
	echo 
}


# exit 0;


# 设置的 修改AppVersion
appversion=''
# 设置的 修改BuildVersion
buildversion=''
# 设置的 修改BundleIdentifier
bundleidentifier=''
# 设置App version
setAppVersion(){

	if [[ ! -n "$appversion" ]] && [[ ! -n "$buildversion" ]] && [[ ! -n "$bundleidentifier" ]]
	then
		echo -e "\033[32m ERROR：目标参数为空 \"AppVersion/BuildVersion/BundleIdentifier\" \033[0m"
   		exit 0;
	fi


	# 带颜色打印输出文字 \033[32m .. \033[0m
	echo -e "\033[32m 正在设置... \033[0m"

	plistcount=0

	path="$(xcodebuild -project $projectName -alltargets -showBuildSettings | grep -E "PRODUCT_SETTINGS_PATH|PRODUCT_BUNDLE_IDENTIFIER")"
	path_arr=($path)
	len=`expr ${#path_arr[@]} / 2 - 1` #因为开头第一组bundle id和plist path会在最后重复出现一次

	for (( i = 0; i < $len; i++ )); do
	 	bundle_id_index=`expr $i \* 2`
	 	substr="    PRODUCT_BUNDLE_IDENTIFIER = "
	 	str=${path_arr[$bundle_id_index]}
	 	bundle_id=${str#$substr}

	 	if [[ $bundle_id == *$matchstr* ]] || [[ $bundle_id == $sel_bundle_id ]]; then
	 		plist_index=`expr $i \* 2 + 1`
	 		substr="    PRODUCT_SETTINGS_PATH = "
	 		str=${path_arr[$plist_index]}
	 		plist=${str#$substr}

	 		# 检索.plist结尾、去掉LGVideoTests
			if [[ "$plist" == *plist ]]; then	


			# 如果存在
			if [[ -n "$appversion" ]]; then
				/usr/libexec/PlistBuddy -c "set CFBundleShortVersionString $appversion" "$plist"
			fi
 
			if [[ -n "$buildversion" ]]; then
				/usr/libexec/PlistBuddy -c "set CFBundleVersion $buildversion" "$plist"
			fi

			if [[ -n "$bundleidentifier" ]]; then
				PRODUCT_BUNDLE_IDENTIFIER=`sed -n '/PRODUCT_BUNDLE_IDENTIFIER/{s/PRODUCT_BUNDLE_IDENTIFIER = //;s/;//;s/^[[:space:]]*//;p;q;}' $projectName/project.pbxproj`
				# echo "PRODUCT_BUNDLE_IDENTIFIER:"$PRODUCT_BUNDLE_IDENTIFIER
				# echo "s/"$PRODUCT_BUNDLE_IDENTIFIER"/"$bundleidentifier"/g"
				sed -i '' "s/"$PRODUCT_BUNDLE_IDENTIFIER"/"$bundleidentifier"/g" $projectName/project.pbxproj
			fi
                
                plistcount=$plistcount+1;
        	fi

	 	fi

 done 


 # 提示
	tip=''
	if [[ $plistcount == 0 ]]; then
		tip='ERROR：not found plist'
	else
		tip="appversion : $appversion , buildversion : $buildversion , bundleidentifier : $bundleidentifier "
	fi
	echo -e "\033[32m ${tip} \033[0m"
}



# 判断入口

if [[ ! -n "$tmp_arg1" ]]; then
	usage
   	exit 0;
fi

if [ $tmp_arg1 == "-h" ] && [ -n "$tmp_arg2" ]
then
   usage
   exit 0;
elif [ $tmp_arg1 == "-av" ] && [ -n "$tmp_arg2" ]
then
	appversion=$tmp_arg2
   	setAppVersion
   	exit 0;
elif [ $tmp_arg1 == "-bv" ] && [ -n "$tmp_arg2" ]
then
   	buildversion=$tmp_arg2
   	setAppVersion
   	exit 0;
elif [ $tmp_arg1 == "-bi" ] && [ -n "$tmp_arg2" ]
then
   	bundleidentifier=$tmp_arg2
   	setAppVersion
   	exit 0;
else
   usage
   exit 0;
fi





