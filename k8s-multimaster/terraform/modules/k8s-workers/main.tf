resource "aws_instance" "ec2_k8s" {
    count = var.qtd_instances
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = "us-east-1a"

    tags = {
        Name = "k8s-worker-0${count.index + 1}"
    }
    
    security_groups = ["${var.security_group}"]
}

# resource "null_resource" "InstallK8S-Worker" {
#     triggers = {
#         network_interface_ids = "${join(",", aws_instance.ec2_k8s.*.id)}"
#     }

#     provisioner "local-exec" {
#         command = <<EOT
#         sleep 30;
#         ansible-playbook -i '${join(", ", aws_instance.ec2_k8s.*.public_ip)}' -u ${var.ansible_user} --private-key ${var.private_key} modules/k8s-workers/playbooks/disabling_swap.yaml;
#         ansible-playbook -i '${join(", ", aws_instance.ec2_k8s.*.public_ip)}' -u ${var.ansible_user} --private-key ${var.private_key} modules/k8s-workers/playbooks/dependent_packages.yaml;
#         ansible-playbook -i '${join(", ", aws_instance.ec2_k8s.*.public_ip)}' -u ${var.ansible_user} --private-key ${var.private_key} modules/k8s-workers/playbooks/k8s_installation.yaml
#         EOT
#     }
# }