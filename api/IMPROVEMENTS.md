# OpenRouter API Documentation Improvement Report

Generated from automated analysis of the OpenAPI specification.

## Executive Summary

| Metric | Value | Status |
|--------|-------|--------|
| Total Endpoints | 66 | |
| Total Schemas | 591 | |
| Total Tags | 23 | |
| Schema Description Coverage | 56.0% | NEEDS IMPROVEMENT |
| Endpoint Summary Coverage | 100% | GOOD |
| Endpoint Description Coverage | 89.4% | GOOD |
| Circular References | 0 | EXCELLENT |
| External References | 0 | EXCELLENT |
| Examples Coverage | 100% | EXCELLENT |

---

## Critical Issues

### 1. Missing Rate Limit Responses (41 endpoints)

41 authenticated endpoints are missing 429 Too Many Requests responses.
This is critical for client-side error handling.

**Affected endpoints:**
- GET /activity
- POST /audio/speech
- POST /audio/transcriptions
- POST /auth/keys/code
- GET /byok
- POST /byok
- ... (and 35 more)

**Recommendation:** Add 429 response to all authenticated endpoints.

### 2. Missing Validation Error Responses (27 endpoints)

27 POST/PUT/PATCH endpoints lack 422 Unprocessable Entity responses.

**Affected endpoints:**
- POST /audio/speech
- POST /audio/transcriptions
- POST /auth/keys
- POST /auth/keys/code
- POST /byok
- PATCH /byok/{id}
- ... (and 21 more)

**Recommendation:** Add 422 response to all endpoints with request bodies.

### 3. Schema Description Gaps (260 schemas)

44% of schemas lack descriptions, making the API harder to understand.

**Priority schemas to document:**
- ActivityItem
- ActivityResponse
- Anthropic* schemas (88 total)
- Chat* schemas (46 total)
- Output* schemas (38 total)

---

## Medium Priority Issues

### 4. Missing 403 Forbidden Responses (39 endpoints)

39 endpoints with 401 lack 403, even though the API returns 403 for insufficient permissions.

### 5. Path Parameters Without Descriptions (2)

- GET /videos/{jobId}: jobId
- GET /videos/{jobId}/content: jobId

### 6. Query Parameters Without Descriptions (3)

- GET /videos/{jobId}: jobId
- GET /videos/{jobId}/content: jobId
- GET /videos/{jobId}/content: index

### 7. Deprecated Elements Not Clearly Marked

- 1 deprecated endpoint without deprecation reason
- 5 deprecated properties without migration guidance

---

## Low Priority Improvements

### 8. Missing Headers Documentation

- Rate limit headers (X-RateLimit-Limit, X-RateLimit-Remaining, Retry-After)
- Request ID headers (X-Request-ID)

### 9. Missing Terms of Service

The info.termsOfService field is not set.

### 10. Server Variables

The server URL is hardcoded. Consider adding variables for:
- Version path
- Region (if applicable)

---

## Structural Observations

### Schema Organization
- 88 Anthropic-prefixed schemas (15% of total)
- 46 Chat-prefixed schemas
- 38 Output-prefixed schemas
- 56 schemas use allOf (composition)
- 19 schemas use discriminator (polymorphism)
- 11 schemas use anyOf, 19 use oneOf

### Security
- Global security: apiKey bearer token
- 2 public endpoints documented
- Some endpoints use custom security schemes (bearer, apiKey)

### Pagination
- 9 endpoints have x-speakeasy-pagination
- 7 list endpoints lack pagination metadata

---

## Recommendations Priority Matrix

| Priority | Issue | Effort | Impact |
|----------|-------|--------|--------|
| HIGH | Add 429 responses | Medium | High |
| HIGH | Add 422 responses | Medium | High |
| HIGH | Add schema descriptions | High | High |
| MEDIUM | Add 403 responses | Medium | Medium |
| MEDIUM | Add parameter descriptions | Low | Medium |
| MEDIUM | Add deprecation reasons | Low | Medium |
| LOW | Add rate limit headers | Low | Low |
| LOW | Add terms of service | Low | Low |
| LOW | Add server variables | Low | Low |

---

## SDK-Specific Notes

### Speakeasy Extensions
- 57 endpoints have x-speakeasy-name-override
- 9 endpoints have x-speakeasy-pagination
- 3 endpoints have x-speakeasy-stream-request-field
- 2 endpoints have x-speakeasy-max-method-params
- 2 endpoints have x-speakeasy-ignore
- 1 endpoint has x-fern-ignore

### Overlays Applied
- open-enums
- remove-rss-responses
- add-headers
- allof-simplify
- boolean-query-params
- fix-nullable-pagination

---

*Report generated from analysis of openapi.yaml*
