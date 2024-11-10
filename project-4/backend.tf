terraform {
  backend "s3" {
    bucket = "supriya-s3-bucket"
    key    = "env:/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "dynamo-exam"
    }
}