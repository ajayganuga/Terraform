resource "aws_instance" "this" {
  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.expense.id]

  tags = {
     Name    = "terraform-demo"
    Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "expense" {
  name        = "expense-sg"
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
    Name = "expense-sg"
  }


}
