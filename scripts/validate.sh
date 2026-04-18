#!/usr/bin/env bash
set -euo pipefail

test -f skill/creating-observability-pipelines/SKILL.md
test -f skill/creating-observability-pipelines/agents/openai.yaml
test -f skill/creating-observability-pipelines/references/tool-agnostic-concepts.md
test -f skill/creating-observability-pipelines/references/pipeline-contract.md
test -f examples/tool-agnostic-pipeline.intent.yaml

ruby - <<'RUBY'
require "yaml"

def frontmatter(path)
  content = File.read(path)
  match = content.match(/\A---\n(.*?)\n---\n/m)
  raise "missing frontmatter in #{path}" unless match
  YAML.safe_load(match[1])
end

skill = frontmatter("skill/creating-observability-pipelines/SKILL.md")
raise "unexpected skill name" unless skill["name"] == "creating-observability-pipelines"
raise "description missing trigger" unless skill["description"].include?("Use when creating")

YAML.safe_load(File.read("skill/creating-observability-pipelines/agents/openai.yaml"))
YAML.safe_load(File.read("examples/tool-agnostic-pipeline.intent.yaml"))

puts "yaml parses"
RUBY

grep -q '\$observability-engineering' skill/creating-observability-pipelines/SKILL.md
grep -q 'source-to-sink lineage' skill/creating-observability-pipelines/SKILL.md
grep -q 'SelfObservabilityPlan' skill/creating-observability-pipelines/SKILL.md
grep -qi 'tool-agnostic' README.md
grep -qi 'tool-agnostic' skill/creating-observability-pipelines/references/tool-agnostic-concepts.md
grep -q 'PipelineIntent' skill/creating-observability-pipelines/references/pipeline-contract.md
grep -q 'rollback_path' skill/creating-observability-pipelines/references/pipeline-contract.md

echo "validation ok"
