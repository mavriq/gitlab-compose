#!/bin/bash

set -e -u -o pipefail

echo "# $@"
exec envdir /envdir "$@"
