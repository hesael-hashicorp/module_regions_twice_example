variable "aws_region_1" {
  description = "The AWS region for the first instance (e.g., us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "aws_region_2" {
  description = "The AWS region for the second instance (e.g., us-west-2)"
  type        = string
  default     = "us-west-2"
}

variable "ami_id_east" {
  description = "The AMI ID to use in the first region"
  type        = string
}

variable "ami_id_west" {
  description = "The AMI ID to use in the second region"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}
