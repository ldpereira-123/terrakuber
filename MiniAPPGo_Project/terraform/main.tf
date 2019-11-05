
terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"

  access_key = "AKIAZXDKHXVLZANR2LMI"
  secret_key = "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"
}

module "instances" {
  source = "./modules/instances"

  ami = ("ami-069693a1b51639d80")
  qtd_of_instances = (3)
  ssh_key_machine = ("ubuntu-key")
  source_block_ip = ("179.191.109.110/32")
}

output "instancesNames" {
  value = module.instances.machineNames
}

output "instancesIPS" {
  value = module.instances.ips
}