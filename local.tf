locals {
  ecs_cluster_name      = "${var.ecs_cluster_name}-${var.environment}-${var.service_name}"
  security_group_ecs    = "${var.security_group_ecs}-${var.environment}-${var.service_name}"
  key_pair              = "${var.key_pair}-${var.environment}-${var.service_name}"
  autoscaling_group     = "${var.autoscaling_group}-${var.environment}-${var.service_name}"
  ecr_repository_name   = "${var.ecr_repository_name}-${var.service_name}"
  launch_configuration_name_prefix = "${var.launch_configuration_name_prefix}-${var.environment}-${var.service_name}"
}
