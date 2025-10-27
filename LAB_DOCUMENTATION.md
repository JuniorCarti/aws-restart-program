# Lab Implementation Steps

## Task 1: Create VPC
- Used VPC Wizard to create VPC with 10.0.0.0/16 CIDR
- Created 1 public subnet (10.0.0.0/24) and 1 private subnet (10.0.1.0/24)
- Configured NAT gateway and internet gateway

## Task 2: Create Additional Subnets
- Added Public Subnet 2 (10.0.2.0/24)
- Added Private Subnet 2 (10.0.3.0/24)

## Task 3: Configure Routing
- Associated subnets with appropriate route tables
- Verified public subnets route to internet gateway

## Task 4: Create Security Group
- Created "Web Security Group" allowing HTTP traffic
- Later added SSH access for troubleshooting

## Task 5: Launch Web Server
- Launched EC2 instance in Public Subnet 2
- Used user data script to install Apache and deploy web application
- Troubleshooted installation issues and successfully deployed

## Challenges Overcome
1. User data script failures due to Amazon Linux 2023 package differences
2. Security group configuration for SSH access
3. Apache service configuration and file permissions
4. Git installation and configuration in EC2 environment

## Verification
- Web server successfully serving content on port 80
- All lab objectives completed successfully
- Project documentation created and ready for GitHub
