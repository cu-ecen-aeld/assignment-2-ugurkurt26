#!/bin/bash
# Writer script for assignment 1

writefile="$1"
writestr="$2"

if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Usage: $0 <output_file> <string_to_write>"
    exit 1
fi

dirname=$(dirname "$writefile")

# Check if the directory exists, if not create it
if [ ! -d "$dirname" ]; then
    mkdir -p "$dirname"
fi

# Write the string to the specified file
echo "$writestr" > "$writefile"

if [ -f "$writefile" ]; then
    echo "File '$writefile' created successfully."
else
    echo "Error: Failed to create file '$writefile'."
    exit 1
fi

