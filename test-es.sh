#!/bin/sh
set -e

# We're not actually comparing against 'expected' because the name changes with every build.
# Instead we search for 'elasticsearch' and assume we're okay if we find it.
# I'm just leaving this var here for reference.

expected='{
  "name" : "Fantomex",
  "cluster_name" : "elasticsearch",
  "version" : {
    "number" : "2.2.0",
    "build_hash" : "8ff36d139e16f8720f2947ef62c8167a888992fe",
    "build_timestamp" : "2016-01-27T13:32:39Z",
    "build_snapshot" : false,
    "lucene_version" : "5.4.1"
  },
  "tagline" : "You Know, for Search"
}'



actual=`curl -XGET ${DOCKER_IP}:19200`
echo "Expecting: $expected"
echo "Server says: $actual"
filtered=$(grep elasticsearch <<<"${actual}")
if [ -z "${filtered}" ]; then
  echo "Test failed"
  exit 1
else
  echo "Test passed"
  exit 0
fi
