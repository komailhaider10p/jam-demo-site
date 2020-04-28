#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5ea85c8784a94d001ad3f811/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5ea85c8784a94d001ad3f811
curl -s -X POST https://api.stackbit.com/project/5ea85c8784a94d001ad3f811/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5ea85c8784a94d001ad3f811/webhook/build/publish > /dev/null
