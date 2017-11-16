#!/usr/bin/expect

set myMacPasswd "888"
set zipPasswd "123" 
 
spawn sudo zip -r -q -e -o name.zip myfile
 
expect {
 
     "Password"
     {
        send "$myMacPasswd\n"
         expect {

            "*Enter password*"
            {
                send "$zipPasswd\n"

                expect {

                    "Verify password"
                {
                    send "$zipPasswd\n"
                }
             }
           }
         }
     }
}


#
# 执行的时候看下是否有执行权限
# 用./nopasswd_zip.sh 执行
#
