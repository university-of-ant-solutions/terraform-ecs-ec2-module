output "public_dns" {
  value = "${aws_instance.web.public_dns}"
}

output "cluster_id" {
  value = "${aws_ecs_cluster.cluster.id}"
}

output "repository_url" {
  value = "${aws_ecr_repository.ecr_repository.repository_url}"
}

output "cluster_ec2_private_dns" {
  value = "${aws_instance.web.private_dns}"
}

output "cluster_ec2_public_dns" {
  value = "${aws_instance.web.public_dns}"
}
