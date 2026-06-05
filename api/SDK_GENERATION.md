# SDK Generation

OpenRouter uses [Speakeasy](https://www.speakeasy.com/) to generate official SDKs
from the OpenAPI specification.

## Supported Languages

| Language | Package | Repository |
|----------|---------|------------|
| Python | `openrouter` | [python-sdk](https://github.com/OpenRouterTeam/python-sdk) |
| TypeScript | `@openrouter/sdk` | [typescript-sdk](https://github.com/OpenRouterTeam/typescript-sdk) |
| Go | `github.com/OpenRouterTeam/go-sdk` | [go-sdk](https://github.com/OpenRouterTeam/go-sdk) |

## Speakeasy Configuration

### Workflow (`workflow.yaml`)

```yaml
workflowVersion: 1.0.0
speakeasyVersion: 1.763.2
sources:
    OpenRouter API:
        inputs:
            - location: .speakeasy/in.openapi.yaml
        overlays:
            - location: .speakeasy/overlays/open-enums.overlay.yaml
            - location: .speakeasy/overlays/remove-rss-responses.overlay.yaml
            - location: .speakeasy/overlays/add-headers.overlay.yaml
            - location: .speakeasy/overlays/allof-simplify.overlay.yaml
            - location: .speakeasy/overlays/boolean-query-params.overlay.yaml
            - location: .speakeasy/overlays/fix-nullable-pagination.overlay.yaml
        output: .speakeasy/out.openapi.yaml
        registry:
            location: registry.speakeasyapi.dev/openrouter/sdk/open-router-chat-completions-api
targets:
    open-router:
        target: python
        source: OpenRouter API
        publish:
            pypi:
                token: $pypi_token
```

### Overlays

The spec goes through 6 overlay transformations before SDK generation:

1. **open-enums**: Allows unknown enum values (`x-speakeasy-unknown-values: allow`)
2. **remove-rss-responses**: Removes RSS/XML response types
3. **add-headers**: Injects global header params for app identification
4. **allof-simplify**: Removes redundant inline enums from `allOf`
5. **boolean-query-params**: Converts string booleans to real booleans
6. **fix-nullable-pagination**: Fixes nullable pagination params

### Generation Config (`gen.yaml`)

Key settings:
- `sdkClassName: OpenRouter`
- `maintainOpenAPIOrder: true`
- `hoistGlobalSecurity: true`
- `inferSSEOverload: true` (streaming support)
- `flattenGlobalSecurity: true`
- `allOfMergeStrategy: shallowMerge`

### CI/CD

- **Generation**: Daily cron + manual dispatch
- **Publish**: On push to main when `.speakeasy/gen.lock` changes
- **Monorepo sync**: Notifies `openrouter-web` monorepo on changes

## Custom Extensions

The spec uses several Speakeasy-specific extensions:

| Extension | Purpose | Usage |
|-----------|---------|-------|
| `x-speakeasy-name-override` | Custom SDK method names | 48 endpoints |
| `x-speakeasy-pagination` | Offset/limit pagination | 9 list endpoints |
| `x-speakeasy-stream-request-field` | Mark streaming field | 3 endpoints |
| `x-speakeasy-max-method-params` | Limit method params | 2 endpoints |
| `x-speakeasy-retries` | Retry configuration | Root level |
| `x-speakeasy-ignore` | Skip generation | 2 endpoints |
| `x-fern-ignore` | Skip Fern generation | 1 endpoint |

## Source of Truth

The canonical OpenAPI spec is maintained in the private `openrouter-web` monorepo
and synced to SDK repos via automated PRs.
