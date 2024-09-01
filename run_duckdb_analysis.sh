#!/bin/bash

# Check if DuckDB is installed
if ! command -v duckdb &> /dev/null
then
    echo "DuckDB is not installed. Please install it to proceed."
    exit 1
fi

# If DuckDB is installed, run the SQL script
duckdb -c '.read analyse.sql'
