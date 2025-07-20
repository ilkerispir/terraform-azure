resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  namespace  = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.11.5"

  create_namespace = true

  values = [
    yamlencode({
      controller = {
        replicaCount = 1
        ingressClassResource = {
          name    = "nginx"
          enabled = true
        }
        ingressClass = "nginx"
        config = {
          use-forwarded-headers   = "true"
          use-proxy-protocol      = "true"
          log-format-escape-json  = "true"
          log-format-upstream     = "{\"time\": \"$time_iso8601\", \"remote_addr\": \"$proxy_protocol_addr\", \"x_forwarded_for\": \"$proxy_add_x_forwarded_for\", \"request_id\": \"$req_id\", \"remote_user\": \"$remote_user\", \"bytes_sent\": $bytes_sent, \"request_time\": $request_time, \"status\": $status, \"vhost\": \"$host\", \"request_proto\": \"$server_protocol\", \"path\": \"$uri\", \"request_query\": \"$args\", \"request_length\": $request_length, \"duration\": $request_time,\"method\": \"$request_method\", \"http_referrer\": \"$http_referer\", \"http_user_agent\": \"$http_user_agent\" }"
        }
        service = {
          loadBalancerSourceRanges = ["0.0.0.0/0"]
          annotations = {
            "service.beta.kubernetes.io/azure-load-balancer-health-probe-request-path" = "/healthz"
            "service.beta.kubernetes.io/azure-load-balancer-internal"                  = "false"
          }
        }
      }
    })
  ]
}
