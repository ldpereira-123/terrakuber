resource "aws_security_group" "ASG_K8S" {
    name = "KubernetesSecurityGroup"
    description = "Kubernetes Multimaster Security Group"
  
    ingress {
        description = "Allow Internet SSH ADM"
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description = "Internal network. Allow All Connetion into Cluster itself"
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        self = true
    }

    egress {
        from_port = "0"
        protocol = "-1"
        to_port = "0"
        cidr_blocks = ["0.0.0.0/0"]
  }

}
