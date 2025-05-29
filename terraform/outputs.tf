output "ecs_cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "service_name" {
  value = aws_ecs_service.frontend.name
}

output "security_group_id" {
  value = aws_security_group.frontend_sg.id
}

output "subnet_id" {
  value = aws_subnet.public.id
}
