---
name: ionic-vue-coding-standards
description: Use when the task changes Ionic Vue UI code, screen structure, styling, component composition, or reusable view patterns in enterprise Ionic applications.
---

# Ionic Vue Coding Standards

Use this skill to keep Ionic Vue implementation work native-feeling,
maintainable, and mobile-compatible without drifting into one-off page logic
or fragile custom styling.

## Required Workflow

1. Read the `Reference Routing` section below and load the most specific
   references for the work before coding.
2. If the request describes an enterprise workflow, also load
   `ionic-vue-enterprise-patterns`.
3. If the work changes stores, API orchestration, offline behavior, persistent
   state, background tasks, or test sessions, also load
   `ionic-vue-data-state-patterns`.
4. Use the richest available design evidence:
   - If an exact Figma frame exists, inspect that frame first.
   - If the design is incomplete or pattern selection is unclear, also load
     `enterprise-workflow-design`.
   - If no design artifact exists, select the closest approved enterprise
     workflow pattern before coding.
5. Ground detailed UI decisions in the closest referenced HotWax evidence
   before finalizing field treatment, action placement, or workflow density.

## Non-Negotiable Rules

- Start from core Ionic components when they correctly express the interaction.
- Do not literalize redlines, annotation labels, or design callouts directly
  into UI elements without mapping them to an Ionic-native pattern first.
- Keep business logic out of templates and keep page files focused on
  orchestration, layout, and composition.
- Reuse existing shared components, shared CSS, theme tokens, and adapter
  helpers before adding new page-local implementations.
- Do not use inline visual styles. A narrow `:style` binding is acceptable only
  when it sets CSS custom properties on a shared class.
- Do not use `ion-grid`, `ion-row`, or `ion-col` for application layout.
- Prefer semantic theme tokens over raw colors, spacing, shadows, and radii.
- Keep repeated search/select flows strongly typed through shared adapters,
  generic base components, or tiny typed wrappers.
- Use `ion-datetime` for date and date-time entry, and keep local form values,
  display formatting, and API formatting as separate concerns.
- Add stable business-aware `data-testid` hooks for repeated rows and row
  actions.
- Build for handheld use first on store-operation workflows.
- Preserve the target application's existing architecture and shared
  components; do not perform incidental platform or state-library migrations.

## Reference Routing

- Read [references/css-and-component-reuse.md](references/css-and-component-reuse.md)
  for CSS placement, layout structure, responsive rules, and deciding when a
  pattern belongs in shared CSS versus a reusable component.
- Read [references/shared-search-and-adapters.md](references/shared-search-and-adapters.md)
  for shared search architecture, typed wrappers, shared presentation helpers,
  and adapter boundaries.
- Read [references/testability-and-selectors.md](references/testability-and-selectors.md)
  for `data-testid` strategy, repeated-row targeting, and deterministic E2E
  coverage.
- Read [references/date-and-datetime-examples.md](references/date-and-datetime-examples.md)
  for date-only versus date-time value contracts, `ion-datetime` usage, and
  display/API conversion examples.
- Read [references/anti-patterns.md](references/anti-patterns.md) for review
  traps, refactor guardrails, and common implementation mistakes.
- Read [references/code-examples.md](references/code-examples.md) for a quick
  index/sampler after loading the topic-specific reference.
- Read [references/source-evidence.md](references/source-evidence.md) when a
  recommendation needs grounding in the analyzed HotWax applications.
