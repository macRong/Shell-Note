#!/usr/bin/expect
 
set myMacPasswd "888"
set zipPasswd "123"
 
 
spawn sudo zip -r -q -e -o myfile.zip myfile
 
expect {
 
	"Password" 
	{
		send "$myMacPasswd\n"
		
		expect {
 
			"*Enter password*" 
			{
				send "$zipPasswd\n"
				expect {
					"*Verify password*"
					{
				     	send "$zipPasswd\n"
					}
				}
			}
		}
	}
}
