#!/bin/bash

# Lab Submission Script
echo "AWS re/Start Program - Challenge Lab Submission"
echo "=============================================="
echo "Student: Ridge Junior Abuto"
echo "Lab: Bash Shell Scripting"
echo "Date: $(date)"
echo "GitHub: https://github.com/JuniorCarti/aws-restart-program"
echo ""

# Test the scripts
echo "1. Testing basic script..."
./file_generator.sh
sleep 2

echo ""
echo "2. Testing advanced script..."
./advanced_file_generator.sh

echo ""
echo "3. Verification..."
echo "Total files created: $(ls -1 Ridge* 2>/dev/null | wc -l)"
echo "File sizes (first 10):"
ls -la Ridge* | awk '{print $5, $9}' | head -10

echo ""
echo "✅ Lab completed successfully!"
echo "📁 Files are ready for GitHub submission"
