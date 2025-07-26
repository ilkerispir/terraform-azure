resource "helm_release" "reportportal" {
  name             = "reportportal"
  repository       = "https://reportportal.io/kubernetes"
  chart            = "reportportal"
  namespace        = "reportportal"
  create_namespace = true
  version          = "25.7.3"

  values = [
    yamlencode({
    })
  ]
}
