#!/bin/bash -x
##Use case 1
##A person starts gamblig with Rs 100 to reach the goal Rs 200 by bidding Rs 1 each time
##To simulate gambling and find she finaly wins or not and keep the track of win and loss
stake=100;
goal=200;
isWin=1;

#Usecase 2
#A gambler bets $1 so  either win or loose $1
days=100

#Use case3
#resign for the day if won or lost than half of the stack
#As a Calculative Gambler if won or lost 50% of the stake, would resign for the day
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
		stake=$((stake-lowlimit));
	else
		stake=$((stake+lowlimit));
	fi
done

