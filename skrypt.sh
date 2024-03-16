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
	echo "--logs|-l [number]: Create log files (default: 100)"
	echo "--help|-h: Display this help message"
	echo "--init: Cloning the repository and setting PATH"
	echo "--error|-e [number]: Create error files (default: 100)"
elif [ "$1" == "--init" ]; then
    git clone https://github.com/Gr33nEight/Lab4-PodstawyGIT.git repo_directory
    export PATH="$PATH:$(pwd)/repo_directory"
    echo "Repository cloned and added to PATH"
elif [ "$1" == "--error" -o "$1" == "-e" ]; then
    if [ -n "$2" ]; then
        error_count="$2"
    else
        error_count=100
    fi
    
    for ((i=1; i<=$error_count; i++)); do
        mkdir -p "error${i}"
        touch "error${i}/error${i}.txt"
    done
    echo "$error_count error files created"
fi

