variable "ami" {
  description = "The image to be used"
  default = "ami-06c67b49632b8f0a6"  //bitnami wordpress eu-west-1
}

variable "instance_type" { 
   description = "The AWS instance type to be used, at least t2.micro"
}