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
llimit=`awk "BEGIN{print ($stake*(0.5))}"`
hlimit=`awk "BEGIN{print (($stake+$llimit))}"`

#Use case 4
#After 20 days he want no total ammount that he won or lost
won=0
loss=0
for ((i=0;i<days;i++))
do
	money=$stake;
	while [ $money -lt $hlimit ] && [ $money -gt $llimit ]
	do
		gamble=$((RANDOM%2));
		if [ $gamble -eq $isWin ]
		then
			money=$((money+1));
		else
			money=$((money-1));
		fi;
	done
	if [ $money -eq $hlimit ]
	then
		won=$((won+1));
	else
		loss=$((loss+1));
	fi;
done
echo "Total Ammount won=$((won*llimit))";
echo "Total Ammount lost=$((loss*llimit))";

