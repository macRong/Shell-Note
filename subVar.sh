#!/bin/bash

string="This is shengshui.com"

funtfist(){
	echo ${string%ui*}
}

funtwo(){
    echo ${string%%is*}
}

funtwo
