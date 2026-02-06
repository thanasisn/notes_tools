#!/usr/bin/env bash

filename="$1"

# Check if filename was provided
if [[ -z "$filename" ]]; then
    echo "Error: No filename provided"
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if file exists
if [[ ! -f "$filename" ]]; then
    echo "Error: File does not exist: $filename"
    exit 1
fi

# Create a temporary script to handle the complex quoting
# This avoids issues with nested quotes in bash -c
TEMP_SCRIPT=$(mktemp)
cat > "$TEMP_SCRIPT" << 'EOF'
#!/bin/bash
filename="$1"
vim -c 'autocmd TextChanged,TextChangedI <buffer> silent write' -- "$filename"
EOF

chmod +x "$TEMP_SCRIPT"

# Launch terminal with the temporary script
lxterminal -t "Floating - Scratchpad - $filename" --geometry=150x50 -e "$SHELL -c '$TEMP_SCRIPT $filename'"

# Clean up
# rm -f "$TEMP_SCRIPT"
