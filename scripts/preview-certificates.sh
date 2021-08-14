#!/usr/bin/env bash
set -e

ENVIRONMENT=$1

if [[ $ENVIRONMENT != "prod" ]]; then

  cat <<EOF >> preview-cluster-certificates.yaml
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: preview-twdps-digital-$ENVIRONMENT-certificate
  namespace: istio-system
spec:
  secretName: preview-twdps-digital-$ENVIRONMENT-certificate
  issuerRef:
    name: "letsencrypt-preview-issuer"
    kind: ClusterIssuer
  commonName: "$ENVIRONMENT.twdps.digital"
  dnsNames:
  - "api.$ENVIRONMENT.twdps.digital"
  - "$ENVIRONMENT.twdps.digital"

EOF
else
  cat <<EOF >> preview-cluster-certificates.yaml
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: preview-twdps-digital-$ENVIRONMENT-certificate
  namespace: istio-system
spec:
  secretName: preview-twdps-digital-$ENVIRONMENT-certificate
  issuerRef:
    name: "letsencrypt-preview-issuer"
    kind: ClusterIssuer
  commonName: "twdps.digital"
  dnsNames:
  - "api.twdps.digital"
  - "twdps.digital"

EOF
fi

cat <<EOF >> preview-cluster-certificates.yaml
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: preview-twdps-io-$ENVIRONMENT-certificate
  namespace: istio-system
spec:
  secretName: preview-twdps-io-$ENVIRONMENT-certificate
  issuerRef:
    name: "letsencrypt-preview-issuer"
    kind: ClusterIssuer
  commonName: "api.$ENVIRONMENT.preview.twdps.io"
  dnsNames:
  - "api.$ENVIRONMENT.preview.twdps.io"

EOF
