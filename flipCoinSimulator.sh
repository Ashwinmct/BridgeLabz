#!/bin/bash -x
#Usecase 1
#Flip a coin and display Head or Tail
if [ $((RANDOM%2)) -eq "0" ]
then
	#HEAD if genrated random number is even
	echo "HEAD";
else
	#TAIL if genrated random number is odd
	echo "TAIL";
fi
