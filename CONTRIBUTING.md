# Contributing to OpenRouter API Documentation

## Repository Structure

This is a unified monorepo for all OpenRouter API documentation and specifications.

### Source of Truth

The `api/openapi.yaml` file is the canonical OpenAPI 3.1 specification. All other
artifacts (docs, SDKs, examples) are derived from this file.

### Making Changes

1. **API Changes**: Edit files in `api/` directory only
2. **Documentation**: Edit files in `docs/` directory
3. **Examples**: Add validated examples to `api/examples/`

### Validation Requirements

All PRs must pass:
- OpenAPI syntax validation (`swagger-cli validate`)
- Spectral linting (`.spectral.yaml` ruleset)
- Example validation against schemas
- Breaking change detection (for PRs to `main`)

### Commit Convention

- `feat(api):` — New endpoints or schema additions
- `fix(api):` — Schema corrections or bug fixes
- `docs:` — Documentation-only changes
- `chore:` — Maintenance, CI, tooling

### Branch Strategy

- `main` — Production-ready spec and docs
- `v1` — Frozen v1 specification (bug fixes only)
- Feature branches — `feat/description` or `fix/description`
