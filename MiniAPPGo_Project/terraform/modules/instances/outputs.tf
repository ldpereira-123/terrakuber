output "machineNames" {
  description = "Machines Name"
  value = aws_instance.ec2.*.tags.Name
}

output "ips" {
  description = "Machines IP"
  value = aws_instance.ec2.*.public_ip
}