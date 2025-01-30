# # Helm application
# resource "argocd_application" "helm" {
#   metadata {
#     name      = "helm-app"
#     namespace = "argocd"
#     labels = {
#       test = "true"
#     }
#   }

#   spec {
#     destination {
#       server    = "https://kubernetes.default.svc"
#       namespace = "default"
#     }

#     source {
#       repo_url        = "https://some.chart.repo.io"
#       chart           = "mychart"
#       target_revision = "1.2.3"
#       helm {
#         release_name = "testing"
#         parameter {
#           name  = "image.tag"
#           value = "1.2.3"
#         }
#         parameter {
#           name  = "someotherparameter"
#           value = "true"
#         }
#         value_files = ["values-test.yml"]
#         values = yamlencode({
#           someparameter = {
#             enabled   = true
#             someArray = ["foo", "bar"]
#           }
#         })
#       }
#     }
#   }
# }

# # Multiple Application Sources with Helm value files from external Git repository
# resource "argocd_application" "multiple_sources" {
#   metadata {
#     name      = "helm-app-with-external-values"
#     namespace = "argocd"
#   }

#   spec {
#     project = "default"

#     source {
#       repo_url        = "https://charts.helm.sh/stable"
#       chart           = "wordpress"
#       target_revision = "9.0.3"
#       helm {
#         value_files = ["$values/helm-dependency/values.yaml"]
#       }
#     }

#     source {
#       repo_url        = "https://github.com/argoproj/argocd-example-apps.git"
#       target_revision = "HEAD"
#       ref             = "values"
#     }

#     destination {
#       server    = "https://kubernetes.default.svc"
#       namespace = "default"
#     }
#   }
# }
