resource "kubernetes_service" "post-service" {
    metadata {
      name = "post-service"
    }

    spec {
      selector = {
        "app" = "post-service"
      }

      port {
        protocol = "TCP"
        port = 8090
        target_port = 8090
      }

      type = "NodePort"
    }
}