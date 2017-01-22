#!/bin/bash
# store the variables 

# echo "Type the value of number of students, followed by [ENTER]:"
# read n
# echo "Type the value of number of TAs, followed by [ENTER]:"
# read m
# # echo "Type the file name, followed by [ENTER]:"
# # echo "Type the value of number of days, followed by [ENTER]:"
# # read d
# echo "Type the percent of student on day 1, followed by [ENTER]:"
# read d1per
# echo "Type the percent of student on day 2, followed by [ENTER]:"
# read d2per
# echo "Type the starting time , followed by [ENTER]:"
# read t
# echo "Type the time per student, followed by [ENTER]:"
# read g

# read f
# grep -n "^[0-9]" $f | cut -d : -f1

# break 'n' in 2 parts
n=100
m=20
d1per=75
d2per=25
dayweight=(75 25)
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

# array=(a b c)
# arrayindex=2
# echo ${array[$arrayindex]}
i=0
while [ $i -lt $days ]
do
	v="$(echo $m'*'${dayweight[$i]}'/'100 | bc)"
	TA_per_day+=("$v")
	w="$(echo $n'*'${dayweight[$i]}'/'100 | bc )"
	std_per_day+=("$w")
  stud_per_ta+="$(bc <<< "${std_per_day[$i]}/${TA_per_day[$i]}")"
  var_2="$(echo ${std_per_day[$i]}'*'"$(echo $i'+'1 | bc)" | bc )"
  var_1="$(echo ${std_per_day[$i]}'*'$i | bc )"
  stud_list_daywise+=("${students[@]:$var_1:$var_2}")
  var_4="$(echo ${TA_per_day[$i]}'*'"$(echo $i'+'1 | bc)" | bc )"
  var_3="$(echo ${TA_per_day[$i]}'*'$i | bc )"
  TAs_list_daywise+="$(echo "${TAs[@]:var_3:var_4}"	)"
  ((i=i+1))
done	 


stud_d1="$(echo "${students[@]:0:$d1}")"
stud_d2="$(echo "${students[@]:$d1+1:$n}")"	

stud_d1_rand="$(shuf -e $stud_d1)"
stud_d2_rand="$(shuf -e $stud_d2)"

TA_alloc=()
j=0
while [ $j -le $days ]
do
  stud_list_daywise[$d]="$(shuf -e $stud_list_daywise[$d])"
  k=0
  while [ $k -le $TA_per_day ]
  do
  	echo "TA No."
  	echo ${TAs_list_daywise[$j]}
  	v="$(echo $j'-'1 | bc)"
  	echo "asasasasasa"
    var_5="$(echo ${stud_per_ta[$k]}'*'$v | bc )"
    echo "ddadddddd"
    var_6="$(echo ${stud_per_ta[$k]}'*'$j | bc )"
  	echo "qqqqswqqqqq"
  	echo "${stud_list_daywise[@]:var_5:var_6}"
  	((k++))
  done 
  ((j++))
done