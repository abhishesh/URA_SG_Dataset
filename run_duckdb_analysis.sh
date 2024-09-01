#!/bin/bash

# Check if an argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <sql-file>"
    exit 1
fi

# Check if the SQL file exists
if [ ! -f "$1" ]; then
    echo "File '$1' not found!"
    exit 1
fi

# Check if DuckDB is installed
if ! command -v duckdb &> /dev/null
then
    echo "DuckDB is not installed. Please install it to proceed."
    exit 1
fi

# If DuckDB is installed, run the SQL script
duckdb -c ".read $1"