output "postgres_container_id" {
  value = docker_container.postgres.id
}

output "post_service_id" {
  value = docker_container.post_service.id
}

output "post_service_host" {
  value = docker_container.post_service.host
}
