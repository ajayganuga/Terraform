variable "instance" {
   default     = ["mysql", "backend", "frontend"]
} 

variable "zone_id" {
  default     = "Z01319113HN74BYOHYEPD"
}

variable "domain_name" {
  default     = "ajaydevops.com"
}

variable "common_tags" {
  type        = map(string)
  default     = {
    project = "Expense" 
    component = "backend"
    environment = "dev"
  }
}