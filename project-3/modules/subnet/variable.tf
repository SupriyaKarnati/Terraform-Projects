variable "vpc_id" {
  type = string
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}
