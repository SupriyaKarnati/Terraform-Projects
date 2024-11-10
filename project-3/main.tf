provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source  = "./modules/vpc"
  cidr    = var.cidr
}

module "subnet" {
  source      = "./modules/subnet"
  vpc_id      = module.vpc.vpc_id
  cidr_block  = "10.0.0.0/24"
}

module "internet_gateway" {
  source  = "./modules/internet-gateway"
  vpc_id  = module.vpc.vpc_id
}

module "route_table" {
  source     = "./modules/route_table"
  vpc_id     = module.vpc.vpc_id
  gateway_id = module.internet_gateway.internet_gateway_id
}


module "route_table_association" {
  source         = "./modules/route_table_association"
  subnet_id      = module.subnet.subnet_id
  route_table_id = module.route_table.route_table_id
}

module "key_pair" {
  source      = "./modules/key-pair"
  public_key  = file("~/.ssh/id_rsa.pub")
}



module "security_group" {
  source  = "./modules/security-groups"
  vpc_id  = module.vpc.vpc_id
}



module "instance" {
  source            = "./modules/instance"
  ami               = "ami-0866a3c8686eaeeba"
  instance_type     = "t2.micro"
  key_name          = module.key_pair.key_name
  subnet_id         = module.subnet.subnet_id
  security_group_id = module.security_group.security_group_id

}



