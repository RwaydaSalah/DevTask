data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# نستخدم أول Subnet للاتنين
locals {
  public_subnet_id = data.aws_subnets.default.ids[0]
}
