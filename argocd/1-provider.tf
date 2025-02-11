provider "helm" {
    kubernetes {
        config_path ="~/.kube/config"
    }
}


provider "argocd" {
  server_addr = var.argocd_server
  username = var.argocd_user
  password = var.argocd_password
  insecure = true
}

terraform {
    required_providers {
        argocd = {
            source = "argoproj-labs/argocd"

        }

    }

}
