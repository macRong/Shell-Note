#!/bin/sh

SUM=0

for i in {0..100..2}
do 
	SUM=$(( $SUM+i ))
done

echo $SUM
