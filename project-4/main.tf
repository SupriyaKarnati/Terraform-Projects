provider "aws" {
  region = "eu-central-1"
}

variable "ami" {
  description = "this is ami-instance for workspace"
}

variable "instance_type" {
  description = "this is instance type for workspace"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.micro"
    "prod" = "t2.micro"
  }
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "supriya-s3-bucket"
}

module "dynamo_db" {
    source = "./modules/dynamo_db"
    dynamodb_table_name = "dynamo-exam"
    hash_key = "LockID"
    billing_mode = "PAY_PER_REQUEST"
    hash_key_type = "S"
}