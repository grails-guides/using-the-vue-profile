#!/bin/bash
set -e
EXIT_STATUS=0

start=`date +%s`

if [[ $EXIT_STATUS -eq 0 ]]; then
  echo "Starting client and server"
  ./gradlew bootRun -parallel > /dev/null 2>&1 &
  PID1=$!
  echo "Waiting for client and server to start"
  sleep 20
  echo "Executing tests"
  ./gradlew --rerun-tasks -Dgeb.env=chromeHeadless functional-tests:test --console=plain || EXIT_STATUS=$?
  ./gradlew --rerun-tasks -Dgeb.env=firefoxHeadless functional-tests:test --console=plain || EXIT_STATUS=$?
  killall -9 java
  killall node
fi
end=`date +%s`
runtime=$((end-start))
echo "execution took $runtime seconds"
