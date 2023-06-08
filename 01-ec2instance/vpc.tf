resource "aws_vpc" "samvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "sam-vpc"
    }
}

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = "${aws_vpc.samvpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "ap-south-1a"
    tags = {
        Name = "prod-subnet-public-1"
    }
}
