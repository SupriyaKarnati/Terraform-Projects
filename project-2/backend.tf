terraform {
  backend "s3" {
    bucket = "supriya-s3-practice-1"
    key    = "terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "dynamo-prac-1"
    }
}
