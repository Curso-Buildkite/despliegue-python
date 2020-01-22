#!/usr/bin/env bash

set -euo pipefail

if [ -z "${BUILDKITE_COMMIT:-}" ]; then
  echo ":boom: \$BUILDKITE_COMMIT missing" 1>&2
  exit 1
fi

manifest="$(mktemp)"

echo '--- :kubernetes: Lanzando...'

sleep 1

echo '--- :zzz: Esperando al despliegue'

sleep 1
