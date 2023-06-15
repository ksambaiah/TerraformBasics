# AWS EC2 instance

This module covers how to create AWS EC2 instance. We outline steps to create process creating EC2 instance. We cover high level steps of creating EC2 instance.

 - Tell Terraform it needs to communicate with AWS
 - Create VPC
 - Create subnet inside VPC, make sure subnet is public subnet
 - Create internet gateway, route table. Associate route table to internet gateway
 - Create security group to allow port 22
 - Create EC2 instance with a) AMI selection b) associate security group to EC2 instance c) ssh public key to keep in EC2 instance.
 - We can keep all the above hcl in single file, instead we keep each of the above in separate file.

## Steps to run EC2 

 - terraform init
 - Once terraform files are created run *terraform plan*. Plan shows the resources terraform is going to create.
 - *terraform apply*  creates the resources according to the plan
 - *terraform destroy* destroys the resources created in the above step.
 - Terraform state file is created after terraform apply step. We cover state file in the subsequent sections.
[you can find more details in the link.](https://medium.com/@aliatakan/terraform-create-a-vpc-subnets-and-more-6ef43f0bf4c1)

## Terminology used in this section

 - VPC
 - Region
 - Network and subnets
 - AMI
 - Internet gateway
 - Security group
 - EC2 instances
