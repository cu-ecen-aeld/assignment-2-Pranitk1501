#!/bin/bash

# Check if the number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Error: Please provide two arguments - filesdir and searchstr"
    exit 1
fi

# Assign the first argument to filesdir and the second argument to searchstr
filesdir="$1"
searchstr="$2"

# Check if filesdir is not a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory"
    exit 1
fi

# Use find and grep to search for the string in files within filesdir and its subdirectories
matching_lines=$(find "$filesdir" -type f -exec grep -H "$searchstr" {} \;)

# Count the number of matching lines
num_matching_lines=$(echo "$matching_lines" | wc -l)

# Count the number of files in filesdir and its subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"
