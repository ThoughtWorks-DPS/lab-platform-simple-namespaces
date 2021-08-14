#!/usr/bin/env bats

@test "evaluate dev.twdps.digital ingress" {
  run bash -c "curl https://dev.twdps.digital/httpbin/status/418"
  [[ "${output}" =~ "-=[ teapot ]=-" ]]
}

@test "evaluate dev.twdps.digital certificate" {
  run bash -c "curl --cert-status -v https://dev.twdps.digital/httpbin/status/418"
  [[ "${output}" =~ "SSL certificate verify ok" ]]
}
