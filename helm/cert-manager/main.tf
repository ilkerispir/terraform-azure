resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  version          = "1.17.0"

  values = [
    yamlencode({
      crds = {
        enabled = true
      }
      prometheus = {
        enabled = false
      }
    })
  ]
}
