terraform {
    required_version = ">= 0.12"
}

provider "aws" {
    version = "~> 2.0"
    region = "us-east-1"

    access_key = ""
    secret_key = ""
}

module "K8S-ASG" {
  source = "./modules/k8s-ASG"
}

module "haproxy" {
  source = "./modules/haproxy"
  
  ami = "ami-07ebfd5b3428b6f4d"
  qtd_instances = 1
  instance_type = "t2.micro"
  key_name = "ec2-instances"
  ansible_user = "ubuntu"
  private_key = "Path to your .pem"
  security_group = module.K8S-ASG.ASG_Name
}

module "k8s-masters" {
  source = "./modules/k8s-masters"
  
  ami = "ami-07ebfd5b3428b6f4d"
  qtd_instances = 3
  instance_type = "t2.medium"
  key_name = "ec2-instances"
  ansible_user = "ubuntu"
  private_key = "Path to your .pem"
  security_group = module.K8S-ASG.ASG_Name
}

module "k8s-workers" {
  source = "./modules/k8s-workers"
  
  ami = "ami-07ebfd5b3428b6f4d"
  qtd_instances = 3
  instance_type = "t2.medium"
  key_name = "ec2-instances"
  ansible_user = "ubuntu"
  private_key = "Path to your .pem"
  security_group = module.K8S-ASG.ASG_Name
}
