# Terraform AWS EC2 and S3 Bucket Project

This repository contains Terraform configurations to provision an **EC2 instance** and an **S3 bucket** on **AWS**. Additionally, it demonstrates how to use an **S3 bucket as a backend** to store the Terraform state file (`.tfstate`) securely and remotely.

## Overview

The project sets up the following AWS resources using Terraform:

- **EC2 Instance**: A basic EC2 instance running in a specified AWS region.
- **S3 Bucket**: An S3 bucket to store files.
- **Terraform State Storage**: The `.tfstate` file is stored in the S3 bucket, allowing the Terraform state to be managed remotely.

# Backend Configuration
This project uses an S3 bucket as a backend for storing the .tfstate file. The backend configuration is included in the s3_backend.tf file. The configuration ensures that the state file is stored remotely and not locally on your machine, allowing teams to collaborate securely.

## Backend Configuration Steps:

### Create the S3 Bucket First: 
Since Terraform needs to store the state file in S3, the S3 bucket must be created manually first before initializing Terraform. You can create an S3 bucket through the AWS console or CLI. Ensure that the bucket name is globally unique.

### Backend Configuration: 
The backend configuration is provided in s3_backend.tf. This configuration defines where the Terraform state file will be stored (in S3).
