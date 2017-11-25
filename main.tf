locals {
  ecs_cluster_name      = "${var.ecs_cluster_name}-${var.environment}-${var.service_name}"
  security_group_ecs    = "${var.security_group_ecs}-${var.environment}-${var.service_name}"
  key_pair              = "${var.key_pair}-${var.environment}-${var.service_name}"
  autoscaling_group     = "${var.autoscaling_group}-${var.environment}-${var.service_name}"
  ecr_repository_name  = "${var.ecr_repository_name}-${var.service_name}"
  launch_configuration_name_prefix = "${var.launch_configuration_name_prefix}-${var.environment}-${var.service_name}"
}

resource "aws_ecr_repository" "ecr_repository" {
  name = "${local.ecr_repository_name}"
  lifecycle {
    ignore_changes = ["name", "registry_id"]
  }
}

resource "aws_ecs_cluster" "cluster" {
  name = "${local.ecs_cluster_name}"
}

resource "aws_key_pair" "ecs_instance_key_pair" {
  key_name = "${local.key_pair}"
  public_key = "${file("${path.module}/templates/id_rsa.pub")}"
}

data "template_file" "user_data" {
  template = "${file("${path.module}/templates/user_data.sh")}"

  vars {
    cluster_name = "${local.ecs_cluster_name}"
  }
}

resource "aws_instance" "web" {
  ami                           = "${lookup(var.amis, var.region)}"
  subnet_id                     = "${var.subnets[0]}"
  instance_type                 = "${var.instance_type}"
  key_name                      = "${aws_key_pair.ecs_instance_key_pair.key_name}"
  user_data                     = "${data.template_file.user_data.rendered}"
  iam_instance_profile          = "${var.ecs_profile_id}"
  vpc_security_group_ids        = "${var.security_groups}"

  ebs_block_device {
    device_name           = "/dev/xvdcz"
    volume_size           = "${var.docker_storage_size}"
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags {
    Name = "${local.autoscaling_group}"
  }
}