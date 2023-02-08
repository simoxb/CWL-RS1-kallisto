#!/bin/bash

if [[ $# == 5 ]]; then
	if [[ $3 == *"firststrand"* ]]; then
		kallisto quant -i $1 -o ./ --gtf $2 --fr-stranded --genomebam $4 $5
	elif [[ $3 == *"secondstrand"* ]]; then
		kallisto quant -i $1 -o ./ --gtf $2 --rf-stranded --genomebam $4 $5
	elif [[ $3 == *"unstranded"* ]]; then
		kallisto quant -i $1 -o ./ --gtf $2 --genomebam $4 $5
	else  
		echo $3 > error_strandness.txt
	fi
elif [[ $# = 4 ]]; then
	if [[ $3 == *"firststrand"* ]]; then
		kallisto quant -i $1 -o ./ --gtf $2 --fr-stranded --genomebam $4
	elif [[ $3 == *"secondstrand"* ]]; then
		kallisto quant -i $1 -o ./ --gtf $2 --rf-stranded --genomebam $4
	elif [[ $3 == *"unstranded"* ]]; then
		kallisto quant -i $1 -o ./ --gtf $2 --genomebam $4
	else  
		echo $3 > error_strandness.txt
	fi
fi
