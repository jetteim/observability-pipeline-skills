# Skill Exercise Report

## Scope

Target: `creating-observability-pipelines`

Exercise timestamp: `2026-04-18T20:30:52Z`

Goal: verify that the skill can turn a source prompt into tool-agnostic observability pipeline artifacts without naming or assuming a specific implementation product.

## Source Prompt

Path: `tests/scenarios/checkout-pipeline.prompt.md`

The prompt asks for a reliability-critical checkout service pipeline covering logs, metrics, traces, redaction, malformed-event quarantine, delivery resilience, rollback, and pipeline self-observability.

## Expected Artifacts

Path: `tests/scenarios/checkout-pipeline.expected.yaml`

Required artifacts:

- `PipelineIntent`
- `SignalContract`
- `PipelineTopology`
- `TransformContract`
- `RouteContract`
- `BufferDeliveryPolicy`
- `SelfObservabilityPlan`
- `ValidationPlan`
- `GeneratedArtifactManifest`

Expected content includes ownership, reliability-critical classification, tool-agnostic constraints, source-to-sink topology, redaction behavior, quarantine behavior, at-least-once delivery policy, self-observability signal names, validation checks, generated outputs, and rollback path.

## Actual Artifacts

Path: `tests/scenarios/checkout-pipeline.actual.yaml`

The actual artifact result satisfies the expected contract and adds detail for freshness, cardinality, provenance, retry policy, dashboard handoff, and generation gaps.

## Executions

Command:

```bash
./scripts/run-exercise.sh
```

Result:

```text
exercise prompt: tests/scenarios/checkout-pipeline.prompt.md
expected artifacts: tests/scenarios/checkout-pipeline.expected.yaml
actual artifacts: tests/scenarios/checkout-pipeline.actual.yaml
expected contents satisfied
exercise validation ok
```

Command:

```bash
./scripts/validate.sh
```

Result:

```text
yaml parses
exercise prompt: tests/scenarios/checkout-pipeline.prompt.md
expected artifacts: tests/scenarios/checkout-pipeline.expected.yaml
actual artifacts: tests/scenarios/checkout-pipeline.actual.yaml
expected contents satisfied
exercise validation ok
validation ok
```

Implementation-name scan:

Result: no implementation product names were found in the skill repository files checked during the exercise.

## Verification Evidence

- Target: `creating-observability-pipelines`
- Commands: `./scripts/run-exercise.sh`, `./scripts/validate.sh`
- Timestamp: `2026-04-18T20:30:52Z`
- Output path: `reports/skill-exercise-report.md`
- Metric/log/trace/event names checked: `pipeline.records.received`, `pipeline.records.emitted`, `pipeline.records.dropped`, `pipeline.records.quarantined`, `pipeline.delivery.errors`, `pipeline.buffer.occupancy`, `pipeline.buffer.oldest_item_age`, `pipeline.freshness.lag`, `pipeline.config.version`
- Rollback path: revert this repository commit and reinstall the previous skill copy

## Findings

- The skill produces the requested artifact set from a neutral source prompt.
- The `observability-engineering` handoff is represented in the actual `SelfObservabilityPlan`.
- The expected and actual artifacts keep implementation selection separate from pipeline contract design.
- Validation now covers both skill metadata and the exercise fixture.

## Recommended Actions

1. Keep `creating-observability-pipelines` as a companion workflow skill rather than merging it into `observability-engineering`.
2. Add a second exercise for a security or audit-critical pipeline, because the current exercise focuses on reliability-critical telemetry.
3. Add a migration exercise from an existing implementation config into neutral pipeline artifacts.
4. No immediate skill text update is required from this exercise; the workflow already asks for the artifact set, delivery policy, validation, rollback, and self-observability evidence.
