#!/usr/bin/env bats

@test "evaluate api.dev.twdps.io ingress" {
  run bash -c "curl https://api.dev.preview.twdps.io/httpbin/status/418"
  [[ "${output}" =~ "-=[ teapot ]=-" ]]
}

@test "evaluate api.dev.twdps.io certificate" {
  run bash -c "curl --cert-status -v https://api.dev.preview.twdps.io/httpbin/status/418"
  [[ "${output}" =~ "SSL certificate verify ok" ]]
}
