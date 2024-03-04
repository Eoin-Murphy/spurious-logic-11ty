#!/bin/bash +x
set -euo pipefail

# Define the main directory
main_directory="./content/blog"

# Iterate through subdirectories
for subdirectory in "$main_directory"/*/; do
    if [ -f "$subdirectory/index.md" ]; then
        echo "Processing $subdirectory"

        # Extract information from the header section
        date=$(awk '/^---$/{f++; next} f == 1{print} /^---$/{exit}' "$subdirectory/index.md" | grep "date:" | cut -d'"' -f2)

        if [ -n "$date" ]; then
            # Display extracted information
            echo "Date: $date"

            # Rename the directory with the prepended date
            new_directory_name="$main_directory/${date}-$(basename "$subdirectory")"

            # Check if the new name is different
            if [ "$subdirectory" != "$new_directory_name" ]; then
                mv "$subdirectory" "$new_directory_name"
                echo "Directory renamed from: $subdirectory to $new_directory_name"
            else
                echo "No need to rename. Directory already has the correct name."
            fi
        else
            echo "No date found in $subdirectory/index.md"
        fi
    fi
done

