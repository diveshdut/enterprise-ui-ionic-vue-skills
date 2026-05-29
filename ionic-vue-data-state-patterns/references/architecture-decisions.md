# Architecture Decisions

| Need | Preferred decision | Evidence |
| --- | --- | --- |
| New Vue 3/Ionic Vue state | Prefer Pinia with explicit actions and persistence only as needed. | Fulfillment, Inventory Count, Order Routing. |
| Existing Vuex application | Preserve Vuex/service conventions unless migration is explicitly in scope. | Receiving, Preorder. |
| Handheld work that may be interrupted | Evaluate local persistence, session ownership and later synchronization. | Inventory Count. |
| Long-running release or processing actions | Model job status and feedback in state. | Preorder, System Jobs references. |
| Job monitoring / admin dashboard | Model refreshable status, last-run details, retry/pause feedback and outcome history separately from the list view. | Job Manager, System Jobs references. |
| Import/export batch processing | Model file intake, validation, processing status, reviewable results and retry/error feedback separately from the trigger action. | Import management workflows. |
| Assisted selling / BOPIS handoff | Model catalog/search state, in-progress order state, and pickup or ship-to-store fulfillment follow-up as related but distinct workflow slices. | BOPIS and endless aisle workflows. |
| Transfer order lifecycle | Model transfer list filters, in-progress order creation, shipment-style detail state, and discrepancy review as connected but distinct workflow slices. | Transfers app and stock transfer workflows. |
| Picking execution lifecycle | Model picklist queue state, current picklist detail, scan/highlight feedback, and completion state as related but distinct workflow slices. | Picking app and picklist execution workflows. |
| Routing/rule configuration | Model run, route, rule, schedule/history and test state separately. | Order Routing. |

## Avoid Generalizing

- Large page files are observations, not recommended architecture.
- Direct backend query shapes and environment-specific configuration are not
  reusable UI patterns.
- Offline storage, polling and session management carry cost; adopt them only
  where the user workflow makes that cost necessary.
- Pinia is the default recommendation for new Vue 3/Ionic Vue work; Vuex is
  only the right choice when preserving an existing app architecture or
  completing an explicit migration task.
