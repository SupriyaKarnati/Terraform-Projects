provider "aws" {
    region = "eu-central-1"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value = "ami-0084a47cc718c111a"
    instance_type_value = "t2.nano"
    subnet_id = "subnet-0aa1a0fa6fa1f275c"
}


module "s3" {
  source = "./modules/s3"
  bucket_name = "s3-bucket"
}

module "dynamo_db" {
    source = "./modules/dynamo_db"
    dynamodb_table_name = "dynamo-exam"
    hash_key = "LockID"
    billing_mode = "PAY_PER_REQUEST"
    hash_key_type = "S"
}