#!/bin/bash
#
#Author:macRong
#Create Date:2017.11.19
# An example hook script to prepare the commit log message.
# Called by "git commit" with the name of the file that has the
# commit message, followed by the description of the commit
# message's source.  The hook's purpose is to edit the commit
# message file.  If the hook fails with a non-zero status,
# the commit is aborted.
#
# To enable this hook, rename this file to "prepare-commit-msg".

# This hook includes three examples.  The first comments out the
# "Conflicts:" part of a merge commit.
#
# The second includes the output of "git diff --name-status -r"
# into the message, just before the "git status" output.  It is
# commented because it doesn't cope with --amend or with squashed
# commits.
#
# The third example adds a Signed-off-by line to the message, that can
# still be edited.  This is rarely a good idea.

COMMIT_EDITMSG=$1
MSG=`cat $COMMIT_EDITMSG`
MSG_AHEAD=`echo $MSG | cut -d ':' -f 1`

MSGTYPE=$2

COMMIT_MSG_Standard=("add:" "change:" "del:" "fix:")

function arr_contain()
{
  local arr=`echo "$1"`
  local temp_value

  for temp_value in ${arr[*]}; do
    if test "$2" == "$temp_value"; then
      echo true
      return
    fi
  done

  echo false
}

function hookMessage() {

	case $MSGTYPE in 
		message)

		local confiuserName=`git config user.name`
		local errorLog="你的提交信息不规范❌"
		local colorEoorUserName=`echo -e "\033[41;36m $confiuserName \033[0m"`
		local colorSuccessUserName=`echo -e "\033[42;37m $confiuserName \033[0m"`


		# if [[  ${COMMIT_MSG_Standard[@]} =~ "$MSG_AHEAD:" ]]; then
		# 	contain="YES"
		# else
		# 	contain="NO"
		# fi

		# if echo "${COMMIT_MSG_Standard[@]}" | grep -w "$MSG_AHEAD" &>/dev/null; then
		# 	contain="YES"
		# else
		# 	contain="NO"
		# fi
		commit_arr=`echo ${COMMIT_MSG_Standard[*]}`
		log=`arr_contain "$commit_arr" "$MSG_AHEAD:"`

		contain=$log

		if $contain; then

			#statements
			echo
			echo "$colorSuccessUserName  ✅"
			echo
			exit 0
		else
			echo
			echo Hi $colorEoorUserName $errorLog
			echo 
cat << EOF
================= 请务必遵循下面规范 ================
   ${COMMIT_MSG_Standard[0]}    ✅
   ${COMMIT_MSG_Standard[1]}    ✅
   ${COMMIT_MSG_Standard[2]}    ✅
   ${COMMIT_MSG_Standard[3]}    ✅
====================================================
EOF
			echo
			exit 1
		fi
	 ;;
    esac

}

hookMessage


case "$2,$3" in
  merge,)
    /usr/bin/perl -i.bak -ne 's/^/# /, s/^# #/#/ if /^Conflicts/ .. /#/; print' "$1" ;;

# ,|template,)
#   /usr/bin/perl -i.bak -pe '
#      print "\n" . `git diff --cached --name-status -r`
#	 if /^#/ && $first++ == 0' "$1" ;;

  *) ;;
esac

# SOB=$(git var GIT_AUTHOR_IDENT | sed -n 's/^\(.*>\).*$/Signed-off-by: \1/p')
# grep -qs "^$SOB" "$1" || echo "$SOB" >> "$1"

