#!/bin/bash -x

function findMax(){
	local array=$1;
	local max=0;
	local index=0;
	for i in "${array[@]}"
	do
		if [ $i -gt $max ]
		then
			max=$i;
			index="{! i }";
		fi;
	done
	echo $index;
}

#main code
stake=100;
goal=200;
isWin=1;
days=30 #average days per month
daysWon=0;
daysLost=0;
totalProfit=0;
totalLoss=0;

#Use case 7
#If won would like to continue playing next month or stop Gambling 


function simulateGambling(){
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
	echo "LuckiestDay of month=$( findMax $profitArray )";
	echo "UnluckiestDay of month=$( findMax $lossArray )";
	#to determine wheather to play for next month or not
	if [ $totalLoss -lt $totalProfit ]
	then
		$( simulateGambling );
	fi

}

$( simulateGambling );
