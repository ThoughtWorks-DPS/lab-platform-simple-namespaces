#!/usr/bin/env bash
set -e

teams=("twdps-core-labs-team")
namespaces=("dev" "qa" "prod")

echo '# namespaces.yaml' > namespaces.yaml
echo '# image-pull-secrets.yaml' > image-pull-secrets.yaml
imagepull=$(op item get svc-github --fields dockerconfigjson --vault=empc-lab --format json | jq -r .value | base64 -w0)

for ns in ${namespaces[*]} ; do

  for team in ${teams[*]} ; do

    cat <<EOF >> namespaces.yaml
---
apiVersion: v1
kind: Namespace
metadata:
  name: $team-$ns
  labels:
    istio-injection: enabled

EOF

    cat <<EOF >> image-pull-secrets.yaml
---
apiVersion: v1
data:
  .dockerconfigjson: $imagepull
kind: Secret
type: kubernetes.io/dockerconfigjson
metadata:
  name: ghcr
  namespace: $team-$ns

EOF

  done
done

kubectl apply -f namespaces.yaml
kubectl apply -f image-pull-secrets.yaml

