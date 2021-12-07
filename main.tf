# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1" //Ireland!
}

resource "aws_instance" "wpress" {
  ami           = var.ami 
  instance_type  = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.wpress.id
    device_index  = 0
  }

  tags = {
    Terraform   = "true"
    Name  = "test-wordpress"
  }
}

resource "aws_network_interface" "wpress" {
  subnet_id   = "subnet-0f59ce43a926f6179"

  tags = {
    Terraform   = "true"
    Name  = "primary-network-interface"
  }
}
