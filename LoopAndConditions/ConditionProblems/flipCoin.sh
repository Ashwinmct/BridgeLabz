#!/bin/bash -x
isHead=1;
read -p "Enter No of times to Flip the Coin " count;
for ((i=1;i<=count;i++))
do
	if [ $((RANDOM%2)) -eq $isHead ]
	then
		echo " Heads";
	else
		echo " Tails";
	fi;
done
