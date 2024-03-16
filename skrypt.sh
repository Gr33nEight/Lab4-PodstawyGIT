#!/bin/bash
date=$(date)
if [ "$1" == "--date" -o "$1" == "-d" ]; then
	echo "$(date)"
elif [ "$1" == "--logs" -o "$1" == "-l" ]; then
	if [ -n "$2" ]; then
		number="$2"
	else
		number=100
	fi
	for ((i=1; i<=$number; i++)); do
		filename="log${i}.txt"
		echo "$filename $0 $date" > "$filename"
	done
elif [ "$1" == "--help" -o "$1" == "-h" ]; then
	echo "Available options:"
	echo "--date|-d: Display current date"
	echo "--logs|-l [number]: Create log files (defualt: 100)"
	echo "--help|-h: Display this help message"
elif [ "$1" == "--init" ]; then
    git clone https://github.com/Gr33nEight/Lab4-PodstawyGIT.git repo_directory
    export PATH="$PATH:$(pwd)/repo_directory"
    echo "Repository cloned and added to PATH"
fi

