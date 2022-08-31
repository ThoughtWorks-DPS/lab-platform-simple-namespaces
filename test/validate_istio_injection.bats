@test "evaluate namespaces" {
  run bash -c "kubectl get pods -l app=httpbin -o json | jq -r '.items[0].spec.containers[].name'"
  [[ "${output}" =~ "istio-proxy" ]]
}
