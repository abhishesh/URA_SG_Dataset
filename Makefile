# Variables
DIALECT = duckdb
SQL_FILES = analyse.sql # Add more SQL files here if needed

# Default target
all: lint

# Lint target
lint:
	@echo "Linting SQL files..."
	sqlfluff lint $(SQL_FILES) --dialect $(DIALECT)

# Fix target
fix:
	@echo "Fixing SQL files..."
	sqlfluff fix $(SQL_FILES) --dialect $(DIALECT)

# Clean target (optional)
clean:
	@echo "Cleaning up backup files..."
	rm -f *.bak

# Phony targets
.PHONY: all lint fix clean

