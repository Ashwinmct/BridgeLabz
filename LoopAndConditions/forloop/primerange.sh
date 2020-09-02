#!/bin/bash -x
#To find prime numbers in the range
read -p "Enter lower limit of range " low;
read -p "Enter Higher limit of range " high;
rem=0;
flag=1;
count=0;
for ((i=low;i<=high;i++))
do
	isPrime=0;
	for ((j=2;j<i;j++))
	do
		if [ $((i%j)) -eq $rem ]
		then
			isPrime=$flag;
			break;
		fi;
	done
	if [ $isPrime -eq 0 ]
	then
		prime[((count++))]=$i;
	fi;
done
echo ${prime[@]};

