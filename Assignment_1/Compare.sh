#!/bin/bash

if [[ "$1" > "$2" ]];
then 
  echo "$1 > $2"
elif [[ "$1" = "$2" ]]
then 
  echo "$2 = $1"
else [[ "$1" < "$2" ]]
  echo "$2 > $1" 
fi