# ---------------------------
# Default VPC and Subnet 
# ---------------------------

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# ---------------------------
# Local Values for Subnet IDs
# ---------------------------
locals {
  public_subnet_id = data.aws_subnets.default.ids[0]
}
