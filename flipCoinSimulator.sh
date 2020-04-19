#!/bin/bash -x
#Usecase 1
#Flip a coin and display Head or Tail

function flipCoin(){
	if [ $((RANDOM%2)) -eq "0" ]
	then
		#HEAD if genrated random number is even
		echo "H";
	else
		#TAIL if genrated random number is odd
		echo "T";
	fi
}

#Usecase 2
#flip coin for n times using loop
#store results in a dictionary
#find percentage of Singlets
declare -A results
isHead="H"
read -p "Enter number of times to flip the coin " n;
for (( i=0;i<n;i++ ))
do
	res="$( flipCoin )"
	results[$i]=$res;
	if [ "$res" == "$isHead" ]
	then
		heads=$((heads+1));
	else
		tails=$((tails+1));
	fi
done
echo ${results[@]};
echo "Heads=$heads";
echo "Tails=$tails";
echo "Percentage of Heads= `awk "BEGIN{print $((heads*100/n))}"`";
echo "Percentage of Tails= `awk "BEGIN{print $((tails*100/n))}"`";
