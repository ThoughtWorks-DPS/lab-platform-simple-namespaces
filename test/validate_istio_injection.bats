@test "evaluate namespaces" {
  run bash -c "kubectl get pods -l app=httpbin -o json -n twdps-core-labs-team-prod | jq -r '.items[0].spec.containers[].name'"
  [[ "${output}" =~ "istio-proxy" ]]
}
