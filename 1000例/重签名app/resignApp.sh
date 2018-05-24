#重签名第三方App到手机上


#------------------------------
#变量
# ${SRCROOT} xcode工程路径
# $BUILT_PRODUCTS_DIR工程的products路径
# $TARGET_NAME target路径
# $PRODUCT_DUNDLE_IDENTIFIER  当前工程下的bundleID
# $EXPANDED_CODE_SIGN_IDENTITY 当前工程下的证书
#------------------------------



#资源路径
RESOURCE_PATH="${SRCROOT}/App"
TARGET_IPA_PATH="$RESOURCE_PATH/*.ipa"
TEMP_PATH="${SRCROOT}/Temp"

                                 

#文件夹创建
rm -rf "$TEMP_PATH"
mkdir -p "$TEMP_PATH"
mkdir  "$RESOURCE_PATH"



#------------------------------
#1.解压ipa到Temp/
unzip -oqq "$TARGET_IPA_PATH" -d "$TEMP_PATH"

#2.获取解压后的Temp/Payload/target.app (比如target就是你的.app名)
TEMP_PAYLOAD_APP_PATH=$(set -- "$TEMP_PATH/Payload/"*.app; echo "$1")

#------------------------------
#3.获取garget/Demo.app
TARGET_APP_PATH="$BUILT_PRODUCTS_DIR/$TARGET_NAME.app"

echo "ppppppppp= $TARGET_APP_PATH"

#4.删除Demo中的.app 也就是3步的.app 后重建
rm -rf "$TARGET_APP_PATH"
mkdir -p "$TARGET_APP_PATH"

#5.将2步的解压后的target.app下的所以内容 copy到工程下Products下（就是替换Demo.app为target.app）
cp -rf "$TEMP_PAYLOAD_APP_PATH/" "$TARGET_APP_PATH"


#------------------------------
#6.删除Extention和WatchApp(个人证书不能签名Extention)
rm -rf "$TARGET_APP_PATH/PlugIns"
rm -rf "$TARGET_APP_PATH/Watch"

#7.修改Plist的bundleID （xcode中的plist右键选择None 可以看到它真实的名字CFBundleIdentifier）
#用/usr/libexec/PlistBuddy工具  用法 "Set KEY Value" "目标文件路径"
/usr/libexec/PlistBuddy -c "Set CFBundleIdentifier $PRODUCT_BUNDLE_IDENTIFIER" "$TARGET_APP_PATH/Info.plist"

#------------------------------
#8.给Macho增加执行权限
#获取macho文件 路径
APP_Macho_BINARY=`plutil -convert xml1 -o - $TARGET_APP_PATH/Info.plist|grep -A1 Exec|tail -n1|cut -f2 -d\>|cut -f1 -d\<`
chmod +x "$TARGET_APP_PATH/$APP_Macho_BINARY"


#------------------------------
#9.重签名第三方的Frameworks (把里面所有的framework循环重签名)
TARGET_APP_FRAMEWORKS_PATH="$TARGET_APP_PATH/Frameworks"
# 不是所有的App都有FrameWork
if [ -d "$TARGET_APP_FRAMEWORKS_PATH"];
then
for FRAMEWORK in "$TARGET_APP_FRAMEWORKS_PATH/"*
do

#强制签名
/usr/bin/codesign --force --sign "$EXPANDED_CODE_SIGN_IDENTITY" "$FRAMEWORK"
done
fi















