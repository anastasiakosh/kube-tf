resource "kubernetes_manifest" "api_monitor" {
  manifest = {
    apiVersion = "monitoring.coreos.com/v1"
    kind       = "ServiceMonitor"
    metadata = {
      name      = "api-metrics-monitor"
      namespace = "monitoring"
      labels = {
        release = "prometheus" 
      }
    }
    spec = {
      selector = {
        matchLabels = {
          app = "api-prometheus"
        }
      }
      endpoints = [
        {
          port     = "http"
          path     = "/metrics"
          interval = "15s"
        }
      ]
    }
  }
}

