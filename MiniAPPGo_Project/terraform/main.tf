
terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"

  access_key = "Enter your use aws acess key"
  secret_key = "Enter your user aws secret key"
}

module "instances" {
  source = "./modules/instances"

  ami = ("Enter your instance ami")
  qtd_of_instances = (Enter how many machines in string format)
  ssh_key_machine = ("Enter your ssh machine key")
  source_block_ip = ("Enter your public ip with CIDR")
}
