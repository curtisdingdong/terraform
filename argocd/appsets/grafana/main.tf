

# Cluster Decision Resource Generator
resource "argocd_application_set" "app-set-grafana" {
  metadata {
    name = "app-set-grafana"
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
        name = "{{cluster}}-app-set-grafana"
      }

      spec {
        source {
          repo_url        = "https://grafana.github.io/helm-charts"
          target_revision = "6.16.14"
          chart = "grafana"
          helm{
            value_files = ["grafana-values.yaml"]
          }
        }

        destination {
          server    = "{{url}}"
          namespace = "grafana"

        
        sync_policy {
          automated {
            prune       = true
            self_heal   = true
            allow_empty = false
          }
          # Only available from ArgoCD 1.5.0 onwards
          sync_options = ["Validate=false, ServerSideApply=true,CreateNamespace=true,runePropagationPolicy=foreground,PruneLast=true"]
          retry {
            limit = "5"
            backoff {
              duration     = "5s"
              max_duration = "3m"
              factor       = "2"
            }
          }
        }

        }
      }
    }
  }
}
