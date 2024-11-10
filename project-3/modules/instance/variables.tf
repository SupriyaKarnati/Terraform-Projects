variable "ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "private_key_path" {
  type    = string
  default = "~/.ssh/id_rsa"
}

variable "local_file" {
  type    = string
  default = "code.py"
}
