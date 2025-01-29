

# Cluster Decision Resource Generator
resource "argocd_application_set" "cluster_decision_resource" {
  metadata {
    name = "prometheus-operator-crds"
  }

  spec {
    generator {
    #   cluster_decision_resource {
    #     config_map_ref = "my-configmap"
    #     name           = "quak"
    #   }
        list {
         elements =[
          {
            cluster = "in-cluster"
            url = "https://kubernetes.default.svc"
          }
         ]
        }
    }

    template {
      metadata {
        name = "{{cluster}}-prometheus-operator-crds"
      }

      spec {
        source {
          repo_url        = "https://prometheus-community.github.io/helm-charts/"
          target_revision = "6.0.0"
          chart = "prometheus-operator-crds"
        }

        destination {
          server    = "{{url}}"
          namespace = "prometheus"
        }
      }
    }
  }
}
