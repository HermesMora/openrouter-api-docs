# OpenRouter API Specification Analysis

## Overview
- **OpenAPI Version**: 3.1.0
- **Title**: OpenRouter API
- **Version**: 1.0.0
- **Description**: OpenAI-compatible API with additional OpenRouter features
- **Total Paths**: 49
- **Total Schemas**: 591
- **Total Tags**: 23

## Servers
- `https://openrouter.ai/api/v1` - Production server

## Security
### Global Security
```json
[
  {
    "apiKey": []
  }
]
```

### Security Schemes
- **apiKey**: http (bearer) - API key as bearer token in Authorization header
- **bearer**: http (bearer) - API key as bearer token in Authorization header

## Tags
- **API Keys**: API key management endpoints
- **Analytics**: Analytics and usage endpoints
- **Anthropic Messages**: Anthropic Messages endpoints
- **BYOK**: BYOK endpoints
- **Chat**: Chat completion endpoints
- **Credits**: Credit management endpoints
- **Datasets**: Datasets endpoints
- **Embeddings**: Text embedding endpoints
- **Endpoints**: Endpoint information
- **Generations**: Generation history endpoints
- **Guardrails**: Guardrails endpoints
- **Models**: Model information endpoints
- **OAuth**: OAuth authentication endpoints
- **Observability**: Observability endpoints
- **Organization**: Organization endpoints
- **Presets**: Presets endpoints
- **Providers**: Provider information endpoints
- **Rerank**: Rerank endpoints
- **STT**: Speech-to-text endpoints
- **TTS**: Text-to-speech endpoints
- **Video Generation**: Video Generation endpoints
- **Workspaces**: Workspaces endpoints
- **beta.responses**: beta.responses endpoints

## Endpoints Summary

| Method | Path | Operation ID | Summary | Tags | Auth |
|--------|------|--------------|---------|------|------|
| GET | `/activity` | getUserActivity | Get user activity grouped by endpoint | Analytics | inherited |
| POST | `/audio/speech` | createAudioSpeech | Create speech | TTS | inherited |
| POST | `/audio/transcriptions` | createAudioTranscriptions | Create transcription | STT | inherited |
| POST | `/auth/keys` | exchangeAuthCodeForAPIKey | Exchange authorization code for API key | OAuth | inherited |
| POST | `/auth/keys/code` | createAuthKeysCode | Create authorization code | OAuth | inherited |
| GET | `/byok` | listBYOKKeys | List BYOK provider credentials | BYOK | inherited |
| POST | `/byok` | createBYOKKey | Create a BYOK provider credential | BYOK | inherited |
| DELETE | `/byok/{id}` | deleteBYOKKey | Delete a BYOK provider credential | BYOK | inherited |
| GET | `/byok/{id}` | getBYOKKey | Get a BYOK provider credential | BYOK | inherited |
| PATCH | `/byok/{id}` | updateBYOKKey | Update a BYOK provider credential | BYOK | inherited |
| POST | `/chat/completions` | sendChatCompletionRequest | Create a chat completion | Chat | inherited |
| GET | `/credits` | getCredits | Get remaining credits | Credits | inherited |
| POST | `/credits/coinbase` | createCoinbaseCharge | Deprecated Coinbase Commerce charge endpoint | Credits | public |
| GET | `/datasets/rankings-daily` | getRankingsDaily | Daily token totals for top 50 models | Datasets | inherited |
| POST | `/embeddings` | createEmbeddings | Submit an embedding request | Embeddings | inherited |
| GET | `/embeddings/models` | listEmbeddingsModels | List all embeddings models | Embeddings | inherited |
| GET | `/endpoints/zdr` | listEndpointsZdr | Preview the impact of ZDR on the available endpoin | Endpoints | inherited |
| GET | `/generation` | getGeneration | Get request & usage metadata for a generation | Generations | inherited |
| GET | `/generation/content` | listGenerationContent | Get stored prompt and completion content for a gen | Generations | inherited |
| GET | `/guardrails` | listGuardrails | List guardrails | Guardrails | inherited |
| POST | `/guardrails` | createGuardrail | Create a guardrail | Guardrails | inherited |
| GET | `/guardrails/assignments/keys` | listKeyAssignments | List all key assignments | Guardrails | inherited |
| GET | `/guardrails/assignments/members` | listMemberAssignments | List all member assignments | Guardrails | inherited |
| DELETE | `/guardrails/{id}` | deleteGuardrail | Delete a guardrail | Guardrails | inherited |
| GET | `/guardrails/{id}` | getGuardrail | Get a guardrail | Guardrails | inherited |
| PATCH | `/guardrails/{id}` | updateGuardrail | Update a guardrail | Guardrails | inherited |
| GET | `/guardrails/{id}/assignments/keys` | listGuardrailKeyAssignments | List key assignments for a guardrail | Guardrails | inherited |
| POST | `/guardrails/{id}/assignments/keys` | bulkAssignKeysToGuardrail | Bulk assign keys to a guardrail | Guardrails | inherited |
| POST | `/guardrails/{id}/assignments/keys/remove` | bulkUnassignKeysFromGuardrail | Bulk unassign keys from a guardrail | Guardrails | inherited |
| GET | `/guardrails/{id}/assignments/members` | listGuardrailMemberAssignments | List member assignments for a guardrail | Guardrails | inherited |
| POST | `/guardrails/{id}/assignments/members` | bulkAssignMembersToGuardrail | Bulk assign members to a guardrail | Guardrails | inherited |
| POST | `/guardrails/{id}/assignments/members/remove` | bulkUnassignMembersFromGuardrail | Bulk unassign members from a guardrail | Guardrails | inherited |
| GET | `/key` | getCurrentKey | Get current API key | API Keys | inherited |
| GET | `/keys` | list | List API keys | API Keys | inherited |
| POST | `/keys` | createKeys | Create a new API key | API Keys | inherited |
| DELETE | `/keys/{hash}` | deleteKeys | Delete an API key | API Keys | inherited |
| GET | `/keys/{hash}` | getKey | Get a single API key | API Keys | inherited |
| PATCH | `/keys/{hash}` | updateKeys | Update an API key | API Keys | inherited |
| POST | `/messages` | createMessages | Create a message | Anthropic Messages | inherited |
| GET | `/models` | getModels | List all models and their properties | Models | inherited |
| GET | `/models/count` | listModelsCount | Get total count of available models | Models | inherited |
| GET | `/models/user` | listModelsUser | List models filtered by user provider preferences, | Models | required |
| GET | `/models/{author}/{slug}/endpoints` | listEndpoints | List all endpoints for a model | Endpoints | inherited |
| GET | `/observability/destinations` | listObservabilityDestinations | List observability destinations | Observability | inherited |
| POST | `/observability/destinations` | createObservabilityDestination | Create an observability destination | Observability | inherited |
| DELETE | `/observability/destinations/{id}` | deleteObservabilityDestination | Delete an observability destination | Observability | inherited |
| GET | `/observability/destinations/{id}` | getObservabilityDestination | Get an observability destination | Observability | inherited |
| PATCH | `/observability/destinations/{id}` | updateObservabilityDestination | Update an observability destination | Observability | inherited |
| GET | `/organization/members` | listOrganizationMembers | List organization members | Organization | inherited |
| POST | `/presets/{slug}/chat/completions` | createPresetsChatCompletions | Create a preset from a chat-completions request bo | Presets | required |
| POST | `/presets/{slug}/messages` | createPresetsMessages | Create a preset from a messages request body | Presets | required |
| POST | `/presets/{slug}/responses` | createPresetsResponses | Create a preset from a responses request body | Presets | required |
| GET | `/providers` | listProviders | List all providers | Providers | inherited |
| POST | `/rerank` | createRerank | Submit a rerank request | Rerank | inherited |
| POST | `/responses` | createResponses | Create a response | beta.responses | inherited |
| POST | `/videos` | createVideos | Submit a video generation request | Video Generation | inherited |
| GET | `/videos/models` | listVideosModels | List all video generation models | Video Generation | inherited |
| GET | `/videos/{jobId}` | getVideos | Poll video generation status | Video Generation | inherited |
| GET | `/videos/{jobId}/content` | listVideosContent | Download generated video content | Video Generation | inherited |
| GET | `/workspaces` | listWorkspaces | List workspaces | Workspaces | inherited |
| POST | `/workspaces` | createWorkspace | Create a workspace | Workspaces | inherited |
| DELETE | `/workspaces/{id}` | deleteWorkspace | Delete a workspace | Workspaces | inherited |
| GET | `/workspaces/{id}` | getWorkspace | Get a workspace | Workspaces | inherited |
| PATCH | `/workspaces/{id}` | updateWorkspace | Update a workspace | Workspaces | inherited |
| POST | `/workspaces/{id}/members/add` | bulkAddWorkspaceMembers | Bulk add members to a workspace | Workspaces | inherited |
| POST | `/workspaces/{id}/members/remove` | bulkRemoveWorkspaceMembers | Bulk remove members from a workspace | Workspaces | inherited |

## Schema Categories


### Analytics (5 schemas)
- `ActivityItem`
- `ActivityResponse`
- `RankingsDailyItem`
- `RankingsDailyMeta`
- `RankingsDailyResponse`

### Anthropic (88 schemas)
- `AnthropicAdvisorMessageUsageIteration`
- `AnthropicAdvisorToolResult`
- `AnthropicAllowedCallers`
- `AnthropicBase64ImageSource`
- `AnthropicBase64PdfSource`
- `AnthropicBaseUsageIteration`
- `AnthropicBashCodeExecutionContent`
- `AnthropicBashCodeExecutionOutput`
- `AnthropicBashCodeExecutionResult`
- `AnthropicBashCodeExecutionToolResult`
- `AnthropicBashCodeExecutionToolResultError`
- `AnthropicCacheControlDirective`
- `AnthropicCacheControlTtl`
- `AnthropicCacheCreation`
- `AnthropicCaller`
- `AnthropicCitationCharLocation`
- `AnthropicCitationCharLocationParam`
- `AnthropicCitationContentBlockLocation`
- `AnthropicCitationContentBlockLocationParam`
- `AnthropicCitationPageLocation`
- ... and 68 more

### Audio (5 schemas)
- `STTInputAudio`
- `STTRequest`
- `STTResponse`
- `STTUsage`
- `SpeechRequest`

### BYOK (2 schemas)
- `BYOKKey`
- `BYOKProviderSlug`

### CRUD Operations (1 schemas)
- `CreatedEvent`

### Chat (46 schemas)
- `ChatAssistantImages`
- `ChatAssistantMessage`
- `ChatAudioOutput`
- `ChatChoice`
- `ChatContentAudio`
- `ChatContentCacheControl`
- `ChatContentFile`
- `ChatContentImage`
- `ChatContentItems`
- `ChatContentText`
- `ChatContentVideo`
- `ChatContentVideoInput`
- `ChatDebugOptions`
- `ChatDeveloperMessage`
- `ChatFinishReasonEnum`
- `ChatFormatGrammarConfig`
- `ChatFormatJsonSchemaConfig`
- `ChatFormatPythonConfig`
- `ChatFormatTextConfig`
- `ChatFunctionTool`
- ... and 26 more

### Content (14 schemas)
- `ContentFilterAction`
- `ContentFilterBuiltinAction`
- `ContentFilterBuiltinEntry`
- `ContentFilterBuiltinEntryInput`
- `ContentFilterBuiltinSlug`
- `ContentFilterEntry`
- `ContentPartAddedEvent`
- `ContentPartAudio`
- `ContentPartDoneEvent`
- `ContentPartImage`
- `ContentPartInputAudio`
- `ContentPartInputFile`
- `ContentPartInputVideo`
- `ContentPartVideo`

### Endpoints (3 schemas)
- `EndpointInfo`
- `EndpointStatus`
- `EndpointsMetadata`

### Errors (1 schemas)
- `ErrorEvent`

### Functions (5 schemas)
- `FunctionCallArgsDeltaEvent`
- `FunctionCallArgsDoneEvent`
- `FunctionCallItem`
- `FunctionCallOutputItem`
- `FunctionTool`

### Generations (3 schemas)
- `GenerationContentData`
- `GenerationContentResponse`
- `GenerationResponse`

### Guardrails (2 schemas)
- `Guardrail`
- `GuardrailInterval`

### Keys (1 schemas)
- `KeyAssignment`

### Messages (17 schemas)
- `MessagesAdvisorToolResultBlock`
- `MessagesContentBlockDeltaEvent`
- `MessagesContentBlockStartEvent`
- `MessagesContentBlockStopEvent`
- `MessagesDeltaEvent`
- `MessagesErrorDetail`
- `MessagesErrorEvent`
- `MessagesErrorResponse`
- `MessagesMessageParam`
- `MessagesOutputConfig`
- `MessagesPingEvent`
- `MessagesRequest`
- `MessagesResult`
- `MessagesStartEvent`
- `MessagesStopEvent`
- `MessagesStreamEvents`
- `MessagesStreamingResponse`

### Models (8 schemas)
- `Model`
- `ModelArchitecture`
- `ModelGroup`
- `ModelLinks`
- `ModelName`
- `ModelsCountResponse`
- `ModelsListResponse`
- `ModelsListResponseData`

### Observability (19 schemas)
- `ObservabilityArizeDestination`
- `ObservabilityBraintrustDestination`
- `ObservabilityClickhouseDestination`
- `ObservabilityDatadogDestination`
- `ObservabilityDestination`
- `ObservabilityFilterRulesConfig`
- `ObservabilityGrafanaDestination`
- `ObservabilityLangfuseDestination`
- `ObservabilityLangsmithDestination`
- `ObservabilityNewrelicDestination`
- `ObservabilityOpikDestination`
- `ObservabilityOtelCollectorDestination`
- `ObservabilityPosthogDestination`
- `ObservabilityRampDestination`
- `ObservabilityS3Destination`
- `ObservabilitySentryDestination`
- `ObservabilitySnowflakeDestination`
- `ObservabilityWeaveDestination`
- `ObservabilityWebhookDestination`

### OpenAI (18 schemas)
- `OpenAIResponseCustomToolCall`
- `OpenAIResponseCustomToolCallOutput`
- `OpenAIResponseFunctionToolCall`
- `OpenAIResponseFunctionToolCallOutput`
- `OpenAIResponseInputMessageItem`
- `OpenAIResponsesAnnotation`
- `OpenAIResponsesImageGenCallCompleted`
- `OpenAIResponsesImageGenCallGenerating`
- `OpenAIResponsesImageGenCallInProgress`
- `OpenAIResponsesImageGenCallPartialImage`
- `OpenAIResponsesRefusalContent`
- `OpenAIResponsesResponseStatus`
- `OpenAIResponsesSearchCompleted`
- `OpenAIResponsesToolChoice`
- `OpenAIResponsesTruncation`
- `OpenAIResponsesUsage`
- `OpenAIResponsesWebSearchCallInProgress`
- `OpenAIResponsesWebSearchCallSearching`

### OpenRouter (7 schemas)
- `OpenResponsesCreatedEvent`
- `OpenResponsesInProgressEvent`
- `OpenResponsesLogProbs`
- `OpenResponsesResult`
- `OpenResponsesTopLogprobs`
- `OpenRouterMetadata`
- `OpenRouterWebSearchServerTool`

### Other (242 schemas)
- `AdvisorNestedTool`
- `AdvisorProfile`
- `AdvisorReasoning`
- `AdvisorServerToolConfig`
- `AdvisorServerTool_OpenRouter`
- `AnnotationAddedEvent`
- `ApplyPatchCallItem`
- `ApplyPatchCallOperation`
- `ApplyPatchCallOperationDiffDeltaEvent`
- `ApplyPatchCallOperationDiffDoneEvent`
- `ApplyPatchCallOutputItem`
- `ApplyPatchCallStatus`
- `ApplyPatchCreateFileOperation`
- `ApplyPatchDeleteFileOperation`
- `ApplyPatchEngineEnum`
- `ApplyPatchServerTool`
- `ApplyPatchServerToolConfig`
- `ApplyPatchServerTool_OpenRouter`
- `ApplyPatchUpdateFileOperation`
- `AutoRouterPlugin`
- ... and 222 more

### Providers (8 schemas)
- `ProviderName`
- `ProviderOptions`
- `ProviderOverloadedResponse`
- `ProviderOverloadedResponseErrorData`
- `ProviderPreferences`
- `ProviderResponse`
- `ProviderSort`
- `ProviderSortConfig`

### Reasoning (17 schemas)
- `ReasoningConfig`
- `ReasoningDeltaEvent`
- `ReasoningDetailEncrypted`
- `ReasoningDetailSummary`
- `ReasoningDetailText`
- `ReasoningDetailUnion`
- `ReasoningDoneEvent`
- `ReasoningEffort`
- `ReasoningFormat`
- `ReasoningItem`
- `ReasoningSummaryPartAddedEvent`
- `ReasoningSummaryPartDoneEvent`
- `ReasoningSummaryText`
- `ReasoningSummaryTextDeltaEvent`
- `ReasoningSummaryTextDoneEvent`
- `ReasoningSummaryVerbosity`
- `ReasoningTextContent`

### Requests (14 schemas)
- `BulkAddWorkspaceMembersRequest`
- `BulkAssignKeysRequest`
- `BulkAssignMembersRequest`
- `BulkRemoveWorkspaceMembersRequest`
- `BulkUnassignKeysRequest`
- `BulkUnassignMembersRequest`
- `CreateBYOKKeyRequest`
- `CreateGuardrailRequest`
- `CreateObservabilityDestinationRequest`
- `CreateWorkspaceRequest`
- `UpdateBYOKKeyRequest`
- `UpdateGuardrailRequest`
- `UpdateObservabilityDestinationRequest`
- `UpdateWorkspaceRequest`

### Responses (48 schemas)
- `BadGatewayResponse`
- `BadRequestResponse`
- `BulkAddWorkspaceMembersResponse`
- `BulkAssignKeysResponse`
- `BulkAssignMembersResponse`
- `BulkRemoveWorkspaceMembersResponse`
- `BulkUnassignKeysResponse`
- `BulkUnassignMembersResponse`
- `ConflictResponse`
- `CreateBYOKKeyResponse`
- `CreateGuardrailResponse`
- `CreateObservabilityDestinationResponse`
- `CreatePresetFromInferenceResponse`
- `CreateWorkspaceResponse`
- `DeleteBYOKKeyResponse`
- `DeleteGuardrailResponse`
- `DeleteObservabilityDestinationResponse`
- `DeleteWorkspaceResponse`
- `EdgeNetworkTimeoutResponse`
- `ForbiddenResponse`
- ... and 28 more

### Streaming (8 schemas)
- `StreamEvents`
- `StreamEventsResponseCompleted`
- `StreamEventsResponseFailed`
- `StreamEventsResponseIncomplete`
- `StreamEventsResponseOutputItemAdded`
- `StreamEventsResponseOutputItemDone`
- `StreamLogprob`
- `StreamLogprobTopLogprob`

### Tools (2 schemas)
- `ToolCallStatus`
- `ToolChoiceAllowed`

### Video (5 schemas)
- `VideoGenerationRequest`
- `VideoGenerationResponse`
- `VideoGenerationUsage`
- `VideoModel`
- `VideoModelsListResponse`

### Workspaces (2 schemas)
- `Workspace`
- `WorkspaceMember`

## Speakeasy Extensions

### Root-level Extensions
- `x-retry-strategy`: Exponential backoff (initialDelay: 500ms, maxAttempts: 3, maxDelay: 60000ms)
- `x-speakeasy-retries`: Speakeasy retry config (backoff exponent: 1.5, maxInterval: 60000ms, retry 5XX)

### Path-level Extensions
- `x-speakeasy-name-override`: Custom SDK method names (used on 48 endpoints)
- `x-speakeasy-max-method-params`: Limit method params (used on 2 endpoints)
- `x-speakeasy-stream-request-field`: Mark streaming field (used on 3 endpoints: chat, messages, responses)
- `x-speakeasy-pagination`: Offset/limit pagination (used on 9 list endpoints)
- `x-speakeasy-group`: SDK group name (used on 1 endpoint)
- `x-speakeasy-ignore`: Skip generation (used on 2 endpoints: coinbase, messages)
- `x-fern-ignore`: Skip Fern generation (used on 1 endpoint: coinbase)

### Schema-level Extensions
- `x-speakeasy-entity`: Entity mapping (used on 1 schema: ChatStreamChunk)
- `x-speakeasy-deprecation-message`: Deprecation notices
- `x-speakeasy-ignore`: Skip schema generation
- `x-fern-ignore`: Skip Fern schema generation
- `x-openrouter-type`: Custom OpenRouter type hint (used on 1 parameter)

## Streaming Endpoints
The following endpoints support Server-Sent Events (SSE) streaming:
- `POST /chat/completions`
- `POST /embeddings`
- `POST /messages`
- `POST /rerank`
- `POST /responses`

## Authentication Requirements
### Public Endpoints (No Auth)
- `POST /credits/coinbase` (deprecated)

### Auth Required (Global: apiKey bearer token)
All other endpoints require authentication via Bearer token in Authorization header.

### Special Cases
- `GET /models/user`: Uses `bearer` scheme specifically
- `POST /presets/{slug}/chat/completions`: Uses `apiKey` scheme specifically
- `POST /presets/{slug}/messages`: Uses `apiKey` scheme specifically
- `POST /presets/{slug}/responses`: Uses `apiKey` scheme specifically
