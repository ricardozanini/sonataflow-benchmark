#!/bin/bash

N=$1
CMD="$2"

for ((i=1; i<=N; i++))
do
    echo "Run #$i:"
    eval "$CMD"
done