#!/bin/bash
awk 'BEGIN{FS=","; OFS=","}
    {
        for (i=1; i<NF; i=i+2) {
            printf "%s,%s", $(i+1),$(i);
            if (i<NF-1) {
                printf "%s", OFS;
            }
        }
        if (i==NF) {
        	printf "%s", $i;
        }
        printf "\n"
    }'
