# Helm application
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
