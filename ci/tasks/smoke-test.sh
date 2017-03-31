#!/bin/bash

apt-get update && apt-get install -y curl --allow-unauthenticated

set -ex

if [ -z $URL ]; then
  echo "URL not set"
  exit 1
fi

pushd pcf-springboot-demo-source
  echo "Running smoke tests for $URL"
  smoke-tests/bin/test $URL
popd

exit 0