#!/bin/bash
date=$(date)
if [ "$1" == "--date" ]; then
	echo "$(date)"
elif [ "$1" == "--logs" ]; then
	for ((i=1; i<=100; i++)); do
		filename="log${i}.txt"
		echo "$filename $0 $date" > "$filename"
	done
fi
	 
