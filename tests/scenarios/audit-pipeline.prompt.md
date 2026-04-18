# Source Prompt

Use `$creating-observability-pipelines` to design a tool-agnostic audit-critical observability pipeline contract for `identity-api`.

Context:

- `identity-api` runs in production and emits authentication, authorization, and account recovery events.
- The pipeline is audit-critical because security and compliance teams use it to investigate access changes.
- Signals include structured logs and traces.
- Events can contain user identifiers, access tokens, session identifiers, source IPs, and account recovery evidence.
- Access tokens and raw session identifiers must not reach the audit analysis sink.
- The design must preserve actor identity, tenant, environment, event action, event result, trace correlation, source IP classification, and pipeline provenance.
- Malformed events must be quarantined, not silently dropped.
- Delivery to the audit store should tolerate a short sink outage without immediate loss.
- The pipeline itself must expose health and data-quality signals.
- Do not assume or name any specific implementation product.

Produce these artifacts:

- `PipelineIntent`
- `SignalContract`
- `PipelineTopology`
- `TransformContract`
- `RouteContract`
- `BufferDeliveryPolicy`
- `SelfObservabilityPlan`
- `ValidationPlan`
- `GeneratedArtifactManifest`
