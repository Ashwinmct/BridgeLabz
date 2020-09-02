#!/bin/bash -x
declare -a board
user="X"
computer="O"
Rows=3;
Columns=3;
emptyCell="_";
player1=$emptyCell;
player2=$emptyCell;
winner=$emptyCell;
userInput=$emptyCell;
computerInput=$emptyCell;
input=$emptyCell;
position=$emptyCell;

function resetBoard() {
	for ((i=0;i<9;i++))
	do
		board[$i]=$emptyCell;
	done
}

function setPlayers()
{	echo "Player is '$user' and Computer will be '$computer'"
	for ((i=0;i<9;i++))
	do
		board[$i]=$i;
	done
	printf "\nEnter position as shown below "
	printBoard;
	resetBoard;
}

function tossGame()
{
	if ((RANDOM%2==1))
	then
		player1=$user;
		player2=$computer;
	else
		player1=$computer;
		player2=$user;
	fi
}

function printBoard() {
	printf "\nBoard:"
	printf "\n${board[0]}||${board[1]}||${board[2]}"
	printf "\n== == =="
	printf "\n${board[3]}||${board[4]}||${board[5]}"
	printf "\n== == =="
	printf "\n${board[6]}||${board[7]}||${board[8]}"
}

function checkWinner()
{
	local middleCell=4;
	local noWinner=-1;
	#checkRows
	for ((row=0;row<Rows;row++))
	do
		if [ "${board[((3*row))]}" != $emptyCell ] && [ "${board[((3*row))]}" = "${board[(((3*row)+1))]}" ] && [ "${board[(((3*row)+1))]}" = "${board[(((3*row)+2))]}" ]
		then
			winner=$((3*row));
		fi
	done

	#checkColumns
	for ((column=0;column<Columns;column++))
	do
		if [ "${board[((column))]}" != $emptyCell ] && [ "${board[((column))]}" = "${board[(((column)+3))]}" ] && [ "${board[(((column)+3))]}" = "${board[(((column)+6))]}" ]
		then
			winner=$((column));
		fi
	done

	#check Principal Diagonal
	if [ "${board[4]}" != $emptyCell ] && [ "${board[0]}" = "${board[4]}" ] && [ "${board[0]}" = "${board[8]}" ]
	then
		winner=$middleCell;
	fi
	#check Secondary Diogonal
	if [ "${board[4]}" != $emptyCell ] && [ "${board[2]}" = "${board[4]}" ] && [ "${board[6]}" = "${board[4]}" ]
	then
		winner=$middleCell;
	fi
	winner=$noWinner;
}

function callWinner()
{
	winner=$1;
	if [ $winner -eq $computer ]
	then
		printf "\n Computer Won the match"
	else
		printf "\n You won the match"
	fi
}

function getInput()
{	local player="$1"
	if [ "$player" == "$user" ]
	then
		getUserInput;
	else
		getComputerInput;
	fi
}

function getUserInput()
{
	read -p "Enter position you want to insert " position;
	if [ "${board[$position]}" = $emptyCell ]
	then
		input=$position;
	else
		printf "\nEntered position already taken";
		getUserInput;
	fi

}

function getComputerInput()
{
	local corners=( 0 2 6 8 );
	local center=4;
	local sides=( 1 3 5 7 );

	position=$emptyCell;
	checkMove $computer;
	if [ $position = $emptyCell ]
	then
		checkMove $user;
	fi;
	if [ $position != $emptyCell ]
	then
		return;
	fi;
	#check for corners
	for cell in ${corners[@]}
	do
		if [ ${board[$cell]} == $emptyCell ]
		then
			input=$cell;
			return;
		fi
	done
	#check the center
	if [ ${board[$center]} == $emptyCell ]
	then
		input=$center;
		return
	fi
	#check the available sides
	for cell in ${sides[@]}
	do
		if [ ${board[$cell]} == $emptyCell ]
		then
			input=$cell;
			return
		fi
	done
}

function checkMove(){
	local player="$1";
	checkRows $player;
	checkColumns $player;
	checkDiagonal1 $player;
	checkDiagonal2 $player;
}

function checkRows()
{	local player="$1";
	for ((row=0;row<Rows;row++))
	do
		cell1=$((3*row));
		cell2=$((3*row+1));
		cell3=$((3*row+2));
		if [ "${board[cell1]}" = "${board[cell2]}" ] && [ "${board[cell3]}" = $emptyCell ] && [ "${board[cell1]}" = $player ]
		then
			position=$cell3;
			return;
		elif [ "${board[cell1]}" = "${board[cell3]}" ] && [ "${board[cell2]}" = $emptyCell ] && [ "${board[cell1]}" = $player ]
		then
			position=$cell2;
			return;
		elif [ "${board[cell3]}" = "${board[cell2]}" ] && [ "${board[cell1]}" = $emptyCell ] && [ "${board[cell2]}" = $player ]
		then
			positon=$cell1;
			return;
		fi
	done
}

function checkColumns()
{
	local player="$1";
	for ((columm=0;column<Columns;column++))
	do
		cell1=$((column));
		cell2=$((column+3));
		cell3=$((column+6));
		if [ "${board[cell1]}" = "${board[cell2]}" ] && [ "${board[cell3]}" = $emptyCell ] && [ "${board[cell1]}" = $player ]
		then
			position=$cell3;
			return;
		elif [ "${board[cell1]}" = "${board[cell3]}" ] && [ "${board[cell2]}" = $emptyCell ] && [ "${board[cell1]}" = $player ]
		then
			position=$cell2;
			return;
		elif [ "${board[cell3]}" = "${board[cell2]}" ] && [ "${board[cell1]}" = $emptyCell ] && [ "${board[cell2]}" = $player ]
		then
			positon=$cell1;
			return;
		fi
	done

}

function checkDiagonal1()
{
	local player="$1";
	cell1=0;
	cell2=4;
	cell3=8;
	if [ "${board[cell1]}" = "${board[cell2]}" ] && [ "${board[cell3]}" = $emptyCell ] && [ "${board[cell1]}" = $player ]
	then
		position=$cell3;
		return;
	elif [ "${board[cell1]}" = "${board[cell3]}" ] && [ "${board[cell2]}" = $emptyCell ] && [ "${board[cell1]}" = $player ]
	then
		position=$cell2;
		return;
	elif [ "${board[cell3]}" = "${board[cell2]}" ] && [ "${board[cell1]}" = $emptyCell ] && [ "${board[cell2]}" = $player ]
	then
		positon=$cell1;
		return;
	fi
}

function checkDiagonal2()
{
	local player="$1";
	cell1=2;
	cell2=4;
	cell3=6;
	if [ "${board[cell1]}" = "${board[cell2]}" ] && [ "${board[cell3]}" = $emptyCell ] && [ "${board[cell1]}" = $player ]
	then
		position=$cell3;
		return;
	elif [ "${board[cell1]}" = "${board[cell3]}" ] && [ "${board[cell2]}" = $emptyCell ] && [ "${board[cell1]}" = $player ]
	then
		position=$cell2;
		return;
	elif [ "${board[cell3]}" = "${board[cell2]}" ] && [ "${board[cell1]}" = $emptyCell ] && [ "${board[cell2]}" = $player ]
	then
		positon=$cell1;
		return;
	fi
}

function playGame()
{	local count=9;
	local even=0;
	local noWinner=-1;
	local flag=$noWinner;
	printf "Welcome to the TicTacToe !"
	resetBoard;
	setPlayers;
	tossGame;
	for ((turn=0;turn<count;turn++))
	do
		if [ $((turn%2)) -eq $even ]
		then
			getInput $player1;
			board[$input]=$player1;
		else
			getInput $player2;
			board[$input]=$player2;
		fi
		printBoard;
		checkWinner;
		if [ "$winner" != "$noWinner" ]
		then
			flag=$winner;
			callWinner ${board[winner]};
			break;
		fi
	done
	if [ $flag -eq $noWinner ]
	then
		echo "Match Draw";
	fi
}

#main code

playGame;
