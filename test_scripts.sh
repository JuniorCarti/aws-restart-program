#!/bin/bash

# Test script for Bash Challenge Lab
echo "Testing Bash Challenge Lab Scripts..."
echo "======================================"

# Test basic script
echo "1. Testing basic file_generator.sh..."
./file_generator.sh
echo "Basic script test completed."

# Test advanced script  
echo ""
echo "2. Testing advanced_file_generator.sh..."
./advanced_file_generator.sh
echo "Advanced script test completed."

# Show final results
echo ""
echo "=== FINAL RESULTS ==="
echo "Total files created: $(ls -1 Ridge* 2>/dev/null | wc -l)"
echo "Latest files:"
ls -la Ridge* | tail -5
