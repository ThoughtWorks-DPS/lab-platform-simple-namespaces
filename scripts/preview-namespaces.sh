#!/usr/bin/env bash
set -e

teams=("twdps" "demo")
namespaces=("dev" "qa" "prod")

echo '# preview-cluster-namespaces.yaml' > preview-cluster-namespaces.yaml
echo '# preview-cluster-certificates.yaml' > preview-cluster-certificates.yaml
echo '# preview-cluster-gateways.yaml' > preview-cluster-gateways.yaml

for ns in ${namespaces[*]} ; do

  bash scripts/preview-certificates.sh $ns
  bash scripts/preview-gateways.sh $ns

  for team in ${teams[*]} ; do

    cat <<EOF >> preview-cluster-namespaces.yaml
---
apiVersion: v1
kind: Namespace
metadata:
  name: $team-$ns
  labels:
    istio-injection: enabled

EOF

  done
done

#kubectl apply -f preview-cluster-namespaces.yaml
#kubectl apply -f preview-cluster-certificates.yaml
#kubectl apply -f preview-cluster-gateways.yaml
