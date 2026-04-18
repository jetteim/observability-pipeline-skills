# Observability Pipeline Skills

Tool-agnostic skills for creating observability pipelines from intent, contracts, and verification evidence.

## Skills

- `creating-observability-pipelines`: creates or reviews telemetry pipelines that collect, transform, route, buffer, validate, and deliver observability signals.

## Relationship To Observability Engineering

This repository is a companion to the `observability-engineering` skill.

Use `observability-engineering` when the work involves SLOs, SLIs, semantic conventions, alerts, dashboards, backend resources, or platform observability intent. Use `creating-observability-pipelines` when the work is specifically about telemetry pipeline topology, component contracts, delivery guarantees, validation, and pipeline self-observability.

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
