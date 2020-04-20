#!/bin/bash -x
#This problem simulates a Snake and Ladder Game. The Player starts from 0 rolls the die to get a number between 1 to 6, finds a safe place, ladder or a snake keeps doing till the winning spot 100 is achieved.

##funtions
#Use Case 1
#Snake and Ladder game played with single player at start position 0

function startGame()
{
	printf "WELCOME TO THE SNAKE AND LADDERS GAME\n"
	#Display board
	displayBoard;
}

function displayBoard(){
	local rowlength=10;
	local columndepth=10;
	local position=100;
	printf "\nBoards starting At 0"
	printf "\nBoard Layout \n=============  "
	for ((i=0;i<$rowlength;i++))
	do
		for ((j=0;j<$columndepth;j++))
		do
			printf "$position ";
			position=$((position-1));
		done
		printf "\n";
		if [ $position -eq 1 ]
		then
			break;
		fi
	done
	printf "\nBoard ends at 1"
}

#UseCase 2
#The Player rolls the die to get a number between 1 to 6.
function rollDice()
{
	echo "$((1+(RANDOM%6)))";
}
#maincode
startGame;
echo "$(rollDice)";
