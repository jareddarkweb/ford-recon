#!/bin/bash

# Previous subdomains file
PREV_FILE="previous_subdomains.txt"
# Current subdomains file
CURR_FILE="subdomains.txt"
# New subdomains file
NEW_FILE="new_subdomains.txt"

# If previous file doesn't exist, create it
if [ ! -f "$PREV_FILE" ]; then
    touch "$PREV_FILE"
fi

# Compare previous and current subdomains to find new ones
comm -13 <(sort "$PREV_FILE") <(sort "$CURR_FILE") > "$NEW_FILE"

# Update previous subdomains with current subdomains
cp "$CURR_FILE" "$PREV_FILE"
