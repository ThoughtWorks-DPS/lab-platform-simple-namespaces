#!/usr/bin/env bash
set -e

ENVIRONMENT=$1

if [[ $ENVIRONMENT != "prod" ]]; then

  cat <<EOF >> preview-cluster-gateways.yaml
---
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: twdps-digital-$ENVIRONMENT-gateway
  namespace: istio-system
  labels:
    istio: istio-ingressgateway
spec:
  selector:
    app: istio-ingressgateway
  servers:
  # - port:
  #     number: 80
  #     name: http-twdps-digital-$ENVIRONMENT
  #     protocol: HTTP
  #   hosts:
  #   - "api.$ENVIRONMENT.twdps.digital"
  #   - "$ENVIRONMENT.twdps.digital"
  #   tls:
  #     httpsRedirect: true
  - port:
      number: 443
      name: https-twdps-digital-$ENVIRONMENT
      protocol: HTTPS
    hosts:
    - "api.$ENVIRONMENT.twdps.digital"
    - "$ENVIRONMENT.twdps.digital"
    tls:
      mode: SIMPLE 
      credentialName: preview-twdps-digital-$ENVIRONMENT-certificate

EOF
else
  cat <<EOF >> preview-cluster-gateways.yaml
---
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: twdps-digital-$ENVIRONMENT-gateway
  namespace: istio-system
  labels:
    istio: istio-ingressgateway
spec:
  selector:
    app: istio-ingressgateway
  servers:
  # - port:
  #     number: 80
  #     name: http-twdps-digital-$ENVIRONMENT
  #     protocol: HTTP
  #   hosts:
  #   - "api.twdps.digital"
  #   - "twdps.digital"
  #   tls:
  #     httpsRedirect: true
  - port:
      number: 443
      name: https-twdps-digital-$ENVIRONMENT
      protocol: HTTPS
    hosts:
    - "api.twdps.digital"
    - "twdps.digital"
    tls:
      mode: SIMPLE 
      credentialName: preview-twdps-digital-$ENVIRONMENT-certificate

EOF
fi

cat <<EOF >> preview-cluster-gateways.yaml
---
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: twdps-io-$ENVIRONMENT-gateway
  namespace: istio-system
  labels:
    istio: istio-ingressgateway
spec:
  selector:
    app: istio-ingressgateway
  servers:
  # - port:
  #     number: 80
  #     name: https-twdps-io-$ENVIRONMENT
  #     protocol: HTTP
  #   hosts:
  #   - "api.$ENVIRONMENT.preview.twdps.io"
  #   tls:
  #     httpsRedirect: true
  - port:
      number: 443
      name: https-twdps-io-$ENVIRONMENT
      protocol: HTTPS
    hosts:
    - "api.$ENVIRONMENT.preview.twdps.io"
    tls:
      mode: SIMPLE 
      credentialName: preview-twdps-io-$ENVIRONMENT-certificate

EOF
