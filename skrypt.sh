#!/bin/bash
date=$(date)
if [ "$1" == "--date" ]; then
	echo "$(date)"
elif [ "$1" == "--logs" ]; then
	if [ -n "$2" ]; then
		number="$2"
	else
		number=100
	fi
	for ((i=1; i<=$number; i++)); do
		filename="log${i}.txt"
		echo "$filename $0 $date" > "$filename"
	done
fi
	 
