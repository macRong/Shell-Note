#!/bin/bash

echo "请输入你要创建的模块前缀名(如：GJROrder)："
read MODULE_PREFIX_NANEM

nullPath=`echo "\033[31m 不可为空 ❌ \033[0m"`


if [[ -z $MODULE_PREFIX_NANEM ]]; then
    echo $nullPath
    exit 0
fi

CURRENTPATH=`pwd` 
#/Users/macrong/Downloads/RubbishCreater/RubbishFiles/KKModule

# 创建模块
ModuleName=$MODULE_PREFIX_NANEM"Module"
ModulePath=$CURRENTPATH/"RubbishFiles"/$ModuleName
mkdir -p $ModulePath


# 创建文件夹
Model_mian_name=$MODULE_PREFIX_NANEM"Main"
Model_viewController_name=$MODULE_PREFIX_NANEM"ViewController"
Model_View_name=$MODULE_PREFIX_NANEM"View"
Model_DataSource_name=$MODULE_PREFIX_NANEM"DataSource"

mkdir -p $ModulePath/$Model_mian_name
mkdir -p $ModulePath/$Model_viewController_name
mkdir -p $ModulePath/$Model_View_name
mkdir -p $ModulePath/$Model_DataSource_name


#创建Main文件
Module_main_h_path=$ModulePath/$Model_mian_name/$MODULE_PREFIX_NANEM"Main.h"
Module_main_m_path=$ModulePath/$Model_mian_name/$MODULE_PREFIX_NANEM"Main.m"
touch $Module_main_h_path
touch $Module_main_m_path
cat $CURRENTPATH/ViewController/"ViewControllerTemplate_h.txt" > $Module_main_m_path



echo "创建成功🍺"
