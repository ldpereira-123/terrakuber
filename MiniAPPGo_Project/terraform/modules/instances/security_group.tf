resource "aws_security_group" "ASG_Leroy" {
  name = "ASG_Leroy"
  description = "Web Server APP Leroy Security Group"

  ingress {
    description = "By Admin"
    from_port = "2222"
    to_port = "2222"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "DNS"
    from_port = "53"
    to_port = "53"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ICMP"
    from_port = "0"
    to_port = "0"
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Docker Pull Images"
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "By Admin"
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = [var.source_block_ip]
  }

  ingress {
    description = "By Admin"
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = [var.source_block_ip]
  }

  ingress {
    description = "Kube Apiserver"
    from_port = "6443"
    to_port = "6443"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Etcd Server API"
    from_port = "2379"
    to_port = "2380"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kubelet API"
    from_port = "10250"
    to_port = "10250"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kube Scheduler"
    from_port = "10251"
    to_port = "10251"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kube Controller Manager"
    from_port = "10252"
    to_port = "10252"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kubelet API Read-only"
    from_port = "10255"
    to_port = "10255"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "NodePort Services"
    from_port = "30000"
    to_port = "32767"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = "0"
    protocol = "-1"
    to_port = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
