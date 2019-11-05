variable "machine_type" {
  description = "Default Type Of Our Machines"
  default = "t2.micro"
}

variable "ami" {}

variable "qtd_of_instances" {}

variable "ssh_key_machine" {}

variable "source_block_ip" {}
