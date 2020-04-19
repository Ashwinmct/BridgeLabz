#!/bin/bash -x

##Use case 1
##A person starts gamblig with Rs 100 to reach the goal Rs 200 by bidding Rs 1 each time
##To simulate gambling and find she finaly wins or not and keep the track of win and loss
stake=100;
goal=200;
isWin=1;
money=$stake;
while [ $money -lt $goal ] && [ $money -gt 0 ]
do
		gamble=$((RANDOM%2));
		if [ $gamble -eq $isWin ]
		then
			money=$((money+1));
		else
			money=$((money-1));
		fi;
done
if [ $money -eq $goal ]
then
	echo "You WON";
else
	echo "YOU LOST";
fi



