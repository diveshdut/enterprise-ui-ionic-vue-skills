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
and Moqui, where contributors need a reliable way to create enterprise UIs
without inventing a new design language for every app.

The same approach also helps headless enterprise applications: even when the
backend is separate, the frontend can still be shaped from reusable Ionic and
enterprise workflow patterns that keep the experience coherent.

## Design Workflow

The `enterprise-workflow-design` skill is the Figma-facing part of the system.
It helps agents design enterprise UI in Figma when the agent has Figma
connector access and enough Figma quota to inspect designs reliably.

Figma free-tier access is often too limited for repeated workflow inspection,
so a paid Figma plan is recommended when this repo is being used for active UI
design work.

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

1. Check out this repository into your project as `.agents/skills/`, or copy
   the four skill folders into your existing `.agents/skills/` directory.
2. Move `AGENTS.md` from its current location to the project root when you are
   using Codex or Cursor.
3. Move `CLAUDE.md` from its current location to the project root when you are
   using Claude Code.

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
