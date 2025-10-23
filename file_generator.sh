#!/bin/bash

# Challenge Lab: File Generator Script
# Student: Ridge Junior Abuto
# Creates 25 files with incremental numbering

# Set your name here
YOUR_NAME="Ridge"

# Function to find the highest existing file number
find_max_number() {
    local max_num=0
    
    # Check all files with the pattern YOUR_NAME<number>
    for file in "${YOUR_NAME}"*; do
        if [[ -f "$file" ]]; then
            # Extract number from filename
            local num=$(echo "$file" | sed "s/${YOUR_NAME}//" | sed 's/[^0-9]*//g')
            if [[ ! -z "$num" ]] && [[ "$num" =~ ^[0-9]+$ ]]; then
                if [[ "$num" -gt "$max_num" ]]; then
                    max_num=$num
                fi
            fi
        fi
    done
    
    echo $max_num
}

# Function to create new files
create_files() {
    local start_num=$1
    local count=25
    
    echo "Starting from number: $((start_num + 1))"
    echo "Creating $count new files..."
    
    for ((i=1; i<=count; i++)); do
        local file_number=$((start_num + i))
        local filename="${YOUR_NAME}${file_number}"
        
        # Create empty file
        touch "$filename"
        
        # Verify file creation
        if [[ -f "$filename" ]]; then
            echo "Created: $filename"
        else
            echo "Error: Failed to create $filename"
        fi
    done
}

# Main script execution
main() {
    echo "=== FILE GENERATOR SCRIPT ==="
    echo "Student: Ridge Junior Abuto"
    echo "=============================="
    
    # Find the highest existing file number
    local current_max=$(find_max_number)
    echo "Highest existing file number: $current_max"
    
    # Calculate starting number for new files
    local start_number=$current_max
    
    # Create new batch of files
    create_files $start_number
    
    echo "=============================="
    echo "File creation completed!"
    echo ""
    
    # Display directory listing
    echo "=== DIRECTORY LISTING ==="
    ls -la "${YOUR_NAME}"* | head -30
    echo ""
    
    # Show file count
    local total_files=$(ls -1 "${YOUR_NAME}"* 2>/dev/null | wc -l)
    echo "Total ${YOUR_NAME} files: $total_files"
    
    # Show latest files created
    echo ""
    echo "=== LATEST FILES CREATED ==="
    ls -la "${YOUR_NAME}"* | tail -5
}

# Run the main function
main
