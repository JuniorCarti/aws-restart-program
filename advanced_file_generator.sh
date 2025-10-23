#!/bin/bash

# Advanced File Generator Script
# Student: Ridge Junior Abuto

# Configuration
YOUR_NAME="Ridge"
FILES_PER_BATCH=25
SCRIPT_NAME="advanced_file_generator.sh"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display header
display_header() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════╗"
    echo "║           ADVANCED FILE GENERATOR           ║"
    echo "║           Challenge Lab Solution            ║"
    echo "╚══════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "Student: ${YELLOW}Ridge Junior Abuto${NC}"
    echo "Files per batch: $FILES_PER_BATCH"
    echo "File pattern: ${YOUR_NAME}<number>"
    echo ""
}

# Function to find the highest existing file number
find_max_number() {
    local max_num=0
    local file_count=0
    
    # Check all files with the pattern
    for file in "${YOUR_NAME}"[0-9]*; do
        if [[ -f "$file" ]]; then
            # Extract number from filename using regex
            if [[ "$file" =~ ${YOUR_NAME}([0-9]+) ]]; then
                local num="${BASH_REMATCH[1]}"
                if [[ "$num" -gt "$max_num" ]]; then
                    max_num=$num
                fi
                ((file_count++))
            fi
        fi
    done
    
    echo "$max_num:$file_count"
}

# Function to create new files with progress
create_files() {
    local start_num=$1
    local count=$2
    
    echo -e "${YELLOW}Creating $count new files starting from number $((start_num + 1))...${NC}"
    echo ""
    
    local created_count=0
    local error_count=0
    
    for ((i=1; i<=count; i++)); do
        local file_number=$((start_num + i))
        local filename="${YOUR_NAME}${file_number}"
        
        # Create empty file
        if touch "$filename" 2>/dev/null; then
            echo -e "${GREEN}✓ Created: $filename${NC}"
            ((created_count++))
        else
            echo -e "${RED}✗ Failed: $filename${NC}"
            ((error_count++))
        fi
        
        # Show progress every 5 files
        if [[ $((i % 5)) -eq 0 ]]; then
            echo "Progress: $i/$count files..."
        fi
    done
    
    echo ""
    if [[ $error_count -eq 0 ]]; then
        echo -e "${GREEN}Successfully created $created_count files${NC}"
    else
        echo -e "${YELLOW}Created $created_count files, $error_count errors${NC}"
    fi
}

# Function to display summary
display_summary() {
    local old_count=$1
    local new_count=$2
    local start_num=$3
    
    echo ""
    echo -e "${BLUE}=== EXECUTION SUMMARY ===${NC}"
    echo "Previous file count: $old_count"
    echo "New file count: $new_count"
    echo "Total files now: $((old_count + new_count))"
    echo "Files created: ${YOUR_NAME}$((start_num + 1)) to ${YOUR_NAME}$((start_num + new_count))"
    echo ""
}

# Function to display file listing
display_file_listing() {
    echo -e "${BLUE}=== DIRECTORY CONTENTS ===${NC}"
    
    # Show first 5 files
    echo "First 5 files:"
    ls -1 "${YOUR_NAME}"* 2>/dev/null | head -5 | while read file; do
        echo "  $file"
    done
    
    # Show last 5 files
    echo ""
    echo "Last 5 files:"
    ls -1 "${YOUR_NAME}"* 2>/dev/null | tail -5 | while read file; do
        echo "  $file"
    done
    
    # Show total count
    local total=$(ls -1 "${YOUR_NAME}"* 2>/dev/null | wc -l)
    echo ""
    echo "Total ${YOUR_NAME} files: $total"
}

# Function to verify file creation
verify_files() {
    local expected_start=$1
    local count=$2
    local verified=0
    local missing=0
    
    echo ""
    echo -e "${YELLOW}=== VERIFYING FILE CREATION ===${NC}"
    
    for ((i=1; i<=count; i++)); do
        local file_number=$((expected_start + i))
        local filename="${YOUR_NAME}${file_number}"
        
        if [[ -f "$filename" ]] && [[ ! -s "$filename" ]]; then
            ((verified++))
        else
            echo -e "${RED}Missing or non-empty: $filename${NC}"
            ((missing++))
        fi
    done
    
    if [[ $missing -eq 0 ]]; then
        echo -e "${GREEN}✓ All $verified files verified (0 KB, empty)${NC}"
    else
        echo -e "${YELLOW}Verified: $verified, Missing/Invalid: $missing${NC}"
    fi
}

# Main script execution
main() {
    display_header
    
    # Find current maximum number and file count
    local result=$(find_max_number)
    local current_max=$(echo "$result" | cut -d: -f1)
    local current_count=$(echo "$result" | cut -d: -f2)
    
    echo -e "Current highest file number: ${YELLOW}$current_max${NC}"
    echo -e "Current file count: ${YELLOW}$current_count${NC}"
    echo ""
    
    # Create new files
    create_files $current_max $FILES_PER_BATCH
    
    # Verify creation
    verify_files $current_max $FILES_PER_BATCH
    
    # Get new file count
    local new_result=$(find_max_number)
    local new_count=$(echo "$new_result" | cut -d: -f2)
    
    # Display summary and listing
    display_summary $current_count $FILES_PER_BATCH $current_max
    display_file_listing
    
    echo ""
    echo -e "${GREEN}=== CHALLENGE COMPLETED SUCCESSFULLY ===${NC}"
    echo "Script: $SCRIPT_NAME"
    echo "Student: Ridge Junior Abuto"
    echo "Date: $(date)"
}

# Error handling
set -e

# Run main function
main "$@"
