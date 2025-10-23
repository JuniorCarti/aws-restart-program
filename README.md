# Bash Shell Scripting Challenge Lab

## AWS re/Start Program - Challenge Lab Solution

### 📝 Description
This repository contains the solution for the Bash Shell Scripting Challenge Lab, which creates 25 empty files with incremental numbering starting from the last existing file number.

### 🎯 Challenge Requirements
- Create 25 empty (0 KB) files
- File naming pattern: `<name><number>` (e.g., Ridge1, Ridge2, etc.)
- Automatically detect the last file number and continue incrementally
- No hard-coded numbers
- Display directory listing for verification

### 📁 Files Included

#### 1. `file_generator.sh`
- Basic version of the script
- Creates 25 files with incremental numbering
- Automatically finds the highest existing file number
- Displays directory listing

#### 2. `advanced_file_generator.sh`
- Enhanced version with additional features:
  - Color-coded output
  - Progress indicators
  - File verification
  - Execution summary
  - Error handling

### 🚀 Usage

```bash
# Make scripts executable
chmod +x file_generator.sh
chmod +x advanced_file_generator.sh

# Run the basic script
./file_generator.sh

# Run the advanced script
./advanced_file_generator.sh
🔧 Features
Automatic Number Detection: Finds the highest existing file number

Incremental Creation: Creates next 25 files automatically

Verification: Checks if files were created successfully

Error Handling: Manages file creation errors gracefully

Progress Tracking: Shows creation progress (advanced version)

📊 Example Output
First run:

text
Created: Ridge1
Created: Ridge2
...
Created: Ridge25
Second run:

text
Created: Ridge26
Created: Ridge27
...
Created: Ridge50
👨‍💻 Author
Ridge Junior Abuto
AWS re/Start Program Participant

📅 Date
Created: 2025-10-23
