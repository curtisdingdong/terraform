resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
#   version          = "3.35.4"
  version          = "6.0.0"


  values = [file("argocdvalues.yaml")]
}
