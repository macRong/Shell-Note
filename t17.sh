#!/bin/bash

fun(){
	echo "Enter Your num.:"

	read num
	return $num
}

fun

echo "你输入的是:$?"
