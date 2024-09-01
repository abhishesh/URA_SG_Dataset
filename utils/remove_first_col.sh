#!/bin/bash

# Loop through all CSV files in the current directory
for input_file in *.csv; do
    # Output file name
    output_file="${input_file%.csv}_modified.csv"

    # Check if the input file exists
    if [ ! -f "$input_file" ]; then
        echo "File $input_file not found!"
        continue
    fi

    # Remove the first column and save the result to the output file
    cut -d',' -f2- "$input_file" > "$output_file"

    echo "First column removed from $input_file. Modified file saved as $output_file"
done