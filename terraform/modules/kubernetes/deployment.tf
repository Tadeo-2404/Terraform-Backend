resource "kubernetes_deployment" "post-serivce" {
  metadata {
    name = var.kubernetes_app_name
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        "app" = var.kubernetes_app_name
      }
    }

    template {
      metadata {
        labels = {
          "app" = var.kubernetes_app_name
        }
      }

      spec {
        container {
          name              = var.kubernetes_app_name
          image             = "pelusa0303/post-service:latest"
          image_pull_policy = "Always"
          resources {
            requests = {
              "cpu"    = "500m"
              "memory" = "50Mi"
            }

            limits = {
              "cpu"    = "800m"
              "memory" = "2Gi"
            }
          }

          port {
            container_port = 8090
          }

          env {
            name  = "SPRING_PROFILES_ACTIVE"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.post-service-secrets.metadata[0].name
                key  = "ACTIVE_PROFILE"
              }
            }
          }

          env {
            name = "DB_USER"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.post-service-secrets.metadata[0].name
                key  = "DB_USER"
              }
            }
          }

          env {
            name = "DB_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.post-service-secrets.metadata[0].name
                key  = "DB_PASSWORD"
              }
            }
          }
          env {
            name = "DB_NAME"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.post-service-secrets.metadata[0].name
                key  = "DB_NAME"
              }
            }
          }

          env {
            name = "DB_SERVER"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.post-service-secrets.metadata[0].name
                key  = "DB_SERVER"
              }
            }
          }

          env {
            name = "DB_PORT"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.post-service-secrets.metadata[0].name
                key  = "DB_PORT"
              }
            }
          }
        }
      }
    }
  }
}
