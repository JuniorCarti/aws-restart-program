# AWS VPC and Web Server Lab

## Project Overview
Successfully built a secure AWS VPC infrastructure and deployed a web server as part of the AWS re/Start program.

## Architecture Implemented
- **Custom VPC**: 10.0.0.0/16 CIDR block
- **Public Subnets**: 10.0.0.0/24 (us-west-2a), 10.0.2.0/24 (us-west-2b)
- **Private Subnets**: 10.0.1.0/24 (us-west-2a), 10.0.3.0/24 (us-west-2b)
- **Security Group**: Web Security Group with HTTP access
- **EC2 Instance**: t3.micro with Apache web server
- **Routing**: Internet Gateway and proper route tables

## Lab Objectives Completed
Created a virtual private cloud (VPC)  
Created public and private subnets across multiple AZs  
Configured security groups with proper inbound rules  
Launched an EC2 instance into the VPC  
Deployed and tested a web server with Apache  
Troubleshooted connection and configuration issues  

## Technical Stack
- **Cloud Provider**: AWS
- **Compute**: EC2 (t3.micro)
- **Networking**: VPC, Subnets, Route Tables, Internet Gateway
- **Security**: Security Groups
- **Web Server**: Apache HTTP Server
- **Operating System**: Amazon Linux 2

## Skills Demonstrated
- AWS VPC design and implementation
- Network security configuration
- EC2 instance management
- Web server deployment
- Troubleshooting and problem-solving
- Linux system administration
