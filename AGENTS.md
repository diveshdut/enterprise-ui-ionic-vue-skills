# Agent Instructions

This repository is the shared instruction set for enterprise Ionic/Vue UI
design and coding across agents.

## How to Use This Repo

1. Read the repo-local skills before designing or implementing UI.
2. Prefer the most specific skill for the task at hand.
3. Use the design skill for Figma or other design artifacts.
4. Use the Ionic/Vue coding skills for implementation, workflow selection,
   and data/state behavior.
5. Keep the instructions generic enough to work across multiple agents and
   toolchains.

## Core Skill Loading Rule

Load the relevant skills in this order when applicable:

1. `enterprise-workflow-design`
2. `ionic-vue-enterprise-patterns`
3. `ionic-vue-coding-standards`
4. `ionic-vue-data-state-patterns`

## General Guidance

- Use the richest available design input, whether that is Figma, screenshots,
  exports, PDFs, SVGs, wireframes, specs, or plain requirements.
- When a complete exact design artifact is available, implement from that
  artifact directly.
- When only requirements are available, select the closest enterprise workflow
  pattern first, then design and implement from that pattern.
- Favor core Ionic components and reusable patterns over custom one-off UI.
- Keep layouts mobile-compatible and easy to maintain.

