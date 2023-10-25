#!/bin/bash

# Check if the number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Error: Please provide two arguments - file path and content"
    exit 1
fi

# Assign the first argument to writefile (file path) and the second argument to writestr (content)
writefile="$1"
writestr="$2"

mkdir -p "$(dirname "$writefile")"
# mkdir -p "$(dirname "$writefile")"
# echo $writestr
# Attempt to create or overwrite the file with the provided content
if echo "$writestr" > "$writefile"; then
    echo "File created: $writefile"
else
    echo "Error: Failed to create or write to $writefile"
    exit 1
fi
