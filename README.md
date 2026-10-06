# Observability Pipeline Skills

Tool-agnostic skills for creating observability pipelines from intent, contracts, and verification evidence.

## Skills

- `creating-observability-pipelines`: creates or reviews telemetry pipelines that collect, transform, route, buffer, validate, and deliver observability signals.

## Relationship To Observability Engineering

This repository is a companion to the `observability-engineering` skill.

Use `reliability-engineering` to choose SLIs, SLO objectives and error-budget policy. Use `observability-engineering` for reviewed telemetry/query bindings, semantic conventions, alerts, dashboards and backend projections. Use `creating-observability-pipelines` for topology, component contracts, delivery guarantees, validation and pipeline self-observability.

Pipeline implementation files are treated as generated outputs. The skill intentionally starts from a neutral model so it can target any collector, routing layer, streaming system, or backend integration later.

## Install

Copy the skill into the skill directory used by your agent runtime:

```bash
mkdir -p "$HOME/.codex/skills/creating-observability-pipelines"
cp -R skill/creating-observability-pipelines/. "$HOME/.codex/skills/creating-observability-pipelines/"
```

For runtimes that read `~/.agents/skills`:

```bash
mkdir -p "$HOME/.agents/skills/creating-observability-pipelines"
cp -R skill/creating-observability-pipelines/. "$HOME/.agents/skills/creating-observability-pipelines/"
```

Restart the agent runtime after installation so the new skill metadata is loaded.

## Validate

```bash
./scripts/validate.sh
```

## Exercise

The repository includes a skill exercise for a checkout service pipeline:

- source prompt: `tests/scenarios/checkout-pipeline.prompt.md`
- expected artifact contract: `tests/scenarios/checkout-pipeline.expected.yaml`
- actual artifact result: `tests/scenarios/checkout-pipeline.actual.yaml`
- runner: `./scripts/run-exercise.sh`

Run the exercise directly:

```bash
./scripts/run-exercise.sh
```

## Skill evaluation

See [skill-evaluation.md](docs/skill-evaluation.md) for static fixture limits, synthetic scenarios and the opt-in fresh-run adapter. Offline runner tests are simulations; model-backed results are reported separately.
