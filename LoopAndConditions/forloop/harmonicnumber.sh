#!/bin/bash -x
read -p "Enter n th term of harmonic you want to find " n;
h=0;
if [ $n -gt 0 ]
then
	for ((i=1;i<=n;i++))
	do
		term=`awk " BEGIN{print ((1/$i))}"`;
		h=`awk " BEGIN{print (($h+$term))}"`;
	done
fi;
echo "$n th term of Harmonic Number = $h";
