#!/bin/bash
set -euo pipefail

ENV_FILE="$(dirname "$0")/../.env"

# Extract and sanitize token from .env
CHECKOUT_SHARED=$(grep '^CHECKOUT_SHARED=' "$ENV_FILE" | cut -d= -f2- | tr -d ' \t\r\n')

if [[ -z "$CHECKOUT_SHARED" ]]; then
  echo "❌ CHECKOUT_SHARED not found in .env"
  exit 1
fi

if [[ ! "$CHECKOUT_SHARED" =~ ^[A-Za-z0-9_=-]+$ ]]; then
  echo "❌ Invalid or unsafe CHECKOUT_SHARED token. Aborting."
  exit 1
fi


REF_TO_CHECKOUT=${1:-}
if [[ -z "$REF_TO_CHECKOUT" ]]; then
  GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")
  if [[ -z "$GIT_BRANCH" ]]; then
    echo "❌ Failed to determine current Git branch. Provide REF_TO_CHECKOUT explicitly."
    exit 1
  fi
  REF_TO_CHECKOUT="refs/heads/$GIT_BRANCH"
fi

echo "✅ Using sanitized CHECKOUT_SHARED"
echo "🔁 Using ref: $REF_TO_CHECKOUT"

act workflow_call \
  -W .github/workflows/QC.yml \
  --defaultbranch main \
  --input DISABLE_ELECTRON_TESTS=true \
  --input REF_TO_CHECKOUT="$REF_TO_CHECKOUT" \
  -s CHECKOUT_SHARED="$CHECKOUT_SHARED"