# Overview
This folder describes how I've create the terraform engine for this mini project

# Schema
This project is **only** for [Amazon Web Services](https://aws.amazon.com/?nc1=h_ls)

You must change just the `main.tf` file in root folder. 

# Environment

```
.
├── main.tf
└── modules
    └── instances
        ├── main.tf
        ├── outputs.tf
        ├── security_group.tf
        └── variables.tf
```

The `main.tf` in this folder is responsable for call the instance module inside the `modules` folder.

#### Module Specs

```
└── instances
        ├── main.tf
        ├── outputs.tf
        ├── security_group.tf
        └── variables.tf
```

`main.tf` contains the [aws_instance module](https://www.terraform.io/docs/providers/aws/r/instance.html) responsable for launch our `ec2` machines

`outputs.tf` contains informations about IP addresses and machines hostname after the creation of them

`security_group.tf` Is responsable for the [security group module](https://www.terraform.io/docs/providers/aws/r/security_group.html) for the ec2 machines

`variables.tf` contains the necessery information that are given in the first `main.tf` file

# Exemples

#### terraform plan

```
Terraform will perform the following actions:

  # module.instances.aws_instance.ec2 will be created
  + resource "aws_instance" "ec2" {
      + ami                          = "ami-069693a1b51639d80"
      ...
      + instance_type                = "t2.micro"
      ...
      + security_groups              = [
          + "ASG_Leroy",
        ]
```
```
# module.instances.aws_security_group.ASG_Leroy will be created
  + resource "aws_security_group" "ASG_Leroy" {
  ...
      + description            = "Web Server APP Leroy Security Group"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              ...
              + protocol         = "-1"
              + security_groups  = []
              ...
              + to_port          = 0
            },
        ]
        ...
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "By Admin"
              + from_port        = 2222
              ...
              + protocol         = "tcp"
              + security_groups  = []
              ...
              + to_port          = 2222
            },
```

#### terraform apply

```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.instances.aws_security_group.ASG_Leroy: Creating...
module.instances.aws_security_group.ASG_Leroy: Creation complete after 5s [id=sg-0f013d05c7c6bc994]
module.instances.aws_instance.ec2[1]: Creating...
module.instances.aws_instance.ec2[2]: Creating...
module.instances.aws_instance.ec2[0]: Creating...
module.instances.aws_instance.ec2[1]: Still creating... [10s elapsed]
module.instances.aws_instance.ec2[2]: Still creating... [10s elapsed]
module.instances.aws_instance.ec2[0]: Still creating... [10s elapsed]
module.instances.aws_instance.ec2[1]: Still creating... [20s elapsed]
module.instances.aws_instance.ec2[2]: Still creating... [20s elapsed]
module.instances.aws_instance.ec2[0]: Still creating... [20s elapsed]
module.instances.aws_instance.ec2[1]: Still creating... [30s elapsed]
module.instances.aws_instance.ec2[0]: Still creating... [30s elapsed]
module.instances.aws_instance.ec2[2]: Still creating... [30s elapsed]
module.instances.aws_instance.ec2[0]: Creation complete after 38s [id=i-0530fdcfdd4acee04]
module.instances.aws_instance.ec2[1]: Creation complete after 38s [id=i-0dfd3b18bd13320c1]
module.instances.aws_instance.ec2[2]: Creation complete after 38s [id=i-07f78bf3e1f3bdd46]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

instancesIPS = [
  "3.92.179.162",
  "52.207.235.221",
  "3.91.252.97",
]
instancesNames = [
  "kubernetes-node-1",
  "kubernetes-node-2",
  "kubernetes-node-3",
]
```
