variable "monitoring_namespace" {
  type    = string
  default = "monitoring"
}

variable "argocd_namespace" {
  type    = string
  default = "argocd"
}

variable "prometheus_chart_version" {
  description = "Version of the Prometheus helm chart"
  type        = string
  default     = "55.0.0"
}

variable "argocd_chart_version" {
  description = "Version of the ArgoCD helm chart"
  type        = string
  default     = "5.51.0"
}
