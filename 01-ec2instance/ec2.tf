resource "aws_instance" "web1" {
    ami = "${var.AMI}"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    # the Public SSH key
    key_name = "${aws_key_pair.mumbai-region-key-pair.id}"
}
// Sends your public key to the instance
resource "aws_key_pair" "mumbai-region-key-pair" {
    key_name = "mumbai-region-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
