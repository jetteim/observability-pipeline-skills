# Source Prompt

Use `$creating-observability-pipelines` to design a tool-agnostic observability pipeline contract for `checkout-api`.

Context:

- `checkout-api` runs in production and supports user checkout.
- The pipeline is reliability-critical because it feeds incident response and SLO analysis.
- Signals include logs, metrics, and traces.
- Runtime logs may contain payment and authorization fields that must not reach primary analysis sinks.
- The design must preserve service ownership, environment, severity, message, trace correlation, and pipeline provenance.
- Malformed logs must be quarantined, not silently dropped.
- Delivery to the reliability store should tolerate a short sink outage without immediate loss.
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
