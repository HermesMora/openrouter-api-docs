# OpenRouter API Documentation

This repository is the unified source of truth for all OpenRouter API documentation,
specifications, and SDK generation.

## Structure

```
.
├── api/
│   ├── openapi.yaml              # Canonical OpenAPI 3.1 specification
│   ├── schemas/                  # Modular schema components
│   │   ├── models/               # Core data models
│   │   ├── requests/             # Request body schemas
│   │   ├── responses/            # Response schemas
│   │   └── errors/               # Error schemas
│   ├── examples/                 # Validated request/response examples
│   ├── extensions/               # Mintlify-specific metadata
│   └── versions/                 # Versioned specs
│       └── v1/
│           └── openapi.yaml      # Frozen v1 spec
├── docs/                         # Mintlify documentation site
│   ├── mint.json                 # Mintlify configuration
│   ├── api-reference/            # Auto-generated API reference
│   ├── guides/                   # User guides and tutorials
│   └── sdks/                     # SDK documentation
├── scripts/                      # Build and validation scripts
└── .github/workflows/            # CI/CD pipelines
```

## Quick Links

- [Live Documentation](https://openrouter.ai/docs)
- [API Status](https://status.openrouter.ai)
- [Discord Community](https://discord.gg/fVyRaUDgxW)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.
