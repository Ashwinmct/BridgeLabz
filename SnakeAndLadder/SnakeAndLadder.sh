#!/bin/bash -x
#This problem simulates a Snake and Ladder Game. The Player starts from 0 rolls the die to get a number between 1 to 6, 
#finds a safe place, ladder or a snake
#keeps doing till the winning spot 100 is achieved.

#UseCase 7
#Play the game with 2 Player and report which Player won the game

boardStarting=1
boardEnd=100


function startGame()
{
	printf "WELCOME TO THE SNAKE AND LADDERS GAME\n"
	#Display board
	displayBoard;
	playGame;
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

function rollDice()
{
	echo "$((1+(RANDOM%6)))";
}

function playGame()
{
	player1Position=$boardStarting;
	player2Position=$boardStarting;
	diceCount=0;
	while [true]
	do
		#player 1
		player1Position="$( getPosition $player1position )"
		diceCount=$((diceCount+1));
		printf "\nPlayer 1 position=$player1Position"
		#player2
		player2Position="$( getPosition $player2position )"
		diceCount=$((diceCount+1));
		printf "\nPlayer 1 position=$player1Position"
		#winning condition
		if [ $player1Position -eq $boardEnd ]
		then
			printf "Player 1 Won"
			printf "Total Dice Count =$diceCount"
			break;
		else if [ $player2Position -eq $boardEnd ]
		then
			printf "Player 1 Won"
			printf "Total Dice Count =$diceCount"
			break;
		fi
	done
}

#Values of snakes and ladders
declare -a ladderArray
declare -a snakeArray
for ((i=0;i<=boardEnd;i++))
do
	ladderArray[$i]=0;
	snakeArray[$i]=0;
done
ladderArray[1]=38
ladderArray[4]=14
laddderArray[8]=30;
ladderArray[21]=42;
ladderArray[28]=76;
ladderArray[50]=67;
ladderArray[71]=92;
ladderArray[80]=99;

snakeArray[32]=10
snakeArray[36]=6
snakeArray[48]=26
snakeArray[62]=18
snakeArray[88]=24
snakeArray[95]=56
snakeArray[97]=78


function getPosition()
{
	local noChange=0;
	local oldPosition=$1;
	local diceValue="$( rollDice )"
	newPosition=$((oldPosition+diceValue));
	result="$( checkArray $ladderArray $newPosition )";
	if [ $result -eq $noChange ]
	then
		result="$( checkArray $snakeArray $newPosition )";
	fi
	if [ $result -eq $noChange ]
	then
		result=$newPosition;
	fi
	if [ $result -gt $boardEnd ]
	then
		result=$boardEnd;
	fi
	echo $result;
}

function checkArray()
{
	local array=$1;
	local index=$2;
	local result=${array[index]};
	return result;


}
#maincode
read -p "Do you want to play 2Player Snake And Ladder Game.\n If YES enter 1 " choice;
isYes=1;
if [ $choice -eq $isYes ]
then
	startGame;
fi
