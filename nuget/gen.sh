#!/bin/bash

set -euo pipefail

tool="bazel run @io_bazel_rules_dotnet//tools/nuget2bazel:nuget2bazel.exe --"

function install {
  package=$1
  version=$2

  repo=$(pwd)

  ${tool} add \
    -p "${repo}/nuget" \
    -b "nuget.bzl" \
    -c "nuget.json" \
    "${package}" \
    "${version}" \
    --lowest \
    --indent
}

function main() {
  rm -rf nuget/packages
  rm -f nuget/nuget.json
  rm -f nuget/nuget.bzl

  cp nuget/base.bzl nuget/nuget.bzl

  install "Grpc.AspNetCore" "2.34.0"
}

main
