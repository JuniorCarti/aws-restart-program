#!/bin/bash

echo "=== LOG FILE ANALYSIS ==="
echo "Student: Ridge Junior Abuto"
echo "Date: $(date)"
echo "EC2 Instance: $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)"
echo ""

echo "1. Last login information for all users:"
sudo lastlog
echo ""

echo "2. Recent login activity:"
sudo last -n 10
echo ""

echo "3. Current logged-in users:"
who
echo ""

echo "4. Available System Logs Analysis:"
echo "=== Cloud Init Log (System Initialization) ==="
sudo tail -10 /var/log/cloud-init.log
echo ""

echo "=== Cloud Init Output Log ==="
sudo tail -5 /var/log/cloud-init-output.log
echo ""

echo "=== DNF Package Manager Log ==="
sudo tail -5 /var/log/dnf.log
echo ""

echo "=== Journal Logs (Recent System Events) ==="
sudo journalctl -n 10 --no-pager
echo ""

echo "5. System Boot History:"
sudo last reboot
echo ""

echo "6. Failed Login Attempts:"
sudo lastb 2>/dev/null | head -5 || echo "No failed login data available"
echo ""

echo "=== ANALYSIS COMPLETE ==="
