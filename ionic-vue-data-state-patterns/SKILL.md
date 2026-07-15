---
name: ionic-vue-data-state-patterns
description: Use when the task involves Ionic Vue stores and workflow state, especially for API orchestration, persistence, async operations, offline behavior, job polling, background jobs, lookup loading, or operational side effects.
---

# Ionic Vue Data State Patterns

## Goal

Keep enterprise UI behavior understandable by placing stateful workflow logic
behind deliberate store/service boundaries and introducing complexity only
when the workflow requires it.

## Required Workflow

1. Load `ionic-vue-coding-standards` when changing UI-facing behavior.
2. Read [references/state-and-api.md](references/state-and-api.md) before
   implementing stores, retrieval, mutations, or screen orchestration.
3. Read
   [../ionic-vue-coding-standards/references/shared-search-and-adapters.md](../ionic-vue-coding-standards/references/shared-search-and-adapters.md)
   when the task includes shared search/select UI, autocomplete/entity
   pickers, or typed wrapper components.
4. Read
   [../ionic-vue-coding-standards/references/date-and-datetime-examples.md](../ionic-vue-coding-standards/references/date-and-datetime-examples.md)
   when the task includes date-only values, date-time values, `ion-datetime`,
   display formatting, or API conversion rules.
5. Read [references/lifecycle-and-lookup-loading.md](references/lifecycle-and-lookup-loading.md)
   when the task includes lookup/reference data, revisit behavior, stale
   options, or retry/refresh decisions tied to Ionic page navigation.
6. Read
   [../ionic-vue-coding-standards/references/testability-and-selectors.md](../ionic-vue-coding-standards/references/testability-and-selectors.md)
   when the task includes repeated row actions, `data-testid` hooks, or E2E
   stability concerns.
7. Read [references/state-examples.md](references/state-examples.md) when a
   concise Pinia/Vuex/store example would clarify the requested behavior.
8. Read [references/offline-and-background-work.md](references/offline-and-background-work.md)
   when the feature includes device sessions, offline data, polling, jobs,
   scheduling, or test-drive behavior.
9. Read [references/architecture-decisions.md](references/architecture-decisions.md)
   before choosing a new application-level approach.

## Rules

- Prefer Pinia for new Vue 3/Ionic Vue applications and new stateful features
  unless the user explicitly requests a different architecture.
- When extending an existing repository, preserve its established state model
  unless the task explicitly includes state migration.
- Keep API communication, backend contract parsing/formatting, domain
  transformations, and consequential workflow side effects out of templates.
- Use stores or service layers to expose view-ready state and explicit
  actions; keep components responsible for interaction and presentation.
- Keep page components focused on orchestration. Shared search adapters, typed
  wrappers, and shared helper modules should absorb repeatable domain-specific
  shaping.
- Model loading, empty, no-results, partial data, stale data, validation
  errors, saved/unsaved state, success, failure, progress, completion, and
  consequential actions deliberately.
- Model access and risk states when relevant: permission denied, read-only
  mode, offline/sync pending, conflicts, audit-required actions, and
  destructive confirmation.
- Add persistence, offline databases, device/session identity, job polling, or
  simulation state only for workflows that require those capabilities.
- For UI-sensitive refactors, serialize final verification steps that hit the
  same local app/backend state. Avoid parallel verification that can create
  false negatives or flaky failures against shared mutable state.
- When tests or demo flows mutate real backend data, make reset, fixture, or
  record-isolation strategy explicit so Playwright/E2E runs remain stable.
- Do not copy backend-specific searches, scheduling contracts, or allocation
  behavior into unrelated applications without confirming the domain contract.

## Delivery Check

- State which existing architecture is preserved or selected.
- Identify API/store boundaries and consequential side effects.
- Identify which shared helper or adapter modules own search presentation,
  date/date-time handling, and backend formatting concerns.
- Identify which lookup/reference loading strategy was selected and why.
- Identify persistence, offline, session, or background-job behavior when
  used.
- Confirm the UI communicates loading, empty/no-results, errors, permissions,
  offline/sync, progress, success, and completion.
