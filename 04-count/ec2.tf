resource "aws_instance" "this" {
  count                  = 3
  ami                    = "ami-0220d79f3f480ecf5" # Update for your region
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ajay_ganuga.id]

  tags = merge(
  var.common_tags,
  {
    Name = var.instance[count.index]
  }
)
}

resource "aws_security_group" "ajay_ganuga" {
  name        = "ganuga_sg"
  description = "Allow TLS traffic and all outbound traffic"

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
}