# Source Prompt

Use `$creating-observability-pipelines` to extend a tool-agnostic checkout-api pipeline contract with provider adapter outputs.

Context:

- Start from an existing neutral checkout-api `PipelineIntent`, `SignalContract`, `PipelineTopology`, `TransformContract`, `RouteContract`, `BufferDeliveryPolicy`, and `SelfObservabilityPlan`.
- The source contract must remain tool-agnostic.
- Provider targets are Datadog Observability Pipelines and the Elastic ecosystem.
- Generate provider pipeline adapters for telemetry movement only: collection, transforms, routes, buffers, sinks, quarantine, validation, and pipeline self-observability.
- Do not generate SLOs, monitors, dashboards, service catalog entries, or backend observability packs; those belong to `$observability-engineering`.
- Do not assume or name any specific implementation product beyond these explicit provider targets.
- Report gaps when a provider cannot preserve the neutral delivery, replay, buffering, redaction, quarantine, or validation contract.

Produce these artifacts:

- `PipelineProviderAdapterManifest`
- `DatadogObservabilityPipelinesAdapter`
- `ElasticPipelineAdapter`
- `ProviderPipelineGeneratedArtifacts`
- `ProviderPipelineValidationPlan`
- `PipelineProviderGenerationEvidence`
