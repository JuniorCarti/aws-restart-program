# Technical Documentation

## Script Architecture

### file_generator.sh
- **Main Function**: `main()` - orchestrates the entire process
- **Number Detection**: `find_max_number()` - finds highest existing file number
- **File Creation**: `create_files()` - creates 25 new files

### advanced_file_generator.sh
- **Enhanced Features**:
  - Color-coded output using ANSI escape codes
  - Progress tracking every 5 files
  - File verification post-creation
  - Detailed execution summary

## Key Functions

### Number Detection Logic
```bash
find_max_number() {
    local max_num=0
    for file in "${YOUR_NAME}"*; do
        if [[ -f "$file" ]]; then
            local num=$(echo "$file" | sed "s/${YOUR_NAME}//")
            if [[ "$num" -gt "$max_num" ]]; then
                max_num=$num
            fi
        fi
    done
    echo $max_num
}
File Creation Logic
bash
create_files() {
    local start_num=$1
    for ((i=1; i<=25; i++)); do
        local file_number=$((start_num + i))
        touch "${YOUR_NAME}${file_number}"
    done
}
Error Handling
Checks if files are created successfully

Handles permission errors

Validates file naming pattern

Testing Methodology
First run: Creates files 1-25

Second run: Creates files 26-50

Third run: Creates files 51-75

Verification: Checks file existence and size (0 KB)
