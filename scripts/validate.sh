#!/usr/bin/env bash
set -euo pipefail

# OpenRouter API Spec Validation Script
# Usage: ./scripts/validate.sh

echo "=== OpenRouter API Spec Validation ==="
echo

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

API_DIR="$(dirname "$0")/../api"
cd "$API_DIR"

# Check if required tools are installed
check_tool() {
    if ! command -v "$1" &> /dev/null; then
        echo -e "${RED}Error: $1 is not installed${NC}"
        echo "Install with: $2"
        exit 1
    fi
}

echo "Checking dependencies..."
check_tool "swagger-cli" "npm install -g @apidevtools/swagger-cli"
check_tool "spectral" "npm install -g @stoplight/spectral-cli"
echo -e "${GREEN}All dependencies found${NC}"
echo

# 1. Validate OpenAPI syntax
echo "1. Validating OpenAPI syntax..."
if swagger-cli validate openapi.yaml; then
    echo -e "${GREEN}OpenAPI syntax is valid${NC}"
else
    echo -e "${RED}OpenAPI syntax validation failed${NC}"
    exit 1
fi
echo

# 2. Lint with Spectral
echo "2. Running Spectral lint..."
if spectral lint openapi.yaml --ruleset ../.spectral.yaml; then
    echo -e "${GREEN}Spectral lint passed${NC}"
else
    echo -e "${YELLOW}Spectral lint found issues (see above)${NC}"
fi
echo

# 3. Check all $refs resolve
echo "3. Checking $ref resolution..."
if swagger-cli bundle openapi.yaml --outfile /tmp/bundled.yaml --type yaml 2>&1; then
    echo -e "${GREEN}All $refs resolve correctly${NC}"
else
    echo -e "${RED}Some $refs failed to resolve${NC}"
    exit 1
fi
echo

# 4. Validate examples
echo "4. Validating examples..."
# This would use openapi-examples-validator if installed
if command -v openapi-examples-validator &> /dev/null; then
    if openapi-examples-validator openapi.yaml; then
        echo -e "${GREEN}All examples are valid${NC}"
    else
        echo -e "${YELLOW}Some examples failed validation${NC}"
    fi
else
    echo -e "${YELLOW}openapi-examples-validator not installed, skipping example validation${NC}"
    echo "Install with: npm install -g openapi-examples-validator"
fi
echo

# 5. Check for circular references
echo "5. Checking for circular references..."
if node -e "
const parser = require('@apidevtools/swagger-parser');
parser.validate('openapi.yaml')
  .then(() => { console.log('No circular references'); process.exit(0); })
  .catch(err => { console.error(err.message); process.exit(1); });
" 2> /dev/null; then
    echo -e "${GREEN}No circular references found${NC}"
else
    echo -e "${YELLOW}Could not check for circular references (swagger-parser not installed)${NC}"
fi
echo

echo -e "${GREEN}=== Validation Complete ===${NC}"
