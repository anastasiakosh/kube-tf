output "grafana_url" {
  value = "Run 'minikube service prometheus-grafana -n ${var.monitoring_namespace}' to open Grafana"
}

output "argocd_url" {
  value = "Run 'minikube service argocd-server -n ${var.argocd_namespace}' to open ArgoCD"
}

output "argocd_initial_admin_password" {
  value = "kubectl -n ${var.argocd_namespace} get secret argocd-initial-admin-secret -o jsonpath={.data.password} | base64 -d"
}
