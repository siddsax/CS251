#!/bin/bash
echo "Type the value of number of students, followed by [ENTER]:"
read n
echo "Type the value of number of TAs, followed by [ENTER]:"
read m
echo "Type the value of number of days, followed by [ENTER]:"
read d
echo "Type the file name, followed by [ENTER]:"
read f
grep -n "^[0-9]" $f | cut -d : -f1
# store the variables 
# break 'n' in 2 parts
# pick the required students from day 1
# output it 
# divide TAs with the same weights
# for a given day, allocate number of TAs required
# divide students for each ta
# pick randomly that many tas