# State And API

## State Boundaries

- Keep view-local transient controls local: selected tab, open overlay or
  short-lived input state.
- Put shared workflow state and API-mediated entities in the application's
  established store layer.
- Put transformations that produce view-ready groups, progress or status
  collections near store/service retrieval rather than duplicating them
  across templates.
- Put repeated search-result presentation mapping in shared adapter/helper
  modules or typed wrapper components rather than rebuilding it in each page.

## Service And Domain Boundaries

- Pages should orchestrate store actions, navigation, and overlay flow.
- Services should own backend request/response contracts.
- Shared domain helpers should own repeatable shaping such as search result
  titles, subtitles, thumbnails, and identifier formatting.
- Prefer a narrow typed wrapper around a generic base component when it keeps a
  domain boundary safer than a broad reusable contract.

## Date And Date-Time Boundaries

- Treat local form values, display formatting, and backend payload formatting
  as different responsibilities.
- Use one shared front-end date helper module for:
  - current local date-time values
  - current local date-only values
  - backend-to-local date-time parsing
  - backend-to-local date-only parsing
  - backend payload serialization
  - user-facing display formatting
- Keep page code free of ad hoc `new Date(...)`, `.toISOString()`, and string
  slicing for API contracts.
- Mixing date-only and date-time conversions is a common source of timezone
  bugs and confusing UX defaults.
- Keep UI state in local form-friendly values and convert to OFBiz timestamps
  only at the API/service boundary. This avoids timezone drift between user
  input, on-screen display, and backend payloads.

## Related Reference

- For lookup/reference data that depends on Ionic navigation lifecycle, read
  [lifecycle-and-lookup-loading.md](lifecycle-and-lookup-loading.md).

## Architecture Choice

- In an existing application, follow its state architecture and shared API
  helpers unless the request explicitly includes migration.
- For a new Ionic/Vue application aligned with the modern references, prefer
  Vue 3 Composition API, Ionic Material mode, and the shared common/theme
  infrastructure. Keep the app aligned with the repository's chosen state
  library unless the task explicitly includes migration.

## Interaction Feedback

- Pair asynchronous actions with intentional loading, failure and success
  feedback.
- Represent empty data as a usable state with a meaningful next action.
- Protect unsaved configuration changes before navigation.
- Treat destructive or operationally significant actions as confirmation or
  guarded workflows.
- For job-monitoring or admin-dashboard screens, keep the list view and the
  refreshable job state separate from the outcome, retry, pause or history
  detail view so triage stays fast and state updates remain clear.
- For import/export batch processing, keep the upload/export trigger separate
  from validation, processing progress, result review and error correction so
  the user can understand each stage of the workflow.
- For assisted-selling or BOPIS flows, keep product discovery, order-building,
  and fulfillment-status follow-up connected in the experience but separated in
  state so the workflow can move cleanly from catalog browsing to operational
  handoff.
- For stock transfer workflows, keep transfer search/filter state, in-progress
  order creation, transfer detail/timeline state, and discrepancy review
  connected in the user journey but separated in state so each stage can update
  independently without collapsing the lifecycle into one oversized page model.
- For picking workflows, keep picklist queue state, active picklist detail,
  scan/highlight feedback, sort preference, and completion status separated so
  the picker experience stays responsive while the operational state remains
  reliable.

## E2E Stability

- Treat mutable demo data and backend-integrated flows as shared state, not as
  isolated pure UI tests.
- Prefer dedicated fixtures, reset hooks, or unique records per test when the
  workflow changes backend state.
- Avoid parallel verification steps that mutate the same records, jobs,
  sessions, or environment state.
- When a test mode has real side effects, make cleanup or reset part of the
  documented workflow rather than an afterthought.
- For repeated rows and row actions, define `data-testid` values from business
  identity or association identity so Playwright does not depend on row order
  or ambiguous repeated text.
