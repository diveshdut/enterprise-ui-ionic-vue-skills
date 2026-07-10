#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: sync-agent-skills.sh <source-root> <project-root> [agent-mode]

Copies the four skill folders from a source root into the matching agent
skills directory inside a project root.

agent-mode:
- auto (default): choose .claude/skills if CLAUDE.md or .claude/ exists,
  otherwise .agent/skills if .agent/ exists, otherwise .agents/skills
- antigravity: copy into .agent/skills
- agents: copy into .agents/skills
- claude: copy into .claude/skills

The four skill folders are:
- enterprise-workflow-design
- ionic-vue-coding-standards
- ionic-vue-enterprise-patterns
- ionic-vue-data-state-patterns
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

SOURCE_ROOT="${1:-}"
PROJECT_ROOT="${2:-}"
AGENT_MODE="${3:-auto}"

if [[ -z "$SOURCE_ROOT" || -z "$PROJECT_ROOT" ]]; then
  usage >&2
  exit 1
fi

skills=(
  "enterprise-workflow-design"
  "ionic-vue-coding-standards"
  "ionic-vue-enterprise-patterns"
  "ionic-vue-data-state-patterns"
)

missing=()
for skill in "${skills[@]}"; do
  if [[ ! -d "$SOURCE_ROOT/$skill" ]]; then
    missing+=("$skill")
  fi
done

if (( ${#missing[@]} > 0 )); then
  printf 'Missing skill folders in source root: %s\n' "${missing[*]}" >&2
  exit 1
fi

case "$AGENT_MODE" in
  auto)
    if [[ -f "$PROJECT_ROOT/CLAUDE.md" || -d "$PROJECT_ROOT/.claude" ]]; then
      TARGET_ROOT="$PROJECT_ROOT/.claude/skills"
    elif [[ -d "$PROJECT_ROOT/.agent" ]]; then
      TARGET_ROOT="$PROJECT_ROOT/.agent/skills"
    else
      TARGET_ROOT="$PROJECT_ROOT/.agents/skills"
    fi
    ;;
  antigravity)
    TARGET_ROOT="$PROJECT_ROOT/.agent/skills"
    ;;
  agents)
    TARGET_ROOT="$PROJECT_ROOT/.agents/skills"
    ;;
  claude)
    TARGET_ROOT="$PROJECT_ROOT/.claude/skills"
    ;;
  *)
    printf 'Unknown agent mode: %s\n' "$AGENT_MODE" >&2
    usage >&2
    exit 1
    ;;
esac

mkdir -p "$TARGET_ROOT"

for skill in "${skills[@]}"; do
  rm -rf "$TARGET_ROOT/$skill"
  cp -R "$SOURCE_ROOT/$skill" "$TARGET_ROOT/"
done

printf 'Synced %d skill folders from %s to %s (%s mode)\n' "${#skills[@]}" "$SOURCE_ROOT" "$TARGET_ROOT" "$AGENT_MODE"
