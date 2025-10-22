# Managing Log Files - Lab Completion

## Student Information
- **Name:** Ridge Junior Abuto
- **Email:** ridgejunior204@gmail.com
- **EC2 Instance:** 10.0.10.178
- **Date:** $(date)

## Lab Objectives Completed ✅

### 1. Review System Log Files
- Analyzed `/var/log/cloud-init.log` - System initialization logs
- Examined `/var/log/cloud-init-output.log` - Boot output logs
- Reviewed `/var/log/dnf.log` - Package management logs
- Checked journal logs for recent system events

### 2. Last Login Information
- Used `sudo lastlog` to view last login times for all users
- Identified active user sessions and access patterns
- Monitored user login history and frequencies

## Available Log Files Analyzed

### System Logs:
- `/var/log/cloud-init.log` - System initialization and cloud configuration
- `/var/log/cloud-init-output.log` - Boot process output
- `/var/log/dnf.log` - Package manager transactions
- `/var/log/lastlog` - Last login records for all users
- `/var/log/wtmp` - Login history database
- Journal logs - Systemd journal events

## Commands Executed

```bash
# User login information
sudo lastlog
sudo last -n 10
who

# System logs
sudo tail -10 /var/log/cloud-init.log
sudo tail -5 /var/log/cloud-init-output.log
sudo tail -5 /var/log/dnf.log
sudo journalctl -n 10

# System information
sudo last reboot



