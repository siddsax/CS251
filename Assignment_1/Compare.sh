#!/bin/bash
if [[ $# != 2 ]];then 
	echo "You have entered less or more than 2 numbers"
	exit 1
fi
if [[ "$1" > "$2" ]];
then 
  echo "$1 > $2"
elif [[ "$1" = "$2" ]]
then 
  echo "$2 = $1"
else [[ "$1" < "$2" ]]
  echo "$1 < $2" 
fi