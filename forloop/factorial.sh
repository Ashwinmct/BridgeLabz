#!/bin/bash -x
#To find factorial of given number using for loop
read -p "Enter the number to find Factorial " n;
factorial=1;
if [ $n -gt 0 ]
then
	for ((i=1;i<=n;i++))
	do
		factorial=$((factorial*i));
	done
fi;
echo "factorial of $n = $factorial";
