
terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"

  access_key = "Enter your user aws access key"
  secret_key = "Enter your user aws secret key"
}

module "instances" {
  source = "./modules/instances"

  ami = ("Enter your ami instance id")
  qtd_of_instances = ("Enter the quantity of instances in int format")
  ssh_key_machine = ("Enter your ssh machines key")
  source_block_ip = ("Enter your public IP with CIRD - ex: 172.23.65.99/32")
}

output "instancesNames" {
  value = module.instances.machineNames
}

output "instancesIPS" {
  value = module.instances.ips
}