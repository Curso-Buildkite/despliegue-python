#!/usr/bin/env bash

set -euo pipefail

if [ -z "${BUILDKITE_COMMIT:-}" ]; then
  echo ":boom: \$BUILDKITE_COMMIT missing" 1>&2
  exit 1
fi

manifest="$(mktemp)"

echo '--- :kubernetes: Lanzando...'

envsubst < kubernetes/deployment.yml > "${manifest}"
kubectl apply -f "${manifest}"

echo '--- :zzz: Esperando al despliegue'
kubectl wait --for condition=available --timeout=300s -f "${manifest}"
