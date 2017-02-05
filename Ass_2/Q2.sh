#!/bin/bash
#!/bin/bash
echo "Number of Students"
read num
echo "Number of TA's"
read m
echo "Number of days"
read days
echo "File name"
read fil
# To read the file
dayweight=($(cat $fil))
echo "${dayweight[@]}" 
q=$((days+2))
p=$((days+5))
t=${dayweight[$q]::-2}
g=${dayweight[$p]}
echo "$t"
echo "$g"
w="$(bc <<< "scale=2;$num/$m")" # float w
w_="$(bc <<< "$num/$m")" # integer w_

for ((i=0;i<m;i++)) do
	y=$((i+1))
	TAs[$i]="$y"
done

for ((i=0;i<num;i++)) do
	y=$((i+1))
	students[$i]="$y"
done

TAs=($(echo ${TAs[*]} | shuf))
# echo "${TAs[0]} ${TAs[1]} ${TAs[2]} ${TAs[3]} ${TAs[4]} asdad"
students=($(echo ${students[*]} | shuf))

# shuffling the array
TAs=( $(echo "${TAs[*]}" | sed -r 's/(.[^;]*;)/ \1 /g' | tr " " "\n" | shuf | tr -d " " ) )
students=( $(echo "${students[*]}" | sed -r 's/(.[^;]*;)/ \1 /g' | tr " " "\n" | shuf | tr -d " " ) )

preday=$(($days-1))
# round off the students for all days except the last
for ((i=0;i<preday;i++)) do
	
	f=$(($num*${dayweight[$i]}+50))
	v="$(echo $f'/'100 | bc)"
	stud_per_day[$i]="$v"
	v1="$(bc <<< "scale=2;$w/2")"
	v2="$(bc <<< "$v1+${stud_per_day[$i]}")"
	vd="$(bc <<< "$v2/$w")"
  TAs_per_day[$i]="$vd"
done
stud_per_day[$preday]="$num"
TAs_per_day[$preday]="$m"
# /for the last day
for ((i=0;i<preday;i++)) do
  stud_per_day[$preday]=$((stud_per_day[$preday]-stud_per_day[$i]))
  TAs_per_day[$preday]=$((TAs_per_day[$preday]-TAs_per_day[$i]))
done	

TA_indice=0
num_stud=0
k=1

for ((i=0;i<days;i++)) do
    num_TAs_day=0
    n=0
    re=$((i+1))
    echo "Day $re students:"
# the residual students indicating that we need to give extra to a TA
    r=$((${stud_per_day[$i]}-(${TAs_per_day[$i]}*$w_)))
# handle a boundary case
    if (( "$r" < 0 ))
    then 
      tp=$((i+1))
      stud_per_day[$tp]=$((${stud_per_day[$tp]}+$r))
      stud_per_day[$i]=$((${stud_per_day[$i]}-$r))    
    fi
    echo "${students[@]:$num_stud:${stud_per_day[$i]}}"
    while [[ $n -lt $r ]] && [[ $num_TAs_day -lt ${TAs_per_day[$i]} ]]
    do
      st="$num_stud"
      stp="$(($w_+1))"
      # echo "$(($w_+1)) $st aaaaas"
      students_of_TA=("${students[@]:st:stp}")
      # echo "The TA is ${TAs[$TA_indice]}"      
      # echo "And the students are ${students_of_TA[@]}"
      timeds=$t
      for ((b=0;b<stp;b++)) do
      	echo "${TAs[$TA_indice]} ${students_of_TA[$b]} $timeds"
      timeds=$(date -d "$timeds $g minutes" | grep -o ..:..)
      done	
      # stud_list_daywise+=("${students[@]:$var_1:$var_2}")

      # Updating the variables
      TA_indice="$((TA_indice+1))"
      n="$((n+1))"
      num_stud="$((num_stud+$w_+1))"
      num_stud_day="$((num_stud_day+$w_+1))"    
      num_TAs_day="$((num_TAs_day+1))"
    done
    while [ $num_TAs_day -lt ${TAs_per_day[$i]} ]
    do 
      st="$(echo $num_stud | bc)"
      stp="$w_"
      students_of_TA=("${students[@]:$st:$stp}")
      # echo "The TA is ${TAs[$TA_indice]} "
      # echo "And the students are ${students_of_TA[@]}"
      timeds=$t
      for ((b=0;b<stp;b++)) do
      	echo "${TAs[$TA_indice]} ${students_of_TA[$b]} $timeds"
        timeds=$(date -d "$timeds $g minutes" | grep -o ..:..)
      done	
      small_TAs[$k]=${TAs[$TA_indice]}      
      # Updating the variables
      k="$((k+1))"
      TA_indice="$((TA_indice+1))"
      num_stud="$((num_stud+$w_))"
      num_stud_day="$((num_stud_day+$w_))"
      num_TAs_day="$((num_TAs_day+1))"
    done	
done
differ=$((num-num_stud))
if (( "$differ" > 0 ))
then
  for ((i=1;i<=differ;i++)) do
  	echo "${students[num_stud]} with TA No. ${small_TAs[$i]}"
    num_stud="$((num_stud+1))"
  done	
fi  	
