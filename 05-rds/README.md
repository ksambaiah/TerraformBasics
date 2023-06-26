# RDS

AWS RDS is a managed service for relational database services. You can run MySQL, Oracle or PostgresSQL as backend. You don't need EC2 instance to run RDS.

## Terraform module

Please check Terraform code to understand and configure RDS.

Let us understand the terraform settings defined here.
Storing variable names like password is not right inside a file, instead define variable as
**variable "db_password" {}** and while running terraform it will prompt for password or
**terraform apply --db-password=Secretone** we can provide.

### VPC.tf
Please notice that data.aws_availability_zones.available.names is there along with length(data.aws_availability_zones.available.names) and {element(data.aws_availability_zones.available.names, count.index)

Let us try to understand, there are datasources ([description here](https://developer.hashicorp.com/terraform/tutorials/configuration-language/data-sources) )
and [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones.html)

We need to setup aws_db_subnet_group, so rds.tf contains this settings.

More details
Links1.

 - [https://www.hiveit.co.uk/techshop/terraform-aws-vpc-example/01-getting-set-up](https://www.hiveit.co.uk/techshop/terraform-aws-vpc-example/01-getting-set-up)
 - [https://upcloud.com/resources/tutorials/terraform-variables](https://upcloud.com/resources/tutorials/terraform-variables)
