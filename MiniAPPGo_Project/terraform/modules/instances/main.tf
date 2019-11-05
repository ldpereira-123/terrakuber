resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.machine_type

  tags = {
    Name = "kubernetes-node-${var.qtd_of_instances + 1}"
  }

  security_groups = [aws_security_group.ASG_Leroy.name]

}
