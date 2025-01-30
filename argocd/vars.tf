variable "namespace" {
    type = string
    default = "argocd"
}

variable "argocd_user"{
 type = string
}

variable "argocd_password"{
    type = string
}

variable "argocd_server"{
    type = string
}
