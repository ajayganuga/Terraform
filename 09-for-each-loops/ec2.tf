resource "aws_instance" "this" {
  for_each = var.instances #terraform will give us a variable called each 
  ami                    = var.ami_id
  instance_type          = each.value #we can use the value keyword to access the values in the map
  vpc_security_group_ids = [aws_security_group.ajay.id]

  tags = {
     Name    = each.key #we can use the key keyword to access the keys in the map
    Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "ajay" {
  name        = "ajay-sg"
  description = "Allow tls traffic and all outbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "ajay-sg"
  }


}

output "ec2_info" {
  value = aws_instance.this #we can use for loops to iterate over the instances and get their ids
} 