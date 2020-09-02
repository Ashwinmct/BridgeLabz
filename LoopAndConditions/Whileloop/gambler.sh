#!/bin/bash -x
##A person starts gamblig with Rs 100 to reach the goal Rs 200 by bidding Rs 1 each time
##To simulate gambling and find she finaly wins or not and keep the track of win and loss
stake=100;
goal=200;
money=$stake;
loss=0;
win=0;
bet=0;
isWin=1;
while [ $money -lt $goal ] && [ $money -gt 0 ]
do
	gamble=$((RANDOM%2));
	if [ $gamble -eq $isWin ]
	then
		money=$((money+1));
		win=$((win+1));
	else
		money=$((money-1));
		loss=$((loss+1));
	fi;
	
done

#To find the Final result
if [ $money -eq $goal ]
then
	result="VICTORY";
else
	result="Defeated";
fi

echo "Number of bets won: $win";
echo "Number of loss: $loss";
echo "Final result is: $result";
