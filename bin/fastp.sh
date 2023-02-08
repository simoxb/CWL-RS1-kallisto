#!/bin/bash

if [[ $5 == 1 ]]; then
	fastp --detect_adapter_for_pe -o $1 -O $2 -i $3 -I $4
elif [[ $5 == 0 ]]; then
	fastp --detect_adapter_for_pe -o $1 -i $3
fi
