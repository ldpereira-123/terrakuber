resource "aws_instance" "ec2" {
  count = var.qtd_of_instances
  ami = var.ami
  instance_type = var.machine_type

  tags = {
    Name = "kubernetes-node-${count.index + 1}"
  }

  security_groups = [aws_security_group.ASG_Leroy.name]

}
