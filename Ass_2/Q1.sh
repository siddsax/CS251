#!/bin/bash
# store the variables 

echo "Type the value of number of students, followed by [ENTER]:"
read n
echo "Type the value of number of TAs, followed by [ENTER]:"
read m
# echo "Type the file name, followed by [ENTER]:"
# echo "Type the value of number of days, followed by [ENTER]:"
# read d
echo "Type the percent of student on day 1, followed by [ENTER]:"
read d1per
echo "Type the percent of student on day 2, followed by [ENTER]:"
read d2per
# echo "Type the starting time , followed by [ENTER]:"
# read t
# echo "Type the time per student, followed by [ENTER]:"
# read g

# read f
# grep -n "^[0-9]" $f | cut -d : -f1

# break 'n' in 2 parts
days=2
std_per_day=()
TA_per_day=()
stud_per_ta=()
stud_list_daywise=()
TAs_list_daywise=()
students="$(seq $n)"
randomized_list="$(shuf -e $students)"
TAs="$(seq $n)"
randomized_TAs="$(shuf -e $TAs)"

for d in $days;do
	TA_per_day+="$(echo $m'*'$dayweight[d]'/'100 | bc )"
	std_per_day+="$(echo $n'*'$dayweight[d]'/'100 | bc )"
  stud_per_ta+="$(echo $std_per_day[d]'/'$TA_per_day[d] | bc )"
  stud_list_daywise+="$(echo "${students[@]:$std_per_day[d]*(d-1):$std_per_day[d]*(d)}")"
  TAs_list_daywise+="$(echo "${TAs[@]:$TA_per_day[d]*(d-1):TA_per_day[d]*(d)}")"
done	 


stud_d1="$(echo "${students[@]:0:$d1}")"
stud_d2="$(echo "${students[@]:$d1+1:$n}")"	

stud_d1_rand="$(shuf -e $stud_d1)"
stud_d2_rand="$(shuf -e $stud_d2)"

TA_alloc=()
for d in $days;do
  stud_list_daywise[d]="$(shuf -e $stud_list_daywise[d])"
  for i in $t1;do
  	TA_alloc="$(echo "${stud_d1_rand[@]:(i-1)*($stud_per_ta_1):(i)*($stud_per_ta_1)}")"

# pick the required students from day 1
# output it 
# divide TAs with the same weights
# for a given day, allocate number of TAs required
# divide students for each ta
# pick randomly that many tas