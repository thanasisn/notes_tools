#!/usr/bin/env bash

#### Open an existing file with vim in autosave and send it to i3 scratchpad

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

echo $TEMP_SCRIPT $filename

# Launch terminal with the temporary script
## The name of terminal is used by i3 to send it to scratch pad
# lxterminal -t "Floating - pad - $filename" --geometry=92x45 -e "$SHELL -c '$TEMP_SCRIPT $filename'" &
# urxvt -name  "Floating - pad - $filename" -geometry 92x45 -e "$SHELL -c '$TEMP_SCRIPT $filename'"
echo urxvt -name  "Floating - pad - $filename" -geometry 92x45 -e "$SHELL -c '$TEMP_SCRIPT $filename'"
urxvt -name  "Floating - pad - $filename" -geometry 92x45 -e "$TEMP_SCRIPT" "$filename"

# PID=$!
# echo $PID > /tmp/scratchpadtoday.pid
# ## wait for lxterminal to exit 
# wait $PID

# Clean up
# rm -f "$TEMP_SCRIPT"

sleep 10

