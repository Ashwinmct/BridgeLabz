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
	if [ "$res" == "$isHead" ]
	then
		heads=$((heads+1));
	else
		tails=$((tails+1));
	fi
done
singlets[H]=`awk "BEGIN{print $((heads*100/n))}"`";
singlets[T]=`awk "BEGIN{print $((tails*100/n))}"`";



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
doublets[HH]=`awk "BEGIN{print $((hh*100/n))}"`";
doublets[TT]=`awk "BEGIN{print $((tt*100/n))}"`";
doublets[HT]=`awk "BEGIN{print $((ht*100/n))}"`";
doublets[TH]=`awk "BEGIN{print $((th*100/n))}"`";

#Usecase 4
#flip coin for n times using loop
#store Triplets in a dictionary
#find percentage of Singlets
declare -A triplets
hhh=0
hht=0
hth=0
htt=0
thh=0
tht=0
tth=0
ttt=0
for (( i=0;i<n;i++ ))
do
	res="$( flipCoin )""$( flipCoin )""$( flipCoin )";
	case $res in
		"HHH")
			hhh=$((hhh+1));
			;;
		"HHT")
			hht=$((hht+1));
			;;
		"HTH")
			hth=$((hth+1));
			;;
		"HTT")
			htt=$((htt+1));
			;;
		"THH")
			thh=$((thh+1));
			;;
		"THT")
			tht=$((tht+1));
			;;
		"TTH")
			tth=$((tth+1));
			;;
		"TTT")
			ttt=$((ttt+1));
			;;
	esac
done
triplets[HHH]=`awk "BEGIN{print $((hhh*100/n))}"`";
triplets[TTH]=`awk "BEGIN{print $((tth*100/n))}"`";
triplets[HTH]=`awk "BEGIN{print $((hth*100/n))}"`";
triplets[THH]=`awk "BEGIN{print $((thh*100/n))}"`";
triplets[HHT]=`awk "BEGIN{print $((hht*100/n))}"`";
triplets[TTT]=`awk "BEGIN{print $((ttt*100/n))}"`";
triplets[HTT]=`awk "BEGIN{print $((htt*100/n))}"`";
triplets[THT]=`awk "BEGIN{print $((tht*100/n))}"`";


