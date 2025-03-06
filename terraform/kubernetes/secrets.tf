resource "kubernetes_secret" "post-service-secrets" {
  metadata {
    name = "post-service-secrets"
  }

  data = {
    DB_USER = base64encode("cG9zdGdyZXM=")
    DB_PASSWORD = base64encode("cG9zdGdyZXM")
    DB_NAME = base64encode("cG9zdGdyZXM=")
    DB_SERVER = base64encode("cG9zdGdyZXNxbC1kYg==")
    DB_PORT = base64encode("ODA5MA==")
    ACTIVE_PROFILE = base64encode("cHJvZA==")
  }

  type = "opaque"
}