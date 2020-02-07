resource "aws_instance" "ec2_haproxy" {
    count = var.qtd_instances
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = "us-east-1a"

    tags = {
        Name = "haproxy-0${count.index + 1}"
    }

    security_groups = ["${var.security_group}"]
}

# resource "null_resource" "InstallHAProxy" {
#     triggers = {
#         network_interface_ids = "${join(",", aws_instance.ec2_haproxy.*.id)}"
#     }
  
#   provisioner "local-exec" {
#       command = <<EOT
#       sleep 30;
#       ansible-playbook -i '${join(", ", aws_instance.ec2_haproxy.*.public_ip)}' -u ${var.ansible_user} --private-key ${var.private_key} modules/haproxy/playbooks/haproxy_instalation.yaml
#       EOT
#   }
# }
