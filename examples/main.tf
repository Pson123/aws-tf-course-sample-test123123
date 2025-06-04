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
      # public subnets are indicated by setting public key to true.
      public     = true
      az         = "eu-north-1b"
    }
  }
}