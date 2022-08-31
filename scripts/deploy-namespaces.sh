#!/usr/bin/env bash
set -e

teams=("twdps-core-labs-team")
namespaces=("dev" "qa" "prod")

echo '# namespaces.yaml' > namespaces.yaml

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

  done
done

kubectl apply -f namespaces.yaml
