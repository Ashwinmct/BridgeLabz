#!/bin/bash -x

#To Generate Random Number
function getRandomNumber(){
for ((i=0;i<3;i++))
	do
		sum+=$((RANDOM%10));
	done
	echo $sum;
}


#To Store Random Numbers
for((i=0;i<5;i++))
do
	randomNumbers[ $i ]="$( getRandomNumber )";
done
#to find minimum and maximum
min=${randomNumbers[ 0 ]};
max=${randomNumbers[ 0 ]};
for i in "${randomNumbers[@]}"
do
	if [ "$i" -lt $min ]
	then
		min=$i; 
	fi;
	if [ "$i" -gt $max ]
	then	
		max="$i";
	fi;
done

echo "Generated random Numbers are :${randomNumbers[@]}";
echo "maximum=$max";
echo "minimum=$min";

