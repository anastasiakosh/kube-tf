resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.argocd_namespace
  }
} 

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = kubernetes_namespace.argocd.metadata[0].name
  version    = var.argocd_chart_version

  set {
    name  = "server.service.type"
    value = "NodePort"
  }

  set {
    name = "server.extraArgs"
    value = "{--insecure}"
  }
}
