#!/usr/bin/env bash

set -ex

cd "$(dirname "${BASH_SOURCE[0]}")"/../..

dhall-to-yaml --file scripts/ci/dhall/workflow.dhall --output .github/workflows/ci.yaml

yarn
yarn prettier
