#!/bin/bash
set -euo pipefail

ENV_FILE="$(dirname "$0")/../.env"

CHECKOUT_SHARED=$(grep '^CHECKOUT_SHARED=' "$ENV_FILE" | cut -d= -f2-)

act workflow_call \
  -W .github/workflows/QC.yml \
  --defaultbranch main \
  --input DISABLE_ELECTRON_TESTS=true \
  --input REF_TO_CHECKOUT=refs/heads/main \
  -s CHECKOUT_SHARED="$CHECKOUT_SHARED"