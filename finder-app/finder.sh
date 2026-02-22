#!/bin/bash
# Finder script for assignment 1

filesdir="$1"
searchstr="$2"

# Check if the required arguments are provided
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Usage: $0 <directory> <search_string>"
    exit 1
fi

# Check if the provided directory exists
if [ ! -d "$filesdir" ]; then
    echo "Error: Directory '$filesdir' does not exist."
    exit 1
fi

# Count the number of files in the directory
numfiles=$(find "$filesdir" -type f | wc -l)

# Count the number of lines matching the search string in all files
nummatches=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Output the result
echo "The number of files are ${numfiles} and the number of matching lines are ${nummatches}"



