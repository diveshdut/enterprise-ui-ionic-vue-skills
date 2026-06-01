---
name: ionic-vue-data-state-patterns
description: Implement or review Ionic Vue stores, API orchestration, persistence, initialization, offline/device behavior, polling, scheduled jobs, background processing, and workflow test sessions. Use when enterprise UI work changes Pinia or Vuex state, API services, asynchronous operations, caching, offline support, job feedback, or operational side effects.
---

# Ionic Vue Data State Patterns

## Goal

Keep enterprise UI behavior understandable by placing stateful workflow logic
behind deliberate store/service boundaries and introducing complexity only
when the workflow requires it.

## Required Workflow

1. Load `ionic-vue-coding-standards` when changing UI-facing behavior.
2. Read [references/state-and-api.md](references/state-and-api.md) before
   implementing stores, retrieval, mutations or screen orchestration.
3. Read [references/state-examples.md](references/state-examples.md) when a
   concise Pinia/Vuex/store example would clarify the requested behavior.
4. Read [references/offline-and-background-work.md](references/offline-and-background-work.md)
   when the feature includes device sessions, offline data, polling, jobs,
   scheduling or test-drive behavior.
5. Read [references/architecture-decisions.md](references/architecture-decisions.md)
   before choosing a new application-level approach.

## Rules

- Prefer Pinia for new Vue 3/Ionic Vue applications and new stateful features
  unless the user explicitly requests a different architecture.
- When extending an existing repository, preserve its established state model
  unless the task explicitly includes state migration.
- Keep API communication, domain transformations and workflow side effects out
  of templates.
- Use stores or service layers to expose view-ready state and explicit
  actions; keep components responsible for interaction and presentation.
- Model loading, empty, no-results, partial data, stale data, validation
  errors, saved/unsaved state, success, failure, progress, completion, and
  consequential actions deliberately.
- Model access and risk states when relevant: permission denied, read-only
  mode, offline/sync pending, conflicts, audit-required actions, and
  destructive confirmation.
- Add persistence, offline databases, device/session identity, job polling or
  simulation state only for workflows that require those capabilities.
- Do not copy backend-specific searches, scheduling contracts or allocation
  behavior into unrelated applications without confirming the domain contract.

## Delivery Check

- State which existing architecture is preserved or selected.
- Identify API/store boundaries and consequential side effects.
- Identify persistence, offline, session or background-job behavior when used.
- Confirm the UI communicates loading, empty/no-results, errors, permissions,
  offline/sync, progress, success and completion.
