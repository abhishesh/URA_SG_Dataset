#!/bin/bash

# Output file name
output_file="combined.csv"

# Check if the output file already exists and delete it if so
if [ -f "$output_file" ]; then
    rm "$output_file"
fi

# Combine the first CSV file (header included)
first_file=true

# Loop through the files in the current directory
for file in *.csv; do
    if [ "$first_file" = true ]; then
        # Include the header for the first file
        cat "$file" >> "$output_file"
        first_file=false
    else
        # Skip the header for the rest of the files
        tail -n +2 "$file" >> "$output_file"
    fi
done

echo "Combined all CSV files into $output_file"
