@test "evaluate namespaces" {
  run bash -c "kubectl get pods -l app=hello-restful -o json -n twdps-core-labs-team-prod | jq -r '.items[0].spec.containers[].name'"
  [[ "${output}" =~ "istio-proxy" ]]
}

@test "evaluate imagepull" {
  run bash -c "kubectl get pod -l app=hello-restful -n twdps-core-labs-team-prod -o json | jq -r '.items[0].status.phase'"
  [[ "${output}" =~ "Running" ]]
}
