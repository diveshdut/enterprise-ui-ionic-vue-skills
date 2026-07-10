# Enterprise UI Ionic Vue Skills

Shared agent instructions and skills for designing and implementing enterprise
Ionic/Vue UIs across multiple coding agents.

This repository is intentionally agent-neutral. It is meant to work with
Codex, Claude Code, Cursor, and similar tools without depending on
OpenAI-specific packaging metadata.

## Repository Purpose

This repo exists to give AI agents a shared, reusable playbook for enterprise
Ionic/Vue UI design and implementation.

It is meant to narrow the gap between product managers, designers, and
engineers by letting them move from requirements to design and then to
Ionic/Vue implementation using the same enterprise pattern language.

It brings together:

- design guidance for working from Figma or other visual artifacts
- reusable enterprise workflow patterns for when no design exists
- Ionic/Vue implementation standards for building maintainable screens
- state, API, and async patterns for operational workflows

The goal is simple: help agents design and code enterprise UIs that are
consistent, reusable, mobile-friendly, and easy to extend. That is especially
useful for open-source enterprise automation platforms such as Apache OFBiz
and Moqui, and for enterprise automation apps more broadly, where contributors
need a reliable way to create enterprise UIs without inventing a new design
language for every app.

The same approach also helps headless enterprise applications: even when the
backend is separate, the frontend can still be shaped from reusable Ionic and
enterprise workflow patterns that keep the experience coherent.

## Design Workflow

The `enterprise-workflow-design` skill is the Figma-facing part of the system.
It helps agents and designers working with AI agents design enterprise UI in
Figma when the agent has Figma connector access and enough Figma quota to
inspect designs reliably.

Figma free-tier access is often too limited for repeated workflow inspection,
so a paid Figma plan is recommended when this repo is being used for active UI
design work, especially when the workflow depends on repeated inspection,
editing, or AI-assisted review.

This skill is grounded in the open-source Ionic 8 Material UI kit:

- [Ionic 8 Material UI Kit Community](https://www.figma.com/community/file/885791511781717756/ionic-8-material-ui-kit-community)

The skill uses that kit as a reference source for pre-defined Ionic components,
design patterns, and enterprise UI composition. New Figma designs should be
built by reusing those patterns rather than starting from a blank canvas.

## Coding Workflow

When a Figma design is available, the agent should inspect that design first
and then write Ionic/Vue code that follows the coding patterns and best
practices established in the HotWax Commerce open-source PWA apps.

The HotWax public GitHub organization is the implementation reference base:

- [HotWax GitHub org](https://github.com/hotwax)

Public apps with the `vue` tag are the strongest reference set for Ionic/Vue
PWA work. The agent should treat those repos as the coding baseline after it
has read the design.

If no agent-accessible Figma design is available, the agent should still try
to use the community Ionic 8 Material UI kit for design ideas and patterns
before coding from scratch.

If Figma is not accessible, the agent should ask for usable design artifacts
such as SVG, PNG, or PDF files, review them, and then code from those
artifacts.

If no design artifact is provided at all, the agent should fall back to the
written requirements and the reusable workflow patterns documented in
`ionic-vue-enterprise-patterns`, then implement the UI with the coding
standards in `ionic-vue-coding-standards`.

## What’s Inside

- `AGENTS.md` - project-level instructions for agents
- `CLAUDE.md` - Claude Code project instructions
- `enterprise-workflow-design/` - Figma and enterprise workflow design guidance for enterprise UI patterns
- `ionic-vue-coding-standards/` - Ionic/Vue implementation standards
- `ionic-vue-enterprise-patterns/` - reusable enterprise UI workflow patterns
- `ionic-vue-data-state-patterns/` - store, API, offline, and async state guidance

This repository is designed to be checked out directly into a skills
directory, or copied into an existing `./agents/skills/` location when needed.

## How To Use

1. Recommended: keep one independent checkout of this repository and use the
   sync script to copy the four skill folders into each project as needed.
2. For a single-project setup, you can also check out this repository directly
   into the target agent skills directory.
3. Copy `AGENTS.md` into the project root when you are using Codex or Cursor.
4. Copy `CLAUDE.md` into the project root when you are using Claude Code.

Example setup:

1. Keep this repository in one shared location.
2. Run `scripts/sync-agent-skills.sh` for each project that should receive the
   skills.
3. Add `AGENTS.md` or `CLAUDE.md` to a project root only when that project
   uses Codex/Cursor or Claude Code.

## Install Into Agent Skills

Use the sync script when you want to copy these four skills into a project
from one independent checkout of this repository.

```bash
./scripts/sync-agent-skills.sh /path/to/skills-source-root /path/to/project antigravity
./scripts/sync-agent-skills.sh /path/to/skills-source-root /path/to/project agents
./scripts/sync-agent-skills.sh /path/to/skills-source-root /path/to/project claude
./scripts/sync-agent-skills.sh /path/to/skills-source-root /path/to/project auto
```

Target folders by agent:

- Antigravity uses `.agent/skills/`
- Codex and Cursor use `.agents/skills/`
- Claude Code uses `.claude/skills/`

`auto` chooses the target folder from the project layout:

- if `CLAUDE.md` or `.claude/` exists, it uses `.claude/skills/`
- else if `.agent/` exists, it uses `.agent/skills/`
- otherwise it uses `.agents/skills/`

The source root should contain these folders directly:

- `enterprise-workflow-design`
- `ionic-vue-coding-standards`
- `ionic-vue-enterprise-patterns`
- `ionic-vue-data-state-patterns`

This sync script copies only the four skill folders. Copy `AGENTS.md` or
`CLAUDE.md` into the project root separately when your agent needs them.

## Skill Order

When relevant, use the skills in this order:

1. `enterprise-workflow-design`
2. `ionic-vue-enterprise-patterns`
3. `ionic-vue-coding-standards`
4. `ionic-vue-data-state-patterns`

## Supported Design Inputs

These skills are designed to work with:

- Figma files
- screenshots
- exported PNG, PDF, or SVG files
- wireframes
- design specs
- plain requirements without a design artifact

## Principles

- Prefer core Ionic components over custom UI when possible.
- Avoid inline styling and unnecessary one-off layout code.
- Keep layouts responsive and mobile compatible.
- Reuse proven enterprise workflow patterns.
- Remove duplicate information from screens.
- Favor clear, maintainable code over cleverness.

## Notes

- The `SKILL.md` files are the source of truth for agent behavior.
- This repository is designed to be portable across agent ecosystems.
