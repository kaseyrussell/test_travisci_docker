#!/bin/sh
set -e
expected="Hello World"
actual=`nc -v ${DOCKER_IP} 5001`
echo "Expecting: $expected"
echo "Server says: $actual"
if [ "$expected" != "$actual" ]; then
  echo "Test failed"
  exit 1
else
  echo "Test passed"
  exit 0
fi

