provider "argocd" {
  server_addr = "192.168.12.100:443"
  username    = "admin"
  password    = "dK9h$N^&gSJxT!"
  insecure    = true
}


terraform {
  required_providers {
    argocd = {
      source = "argoproj-labs/argocd"

    }

  }

}
