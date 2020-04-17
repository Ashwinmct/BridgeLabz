#!/bin/bash -x
read -p "Enter Number to find it is PRIME or NOT " number;
isPrime="YES";
rem=0;
for ((i=2;i<number;i++))
do
	if [ $((number%i)) -eq $rem ]
	then
		isPrime="NO";
		break;
	fi;
done
echo "$number is prime, $isPrime";
