variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"  
  description = "this is the AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "this is the instance type for the EC2 instance"
}

variable "ec2_tags" {
  type        = map(string)
  default     = {
    project = "Expense" 
    component = "backend"
    environment = "dev"
    name = "Expense-backend-dev-instance"
  }
} 

variable "from_port" {
  type        = number
  default     = 22
  description = "this is the from port for the security group"
}

variable "to_port" {
  type        = number
  default     = 22
  description = "this is the to port for the security group"
}

variable "cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "this is the CIDR blocks for the security group"
}

variable "sg_tags" {
  type        = map(string)
  default     = {
    project = "Expense" 
    component = "backend"
    environment = "dev"
    name = "Expense-backend-dev-sg"
  }
}

/* 
1. command line --> -var "<var-name>=<var-value>"
2. tfvars
3. environment variables --> TF_VAR_<var-name>
4. default values in variable definitions
5. user prompt (if no default value is set) */