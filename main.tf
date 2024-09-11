provider "aws" {
  region = var.aws_region_1
}

provider "aws" {
  alias  = "west"
  region = var.aws_region_2
}

module "ec2_instance_east" {
  source        = "./modules/ec2-instance"
   providers     = {
    aws = aws
  }
  ami_id        = var.ami_id_east
  instance_type = var.instance_type
  instance_name = "InstanceEast"
}

module "ec2_instance_west" {
  source = "./modules/ec2-instance"
  providers = {
    aws = aws.west
  }
  ami_id        = var.ami_id_west
  instance_type = var.instance_type
  instance_name = "InstanceWest"
}

output "east_instance_id" {
  value = module.ec2_instance_east.instance_id
}

output "east_instance_public_ip" {
  value = module.ec2_instance_east.instance_public_ip
}

output "west_instance_id" {
  value = module.ec2_instance_west.instance_id
}

output "west_instance_public_ip" {
  value = module.ec2_instance_west.instance_public_ip
}
