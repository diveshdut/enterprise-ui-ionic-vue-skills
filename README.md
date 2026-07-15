# Enterprise UI Ionic Vue Skills

Shared skills for designing and implementing enterprise Ionic/Vue UIs across
multiple agent environments.

This repository is intentionally orientation-focused and agent-neutral. Use it
to find the right root skill quickly, then follow that skill's `SKILL.md` and
focused reference docs for the actual rules.

## Source Of Truth

The `SKILL.md` file in each skill folder is the source of truth for agent
behavior. This README is only a guide to what is here, when to use it, and
where to look next.

## Start Here

Pick the first skill that matches the task:

- `enterprise-workflow-design`
  Use for Figma-driven work, design inspection, workflow selection, and
  design-to-code handoff.
- `ionic-vue-enterprise-patterns`
  Use for choosing enterprise workflow patterns, responsive structure, and
  information hierarchy when requirements or designs need interpretation.
- `ionic-vue-coding-standards`
  Use for Ionic/Vue implementation decisions around components, layout,
  styling, reusable screen structure, and focused code-side UI references.
- `ionic-vue-data-state-patterns`
  Use for stores, API boundaries, async workflow state, offline behavior, and
  lifecycle-aware data loading.

Broad reference entry points:

- Workflow index and design-code mapping:
  `enterprise-workflow-design/references/`
- Workflow patterns and responsive information design:
  `ionic-vue-enterprise-patterns/references/`
- CSS reuse, anti-patterns, code examples, and focused UI implementation refs:
  `ionic-vue-coding-standards/references/`
- State/API, lifecycle-aware lookup loading, offline/background work, and
  architecture decisions:
  `ionic-vue-data-state-patterns/references/`

Frequently useful narrow references:

- Shared search/select wrappers and adapters:
  `ionic-vue-coding-standards/references/shared-search-and-adapters.md`
- Stable selectors and E2E-sensitive repeated rows:
  `ionic-vue-coding-standards/references/testability-and-selectors.md`
- Date-only, date-time, and `ion-datetime` examples:
  `ionic-vue-coding-standards/references/date-and-datetime-examples.md`
- Lookup refresh strategy tied to Ionic navigation:
  `ionic-vue-data-state-patterns/references/lifecycle-and-lookup-loading.md`

## Repository Purpose

This repo helps agents and humans move from enterprise requirements or design
artifacts into Ionic/Vue UI work with a shared workflow and pattern language.
The root skills stay intentionally light; most detailed rules now live in the
focused references inside each skill folder.

It is meant to help agents and humans:

- design from Figma or other visual artifacts when available
- choose a proven enterprise workflow pattern when no design exists
- implement Ionic/Vue screens with reusable UI and styling conventions
- handle state, API, async, and offline behavior in a consistent way

## Repository Layout

- `enterprise-workflow-design/`
  Skill and references for design-driven workflow selection and handoff.
- `ionic-vue-enterprise-patterns/`
  Skill and references for reusable enterprise workflow patterns.
- `ionic-vue-coding-standards/`
  Skill and references for Ionic/Vue UI implementation standards and focused
  implementation references.
- `ionic-vue-data-state-patterns/`
  Skill and references for data, state, async workflow behavior, and
  lifecycle-aware lookup loading.
- `AGENTS.md`
  Project-level agent instructions for environments that read `AGENTS.md`.
- `CLAUDE.md`
  Project-level instructions for Claude Code environments.
- `scripts/sync-agent-skills.sh`
  Sync utility for copying the four skill folders into another project.

## Skill Order

When multiple skills are relevant, load them in this order:

1. `enterprise-workflow-design`
2. `ionic-vue-enterprise-patterns`
3. `ionic-vue-coding-standards`
4. `ionic-vue-data-state-patterns`

Read the matching `SKILL.md` before relying on any detailed rule or pattern.

## Install And Sync

Recommended flow:

1. Keep one shared checkout of this repository.
2. Run `scripts/sync-agent-skills.sh` to copy the four skill folders into a
   target project.
3. Copy `AGENTS.md` or `CLAUDE.md` into the target root only when that agent
   environment expects a root instruction file.

Example sync commands:

```bash
./scripts/sync-agent-skills.sh /path/to/skills-source-root /path/to/project antigravity
./scripts/sync-agent-skills.sh /path/to/skills-source-root /path/to/project agents
./scripts/sync-agent-skills.sh /path/to/skills-source-root /path/to/project claude
./scripts/sync-agent-skills.sh /path/to/skills-source-root /path/to/project auto
```

Target folders by agent:

- `antigravity` -> `.agent/skills/`
- `agents` -> `.agents/skills/`
- `claude` -> `.claude/skills/`
- `auto` -> chooses `.claude/skills/` when `CLAUDE.md` or `.claude/` exists,
  otherwise `.agent/skills/` when `.agent/` exists, otherwise
  `.agents/skills/`

The sync script copies only these four skill folders:

- `enterprise-workflow-design`
- `ionic-vue-enterprise-patterns`
- `ionic-vue-coding-standards`
- `ionic-vue-data-state-patterns`

Copy `AGENTS.md` or `CLAUDE.md` separately only when the destination project
needs those root-level instructions.
