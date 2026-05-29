# State And API

## State Boundaries

- Keep view-local transient controls local: selected tab, open overlay or
  short-lived input state.
- Put shared workflow state and API-mediated entities in the application's
  established store layer.
- Put transformations that produce view-ready groups, progress or status
  collections near store/service retrieval rather than duplicating them
  across templates.

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
