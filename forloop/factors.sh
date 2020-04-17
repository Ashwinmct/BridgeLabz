#!/bin/bash -x
#To find prime numbers in the range
read -p "Enter the number to find its factor " number;
high=number;
rem=0;
count=0;


#To find 2's in given number
while [ $((number%2)) -eq $rem ]
do
	factors[((count++))]="2";
	number=$((number/2));
done

#To find odd factors
for ((i=3;i<=number;i=i+2))
do
	while [ $((number%i)) -eq $rem ]
	do
		factors[((count++))]=$i;
		number=$((number/i));
	
	done

done

#for entered number is '1'
factors[((count++))]="1";

echo "factors of $high:"
echo ${factors[@]};
