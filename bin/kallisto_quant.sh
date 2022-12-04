#!/bin/bash

if [[ $3 == *"firststrand"* ]]; then
	kallisto quant -i $1 -o ./ --gtf $2 --fr-stranded --genomebam $4 $5
elif [[ $3 == *"secondstrand"* ]]; then
	kallisto quant -i $1 -o ./ --gtf $2 --rf-stranded --genomebam $4 $5
elif [[ $3 == *"unstranded"* ]]; then
	kallisto quant -i $1 -o ./ --gtf $2 --genomebam $4 $5
else  
	echo $3 > error_strandness.txt
	echo "strandness cannot be determined" >> error_strandness.txt
fi
