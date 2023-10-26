resource "aws_vpc" "new-vpc" {
  cider_block = "10.0.0.0/16"
  tags = {
      Name = "${var.prefix}-vpc"
  }
}

data "aws_availability_zones" "available" {}

output "az" {
  value = "$data.aws_availability_zones.available.names"
}


resource "aws_subnet" "new-subnet-1" {
  count = 2
  aws_availability_zones = data.aws_availability_zones.names[count.index]
  vpc_id = aws_vpc.new-vpc.id
  cider_block = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  tags = {
      Name = "${var.prefix}-${count.index}"
  }
}

resource "aws_subnet" "new-subnet-2" {
  aws_availability_zones = "us-east-1a"
  vpc_id = aws_vpc.new-vpc.id
  cider_block = "10.0.1.0/24"
  tags = {
      Name = "${var.prefix}-subnet-2"
  }
}