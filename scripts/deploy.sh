#!/usr/bin/env bash

set -euo pipefail

if [ -z "${BUILDKITE_COMMIT:-}" ]; then
  echo ":boom: \$DOCKER_IMAGE missing" 1>&2
  exit 1
fi

manifest="$(mktemp)"

echo '--- :kubernetes: Shipping'

envsubst < k8s/app.yml > "${manifest}"
kubectl apply -f "${manifest}"

echo '--- :zzz: Waiting for deployment'
kubectl wait --for condition=available --timeout=300s -f "${manifest}"
