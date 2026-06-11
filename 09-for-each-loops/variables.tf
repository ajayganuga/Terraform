variable "instances" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "domain_name" {
    default = "ajaydevops.online"
}

variable "zone_id" {
    default = "Z01319113HN74BYOHYEPD"
}
variable "ami_id" {
    default = "ami-0220d79f3f480ecf5"
}