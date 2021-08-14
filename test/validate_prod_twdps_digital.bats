#!/usr/bin/env bats

@test "evaluate twdps.digital ingress" {
  run bash -c "curl https://twdps.digital/httpbin/status/418"
  [[ "${output}" =~ "-=[ teapot ]=-" ]]
}

@test "evaluate twdps.digital certificate" {
  run bash -c "curl --cert-status -v https://twdps.digital/httpbin/status/418"
  [[ "${output}" =~ "SSL certificate verify ok" ]]
}
