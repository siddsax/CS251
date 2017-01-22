differ=$((n-num_stud))
echo "$differ"
if (( "$differ" > 0 ))
then
  for ((i=1;i<=differ;i++)) do
  	echo "${students[num_stud]} with ${small_TAs[$i]}"
    num_stud="$((num_stud+1))"
  done	

fi  	


      small_TAs[$k]=${TAs[$TA_indice]}
