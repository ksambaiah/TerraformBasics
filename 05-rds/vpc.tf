resource "aws_vpc" "samvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "sam-vpc"
    }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = "${aws_vpc.samvpc.id}"

  tags =  {
    Name = "terraform-example-internet-gateway"
  }
}

resource "aws_route" "route" {
  route_table_id         = "${aws_vpc.samvpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gateway.id}"
}

resource "aws_subnet" "rds" {
  count                   = "${length(data.aws_availability_zones.available.names)}"
  vpc_id                  = "${aws_vpc.samvpc.id}"
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${element(data.aws_availability_zones.available.names, count.index)}"

  tags = {
    Name = "public-${element(data.aws_availability_zones.available.names, count.index)}"
  }
}


resource "aws_security_group" "default" {
  name        = "terraform_security_group"
  description = "Terraform example security group"
  vpc_id      = "${aws_vpc.samvpc.id}"

  # Allow outbound internet access.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-example-security-group"
  }
}
