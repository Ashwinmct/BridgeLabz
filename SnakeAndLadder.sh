#!/bin/bash -x
#This problem simulates a Snake and Ladder Game. The Player starts from 0 rolls the die to get a number between 1 to 6, 
#finds a safe place, ladder or a snake
#keeps doing till the winning spot 100 is achieved.

#UseCase 4
#Repeat till the Player reaches the winning position 100.

boardStarting=1
boardEnd=100


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

function rollDice()
{
	echo "$((1+(RANDOM%6)))";
}

function playGame()
{
	player1Position=$boardStarting;
	player2Position=$boardStarting;
	player1Count=0;
	player2Count=0;
	while [true]
	do
		player1Position="$( getPosition $player1position )"
		
		player2Position="$( getPosition $player2position )"
	done
}

#Usecase3
#The Player then checks for a Option.
#They are No Play, Ladder or Snake

#defining ladders and snakes position
declare -a ladderArray
declare -a snakeArray
for ((i=0;i<=boardEnd;i++))
do
	ladderArray[$i]=0;
	ladderArray[$i]=0;
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
	if [ $res -eq $noChange ]
	then
		result="$( checkArray $snakeArray $newPosition )";
	fi
	if [ $result -eq $noChange ]
	then
		echo $newPosition;
	else
		echo $result
	fi
}

function checkArray()
{
	local array=$1;
	local index=$2;
	local result=${array[index]};
	return result;


}
#maincode
startGame;
echo "$(rollDice)";
