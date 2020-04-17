#!/bin/bash -x
#To find magicnumber

echo  "Think number between 1 to 100 " 
start=1;
end=100;
function luckyNumber()
{	local lo=$1;
	local hi=$2;
	if [ $lo -eq $hi ]
	then
		echo "Your number is $hi ";
	else
		isCorrect=1;
		mid=$((lo+((hi-lo)/2)));
		read -p "Is your number is less then or equal to $mid Enter 1 if  yes or 0 if no " usrinput;
		if [ $usrinput -eq $isCorrect ]
		then
			$( luckyNumber $lo $mid );
		else
			$( luckyNumber $((mid+1)) $hi );
		fi
	fi;
}

 luckyNumber $start $end ;
