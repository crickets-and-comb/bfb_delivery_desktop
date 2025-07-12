#!/bin/bash
set -euo pipefail

ENV_FILE="$(dirname "$0")/../.env"

CHECKOUT_SHARED=$(grep '^CHECKOUT_SHARED=' "$ENV_FILE" | cut -d= -f2- | tr -d ' \t\r\n')

if [[ -z "$CHECKOUT_SHARED" ]]; then
  echo "❌ CHECKOUT_SHARED not found in .env"
  exit 1
fi

if [[ ! "$CHECKOUT_SHARED" =~ ^[A-Za-z0-9_=-]+$ ]]; then
  echo "❌ Invalid or unsafe CHECKOUT_SHARED token. Aborting."
  exit 1
fi

echo "✅ Using sanitized CHECKOUT_SHARED"
act workflow_call \
  -W .github/workflows/QC.yml \
  --defaultbranch main \
  --input DISABLE_ELECTRON_TESTS=true \
  --input REF_TO_CHECKOUT=refs/heads/main \
  -s CHECKOUT_SHARED="$CHECKOUT_SHARED"