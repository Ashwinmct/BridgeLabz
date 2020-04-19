#!/bin/bash -x
#Usecase 1
#Flip a coin and display Head or Tail

function flipCoin(){
	if [ $((RANDOM%2)) -eq "0" ]
	then
		echo "H";
	else
		echo "T";
	fi
}

#Usecase 2
#flip coin for n times using loop
#store singlets in a dictionary
#find percentage of Singlets
declare -A singlets
isHead="H"
read -p "Enter number of times to flip the coin " n;
for (( i=0;i<n;i++ ))
do
	res="$( flipCoin )"
	singlets[$i]=$res;
	if [ "$res" == "$isHead" ]
	then
		heads=$((heads+1));
	else
		tails=$((tails+1));
	fi
done
echo "Generated Singlets:"
echo ${singlets[@]};
echo "Percentage of Singlets";
echo "Percentage of Heads= `awk "BEGIN{print $((heads*100/n))}"`";
echo "Percentage of Tails= `awk "BEGIN{print $((tails*100/n))}"`";



#Usecase 3
#flip coin for n times using loop
#store doublets in a dictionary
#find percentage of Singlets
declare -A doublets
hh=0
ht=0
th=0
tt=0
for (( i=0;i<n;i++ ))
do
	res="$( flipCoin )""$( flipCoin )"
	doublets[$i]=$res;
	case $res in
		"HH")
			hh=$((hh+1));
			;;
		"HT")
			ht=$((ht+1));
			;;
		"TH")
			th=$((th+1));
			;;
		"TT")
			tt=$((tt+1));
			;;
	esac
done
echo "Generated doublets:"
echo ${doublets[@]};
echo "HH=$hh HT=$ht TH=$th TT=$tt"
echo "Percentage of HH= `awk "BEGIN{print $((hh*100/n))}"`";
echo "Percentage of TT= `awk "BEGIN{print $((tt*100/n))}"`";
echo "Percentage of HT= `awk "BEGIN{print $((ht*100/n))}"`";
echo "Percentage of TH= `awk "BEGIN{print $((th*100/n))}"`";


