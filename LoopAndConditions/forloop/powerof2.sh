#!/bin/bash -x
#To find and print the values 2 and it's powers in table
read -p "Enter the n value " n;
printf "n 2^n"
for ((i=1;i<=n;i++))
do
	product=1;
	for ((j=0;j<n;j++))
	do
		product=$((product*2));
	done
	echo "$i $product";
done
