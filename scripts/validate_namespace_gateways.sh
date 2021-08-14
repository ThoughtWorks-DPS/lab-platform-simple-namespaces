#!/usr/bin/env bash

kubectl apply -f httpbin-dev-digital-virtualservice.yaml
sleep 10
bats test/validate_dev_twdps_digital.bats

kubectl apply -f httpbin-dev-io-virtualservice.yaml
sleep 10
bats test/validate_dev_twdps_io.bats

kubectl apply -f httpbin-prod-digital-virtualservice.yaml
sleep 10
bats test/validate_prod_twdps_digital.bats

kubectl delete -f httpbin-prod-digital-virtualservice.yaml
