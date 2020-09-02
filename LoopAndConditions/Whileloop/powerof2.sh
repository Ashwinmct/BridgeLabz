#!/bin/bash -x
##to print table of power of 2 upto 256
read  -p "Enter the number of terms you want to print: " n;
i=0;
term=1;
limit=256;
power=2;
echo "n 2^n";
while [ $i -lt $((n+1)) ]
do
	term=$((term*power));
	echo "$i $term";
	i=$((i+1));
	if [ $term -eq $limit ]
	then
		echo "Sorry, You reached the limit";
		break;
	fi;
done
