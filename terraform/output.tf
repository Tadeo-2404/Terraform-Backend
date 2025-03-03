output "postgres_container_id" {
  value = docker_container.postgres.id
}

output "post_service_id" {
  value = docker_container.post_service.id
}

output "url" {
  value = "http://localhost:8080"
}
