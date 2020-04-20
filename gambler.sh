#!/bin/bash -x
stake=100;
goal=200;
isWin=1;
days=100

#Use case4
#After 20 days of playing every day would like to know the total amount won or lost.
#Hence storing the value of each day in array
index=0
profitArray[((index++))]=0; #for 0th day result
lossArray[((0))]=0;
for ((i=0;i<days;i++))
do
	money=$stake;
	lowlimit=`awk "BEGIN{print ($stake*(0.5))}"`
	hilimit=`awk "BEGIN{print (($stake+$lowlimit))}"`
	while (( `awk "BEGIN{print (($money<$hilimit))}"` )) && ((`awk "BEGIN{print (( $money > $lowlimit ))}"`))
	do
		gamble=$((RANDOM%2));
		if [ $gamble -eq $isWin ]
		then
			money=$((money+1));
		else
			money=$((money-1));
		fi;
	done
	if [ $money -eq 0]
	then
		lossArray[((index++))]=$lowlimit
		stake=$((stake-lowlimit));
	else
		profitArray[((index++))]=$hilimit;
		stake=$((stake+lowlimit));
	fi
done


