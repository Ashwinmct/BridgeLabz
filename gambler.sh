#!/bin/bash -x
stake=100;
goal=200;
isWin=1;
days=30 #average days per month
daysWon=0;
daysLost=0;
totalProfit=0;
totalLoss=0;

#Use case5
#Each month would like to know the days won and lost and by how much.
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
		daysLost=$((daysLost+1));
		totalLoss=$((totalLoss+lowlimit));
	else
		profitArray[((index++))]=$hilimit;
		stake=$((stake+lowlimit));
		daysWon=$((daysWon+1));
		totalProfit=$((totalProfit+lowlimit));
	fi
done


