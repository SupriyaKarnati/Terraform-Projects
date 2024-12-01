# Terraform AWS EC2 and S3 Bucket Project

This repository contains Terraform configurations to provision an EC2 instance and an S3 bucket on AWS. Additionally, it demonstrates how to use an S3 bucket as a backend to store the Terraform state file (.tfstate) securely and remotely, with DynamoDB used for state locking.

## Overview

The project sets up the following AWS resources using Terraform:

- **EC2 Instance**: A basic EC2 instance running in a specified AWS region.
- **S3 Bucket**: An S3 bucket to store files.
- **DynamoDB Table for State Locking**: A DynamoDB table to lock the Terraform state file during modifications to prevent race conditions.
- **Terraform State Storage**: The `.tfstate` file is stored remotely in the S3 bucket and managed securely, with state locking enabled via DynamoDB.

## Backend Configuration

This project uses an S3 bucket as a backend for storing the `.tfstate` file. Additionally, DynamoDB is used to lock the state file to prevent multiple users or processes from modifying it concurrently. This backend configuration is defined in the `s3_backend.tf` file.

### Backend Configuration Steps:

1. **Create the S3 Bucket and DynamoDB Table**:  
   The S3 bucket must be created first, as Terraform needs it to store the state file. You can create the bucket manually through the AWS console or CLI. Ensure that the bucket name is globally unique.
   
   A DynamoDB table will be created using Terraform, and it will be used for state file locking. The DynamoDB table ensures that only one process or user can modify the Terraform state at any time.

2. **Configure Backend with Terraform**:  
   The backend configuration is defined in the `s3_backend.tf` file, which tells Terraform to store the state file in the S3 bucket and use DynamoDB for state locking.
