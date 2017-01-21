#!/bin/bash
if [[ $# != 2 ]];then 
	echo "You have entered less or more than 2 numbers"
	exit 1
fi

case $1 in
    ''|*[!0-9]*) echo $1 is not a number ;;
esac

case $2 in
    ''|*[!0-9]*) echo $2 is not a number ;;
esac
var_1="$(echo $1'>'$2 | bc -l)"
var_2="$(echo $1'<'$2 | bc -l)"
if (( "$var_1" == 1 ))
then 
  echo "$1 > $2"
elif (( "$var_2" == 1 ))
then 
  echo "$1 < $2"
else 	
  echo "$2 = $1" 
fi