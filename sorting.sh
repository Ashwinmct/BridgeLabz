#!/bin/bash -x
#usecase1
read -p "Enter first number " a;
read -p "Enter Second number " b;
read -p "Enter Third Number "  c;

#dictionary to store file
declare -A results

#usecase 2
#To compute a+b*c
result1=$((a+b*c));
results[computation1]=$result1;
#usecase 3
#To complete a*b+c
result2=$((a*b+c));
results[computation2]=$result2;
#Usecase 4
#To complete  c+a/b
result3=`awk "BEGIN{print $((c+(a/b)))}"`;
results[computation3]=$result3;
#Use case 5 
#To compute a%b+c
result4=$((a%(b+c)));
results[computation4]=$result4;
#Usecase 6
#Adding result to dictionary

#Usecase 7
#To read the value from dictionary into the array
count=0;
for i in ${results[@]}
do
	resultArray[((count++))]=$i;
done
#usecase 8
#Sort the array in decending order
for ((i=0;i<3;i++))
do
	for ((j=i+1;j<4;j++))
	do
		if ((${resultArray[i]} < ${resultArray[j]}))
		then
			#swaping
			temp=${resultArray[$j]};
			resultArray[$j]=${resultArray[$i]};
			resultArray[$i]=$temp;
		fi
	done
done
echo "Array in Decending order:";
echo ${resultArray[@]};

#use case 8
#Sort array in ascending
for ((i=0;i<3;i++))
do
	for ((j=i+1;j<4;j++))
	do
		if ((${resultArray[i]} > ${resultArray[j]}))
		then
			#swaping
			temp=${resultArray[$j]};
			resultArray[$j]=${resultArray[$i]};
			resultArray[$i]=$temp;
		fi
	done
done
echo "Array in Ascending Order:";
echo ${resultArray[@]};
