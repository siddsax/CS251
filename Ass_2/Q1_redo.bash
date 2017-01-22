#!/bin/bash
n=11
m=4
dayweight=(70 30)
days=2
declare -A matrix

w="$(bc <<< "scale=2;$n/$m")"
w_="$(bc <<< "$n/$m")"
echo "$w"
for ((i=1;i<=m;i++)) do
	TAs[$i]="$i"
done

for ((i=1;i<=n;i++)) do
	students[$i]="$i"
done
preday=$(($days-1))
# round off the students
for ((i=0;i<preday;i++)) do
	
	f=$(($n*${dayweight[$i]}+50))
	v="$(echo $f'/'100 | bc)"
	stud_per_day[$i]="$v"
	v1="$(bc <<< "scale=2;$w/2")"
	v2="$(bc <<< "$v1+${stud_per_day[$i]}")"
	vd="$(bc <<< "$v2/$w")"
  TAs_per_day[$i]="$vd"
  # ratio="$(bc <<< "${stud_per_day[$i]}/$vd")" 
  # if (( "$ratio" > "$w" )) 
  # then
  #   TAs_per_day[$i]="$((TAs_per_day[$i]+1))"  
  #   if (( "$ratio" < "$w" )) 
  #   then
  #     echo "NOT POSSIBLE"
  #     exit  
  #   fi
  # fi	
done
stud_per_day[$preday]="$n"
TAs_per_day[$preday]="$m"
for ((i=0;i<preday;i++)) do
  stud_per_day[$preday]=$((stud_per_day[$preday]-stud_per_day[$i]))
  TAs_per_day[$preday]=$((TAs_per_day[$preday]-TAs_per_day[$i]))
done	

TA_indice=1
num_stud=0
for ((i=0;i<days;i++)) do
    num_stud_day=0
    # echo "${stud_per_day[$i]} zzz"
    # echo "${TAs_per_day[$i]} xxx"
    n=0
    r=$((${stud_per_day[$i]}%${TAs_per_day[$i]}))
    while [ $n -lt $r ] 
    do
      st="$(echo $num_stud+1 | bc)"
      # echo "$(($w_+1)) $st aaaaas"
      students_of_TA=("${students[@]:st:$(($w_+1))}")
      echo "The TA is ${TAs[$TA_indice]}"      
      echo "And the students are ${students_of_TA[@]}"
      # stud_list_daywise+=("${students[@]:$var_1:$var_2}")

      # Updating the variables
      TA_indice="$((TA_indice+1))"
      n="$((n+1))"
      num_stud="$((num_stud+$w_+1))"
      num_stud_day="$((num_stud_day+$w_+1))"    
    done
    while [ $num_stud_day -lt ${stud_per_day[$i]} ]
    do 
      st="$(echo $num_stud+1 | bc)"
      students_of_TA=("${students[@]:$st:$w_}")
      echo "The TA is ${TAs[$TA_indice]} "
      echo "And the students are ${students_of_TA[@]}"
      
      # Updating the variables
      TA_indice="$((TA_indice+1))"
      num_stud="$((num_stud+$w_))"
      num_stud_day="$((num_stud_day+$w_))"
done	

done













std_per_day=()
TA_per_day=()
stud_per_ta=()
stud_list_daywise=()
TAs_list_daywise=()
