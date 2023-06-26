variable "AWS_REGION" {
    default = "ap-south-1"  # Aisa Pacific south 1 is Mumbai
}
variable "db_instance" {
  default = "db.t2.micro"
}


variable "rds_instance_identifier" {
   default = "terraform-mysql"
}
variable "database_name" {
   default = "terraform_test_db"
}
variable "database_password" {}

variable "database_user" {
   default = "terraform"
}

