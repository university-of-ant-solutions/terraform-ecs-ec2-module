variable "environment" {}

variable "app_version" {}

variable "ecr_repository_name" {
  default = "ecr-repository-as1"
  description = "The name of the Amazon ECR."
}

variable "service_name" {
  description = "The name of the service."
}

variable "vpc_id" {
  description = "The VPC id"
}

# variable "allowed_cidr_blocks" {
#   default = ["0.0.0.0/0"]
# }

variable "associate_public_ip_address" {
  default = true
}

variable "docker_storage_size" {
  default = "22"
  description = "EBS Volume size in Gib that the ECS Instance uses for Docker images and metadata "
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnets" {
  type        = "list"
  description = "List of subnet ids to place the EC2 instance"
}

variable "ecs_profile_id" {}

variable "region" {}

# http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
variable "amis" {
  type = "map"
  description = "Which AMI to spawn. Defaults to the AWS ECS optimized images."
  default = {
    "us-east-2"       = "ami-64300001",
    "us-east-1"       = "ami-aff65ad2",
    "us-west-2"       = "ami-40ddb938",
    "us-west-1"       = "ami-69677709",
    "eu-west-3"	      = "ami-250eb858",  
    "eu-west-2"       = "ami-2218f945",
    "eu-west-1"       = "ami-2d386654",
    "eu-central-1"    = "ami-9fc39c74",
    "ap-northeast-2"	= "ami-9d56f9f3",
    "ap-northeast-1"  = "ami-a99d8ad5",
    "ap-southeast-2"  = "ami-efda148d",
    "ap-southeast-1"  = "ami-846144f8", # *
    "ca-central-1"    = "ami-897ff9ed",
    "ap-south-1"	    = "ami-72edc81d",
    "sa-east-1"       = "ami-4a7e2826"
  }
}

variable "security_group_ecs" {
  default = "security-group-as1"
  description = "The name of the security group for ECS cluster."
}

variable "key_pair" {
  default = "key-pair-as1"
  description = "The name of the key pair."
}

variable "autoscaling_group" {
  default = "autoscaling-group-as1"
  description = "The name of the autoscaling group for ECS cluster."
}

variable "launch_configuration_name_prefix" {
  default = "ec2-instance-as1"
}

variable "ecs_cluster_name" {
  default = "ecs-cluster-as1"
  description = "The name of the Amazon ECS cluster."
}

variable "security_groups" {
  type = "list"
}
