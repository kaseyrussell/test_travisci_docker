#!/usr/bin/env bash

DOCKER_IP=192.168.99.100
export DOCKER_IP

./test.sh
RET_VAR_1=$?

./test-es.sh
RET_VAR_2=$?

./test-es-v2.sh
RET_VAR_3=$?

echo ""
echo "Done testing. Return codes (0 = success):"
echo "test.sh: ${RET_VAR_1}"
echo "test-es.sh: ${RET_VAR_2}"
echo "test-es-v2.sh: ${RET_VAR_3}"
exit 0

