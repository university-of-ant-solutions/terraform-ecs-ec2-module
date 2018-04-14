output "cluster_id" {
  value = "${aws_ecs_cluster.ecs_cluster.id}"
}

output "repository_url" {
  value = "${aws_ecr_repository.ecr_repository.repository_url}"
}

output "cluster_ec2_private_dns" {
  value = "${aws_instance.instance.private_dns}"
}

output "public_dns" {
  value = "${aws_instance.instance.public_dns}"
}

output "cluster_ec2_public_dns" {
  value = "${aws_instance.instance.public_dns}"
}
