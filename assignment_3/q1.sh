echo "File name"
read fil

if [ ! -f "$fil" ]; then
  echo "given argument is not a valid file name!"
  exit 1
fi

numbers=($(cat $fil)) 
m="$(grep -c "[ ]*" $fil)"
max=${numbers[0]}
min=${numbers[0]}
# echo "${numbers[@]}"

for (( i=1;i<m;i++)) do
	if (( ${numbers[i]} > $max )) 
	then
	  max=${numbers[i]}
	fi
	if (( ${numbers[i]} < $min )) 
	then
	  min=${numbers[i]}
	fi
done
# echo "$min"
# echo "$max"
divisor="$(bc <<< "scale=4;$max - $min")"
if (( $min == $max )) 
	then
	  echo "ERROR All numbers are equal"
	  exit
fi
for (( i=0;i<m;i++)) do
  numbers[i]="$(bc <<< "scale=4;${numbers[i]} - $min")"
  numbers[i]="$(bc <<< "scale=4;${numbers[i]}/$divisor")"
done
echo "${numbers[@]}"
