#!/bin/bash

check_strandedness -g $3 -r1 $1 -r2 $2 --transcripts $3 > result.txt
    result=$( tail -n 1 result.txt )
    if [[ $result == *"likely unstranded"* ]]; then
        echo "unstranded" > strandedness.txt
    elif [[ $result == *"likely RF/fr-firststrand"* ]]; then
        echo "firstrand" > strandedness.txt
    elif [[ $result == *"likely FR/fr-secondstrand"* ]]; then
        echo "secondstrand" > strandedness.txt
    else
        echo "error" > strandedness.txt
    fi
