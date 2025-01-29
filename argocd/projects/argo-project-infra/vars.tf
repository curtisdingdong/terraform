variable "clustername" {
  default = "https://kubernetes.default.svc"
}

# namespaces 
variable "kube-system-ns" {
  type    = string
  default = "kube-system"
}

