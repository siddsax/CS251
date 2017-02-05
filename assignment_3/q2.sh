#!/bin/bash
j=0
for i in $(echo $1 | sed "s/,/ /g")
do
  files[$j]="$i"
  j=$((j+1))
done

if (( $j < 3 ));then 
	echo "You have entered less files"
	exit 1
fi
if (( $j > 3 ));then 
	echo "You have entered more files"
	exit 1
fi

for ((m=1;m<=j;m++))
  do
  n=$((m-1)) 
  if [ ! -f "${files[$n]}" ]; then
    echo "$m argument is not a valid file name!"
    exit 1
  fi
done
marks=($(cat ${files[2]}))
nlines="$(grep -c "[ ]*" ${files[2]})"

for ((j=0;j<nlines;j++))
	do
	k=0	
	for i in $(echo ${marks[j]} | sed "s/,/ /g")
	do
	  data[k]="$i"
	  k=$((k+1))
	done
	scores[${data[0]}]="$(bc <<< "${data[1]}+${data[2]}")" 
done	

projs=($(cat ${files[1]}))
nlines="$(grep -c "[ ]*" ${files[1]})"

for ((j=0;j<nlines;j++))
	do
	k=0	
	for i in $(echo ${projs[j]} | sed "s/,/ /g")
	do
	  data[k]="$i"
	  k=$((k+1))
	done
	std_proj[${data[1]}]="${data[0]}"
done	
# echo "${std_proj[@]}"

dat="$(cat ${files[0]})"

names=($(echo "$dat" | sed s/" "/_/g))
nlines="$(grep -c "[ ]*" ${files[0]})"

for ((j=0;j<nlines;j++))
	do
	k=0	
	for i in $(echo ${names[j]} | sed "s/,/ /g")
	do
	  data[k]="$i"
	  k=$((k+1))
	done
	data[1]="$(echo ${data[1]} | sed s/_/" "/g)"
	echo "${data[0]},${data[1]},${scores[${std_proj[${data[0]}]}]} "
done	
