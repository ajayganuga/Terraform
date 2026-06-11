output  "ami_id" {
  value       = data.aws_ami.joindevops.id
}

output "default_vpc_id" {
    value = data.aws_vpc.default.id
}

output "public_id" {
    value = aws_instance.this.public_ip
}



