	#!/bin/bash

string_a="$(grep -n $2 $1 | cut -d : -f 1)"
string_b="$(grep -n $3 $1 | cut -d : -f 1)"
# echo ${string_a:2:1}
# echo ${string_b[0]}
for i in $(echo $string_a); do
	for j in $(echo $string_b); do
		if [[ "$i" = "$j" ]]; then
			sed "${i}q;d" $1
		fi
	done
done	
