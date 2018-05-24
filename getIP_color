#!/bin/bash

who=`whoami`
log=`echo "\033[41;36m $who \033[0m"`

net=`ifconfig en0 | grep -w "inet" | cut -c 6-21`
backlog=`echo "\033[1m $net \033[0m"`
cat << EOF
---------------------------------------------------------------
 Hi $log Your net IP is: $backlog ✅
---------------------------------------------------------------
EOF


