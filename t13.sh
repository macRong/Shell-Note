#!/bin/bash
/*
sum=0

for(( i=0; i<=100; i++ ))
do
	if test $((i%2==0))  
	then
		let sum=sum+i
	fi
done

echo $sum
*/

SUM=0
i=0

while [[ "$i" -le 100 ]]
do
	SUM=$(( $SUM+i ))
	i=$((i+2))
done
echo $SUM
