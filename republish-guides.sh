#!/bin/bash
set -e

export EXIT_STATUS=0

curl -O https://raw.githubusercontent.com/grails/grails-guides/master/travis/republish-guides-website.sh
chmod 777 republish-guides-website.sh

./republish-guides-website.sh || EXIT_STATUS=$?

exit $EXIT_STATUS
