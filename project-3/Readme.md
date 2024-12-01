# AWS Infrastructure Setup with Terraform

This project creates a basic AWS infrastructure using Terraform. The infrastructure includes the following resources:

- A Virtual Private Cloud (VPC)
- A Subnet within the VPC
- An Internet Gateway for internet access
- A Route Table with a route to the Internet Gateway
- A Route Table Association for the subnet
- An EC2 Key Pair for SSH access
- A Security Group to define firewall rules
- An EC2 Instance that uses the defined security group and key pair
- Provisioners to copy files to the EC2 instance and execute deployment commands remotely

## Prerequisites

Before you begin, ensure you have the following:

- **AWS Account**: An active AWS account.
- **AWS CLI/SDK or Terraform**: This project uses Terraform to manage infrastructure.
- **IAM Permissions**: Ensure your IAM user has the necessary permissions to create AWS resources such as VPC, EC2, Security Group, and IAM Key Pairs.

## Resources Created

This Terraform script will create the following resources:

### VPC
- **CIDR Block**: `10.0.0.0/16`
- **Name**: `MyVPC`

### Subnet
- **CIDR Block**: `10.0.1.0/24`
- **Name**: `MySubnet`
- **Availability Zone**: Default Availability Zone.

### Internet Gateway
- **Attached to the VPC** to provide internet access.

### Route Table
- **Default Route**: `0.0.0.0/0` to the Internet Gateway.

### Route Table Association
- The subnet is associated with the route table to enable internet access.

### Security Group
- Allows inbound **SSH** traffic (port 22) from anywhere (`0.0.0.0/0`).
- Allows outbound traffic to anywhere.

### Key Pair
- A key pair for SSH access to the EC2 instance.
- **Important**: Download the private key file (`.pem`) when creating the key pair, as it cannot be downloaded again.

### EC2 Instance
- **Instance Type**: `t2.micro` (Free Tier eligible)
- **Placed in**: The created subnet.
- **Uses**: The defined security group and key pair for SSH access.

### Provisioners
- **File Provisioner**: To copy files (e.g., configuration or scripts) from the local machine to the EC2 instance.
- **Remote-exec Provisioner**: To execute setup or deployment commands on the EC2 instance (e.g., install dependencies, run deployment scripts).
