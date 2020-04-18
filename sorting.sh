#!/bin/bash -x
#usecase1
read -p "Enter first number " a;
read -p "Enter Second number" b;
read -p "Enter Third Number "  c;
#usecase2
#To compute a+b*c
result1=$((a+b*c));
#usecase 3
result2=$((a*b+c));

