#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
rm -rf /tmp/bazel-disk-cache
bazel clean
bazel test //:out_dir_test
