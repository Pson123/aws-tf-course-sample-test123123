# aws-tf-course-sample-test123123
networking module created during course

This module manages the creation of VPCs and Subnets, allowing for the creation of both public and procate subnets.

Example usage:
```
module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "13-local-modules"
  }
  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-north-1a"
    }
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      public     = true
      az         = "eu-north-1b"
    }
  }
}
```