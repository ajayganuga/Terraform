data "aws_ami" "joindevops" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

data "aws_vpc" "default" {
    default = true 
}

output "ami_id" {
  value = data.aws_ami.joindevops.id
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}