#!/bin/sh
set -e
response="$(nc -v -w 1 ${DOCKER_IP} 19200 2>&1)"
echo "Response to attempted connection: ${response}"
if [[ ${response} == *"refused"* ]]; then
  echo "Test failed"
  exit 1
else
  echo "Test passed"
  exit 0
fi

