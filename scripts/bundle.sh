#!/usr/bin/env bash
set -euo pipefail

# Bundle the OpenAPI spec into a single file
# Usage: ./scripts/bundle.sh [output-file]

OUTPUT="${1:-dist/openapi.json}"
API_DIR="$(dirname "$0")/../api"

echo "Bundling OpenAPI spec..."
mkdir -p "$(dirname "$OUTPUT")"

cd "$API_DIR"
swagger-cli bundle openapi.yaml --outfile "$OUTPUT" --type json

echo "Bundled spec written to: $OUTPUT"
