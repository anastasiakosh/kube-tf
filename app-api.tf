resource "kubernetes_manifest" "api_application" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "api-prometheus-app"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      source = {
        repoURL        = "https://github.com/anastasiakosh/kube-tf" 
        targetRevision = "custom"
        path           = "k8s" 
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "default"
      }

      syncPolicy = {
        automated = {
          prune    = true 
          selfHeal = true 
        }
        syncOptions = ["CreateNamespace=true"]
      }
    }
  }
}
