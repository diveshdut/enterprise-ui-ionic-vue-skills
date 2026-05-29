# Workflow Patterns

Use this file when Figma or a design skill is unavailable and you need to
shape a UI from enterprise requirements alone. Start by matching the user's
goal to the closest family below, then use the related HotWax codebase as the
nearest proven structure. The pattern families below are intentionally generic:
they describe reusable enterprise UI shapes first, then point to HotWax
examples as implementation evidence.

## Select By User Goal

| Goal | Generic composition | Closest source pattern |
| --- | --- | --- |
| Find records and inspect one | Search/filter header, result list/cards, preserve state on return, focused detail page. | Find order, shipment, facility, product inventory detail. |
| Execute store work from a queue | Queue or worklist, status/progress cues, item detail/action area, always-reachable primary action. | Fulfillment queue/detail, receiving queue/detail, inventory count session work. |
| Scan and apply quantity changes | Prominent scan/search entry, match feedback, quantity action, progress and exception states, quick completion. | Receiving, count sessions, fulfillment packing. |
| Review demand or release allocation | Product/order list, meaningful allocation state, multi-select footer actions, audit/detail drill-in. | Preorder management and audit flows. |
| Create a new operational object | Simple create flow, summary/header, state progression, save confirmation, then return to list/detail. | Facility creation, shipment creation, production run-style object creation. |
| Configure ordered decision rules | Run/index screen, rail/editor workspace, ordered entities, filter/sort/action editing, save protection. | Brokering rules builder and routing configuration. |
| Schedule or monitor processing | Schedule state, next run/history, run-now or pause actions, job outcome detail, controlled retries. | System jobs, routing job views, job-manager monitoring patterns. |
| Inspect a release, run, or execution record | Search/list entry, execution summary, related entities, history, actions, and a path back to the index. | Shipment detail, PO detail, routing runs, operational execution views. |
| Import or export data | File intake or export trigger, validation/selection step, progress and outcome feedback, retry or review path, clear failure states. | Import app and batch import/export workflows. |
| Assist in-store ordering or endless aisle sales | Catalog/search, product detail or selection, cart/order flow, pickup or ship-to-store handoff, order-status follow-up. | BOPIS and endless aisle workflows. |
| Manage stock transfers between facilities | Search/list page, create-transfer workflow, shipment-style detail, discrepancy handling, and optional bulk upload. | Transfers app and stock transfer workflows. |
| Pick items from bins or locations | Picklist queue, bin/grouped item detail, scan-to-pick interaction, sort-by-location controls, and completion action. | Picking app and picklist execution workflows. |

## Pattern Families

## Common Building Blocks

Most workflow families are composed from a small set of reusable UI blocks:

- `Search / Filter Header`: searchbar, filter entry points, saved query state,
  and sort controls.
- `Queue / List Surface`: cards or list items that present status, identity,
  priority, and the next likely action.
- `Focused Detail Surface`: a single entity, task, or execution record with
  grouped actions and supporting context.
- `Action Footer Or Toolbar`: the main action area for completion, confirmation,
  handoff, upload, release, or save.
- `Status / Exception Layer`: chips, badges, notes, and banners that explain
  readiness, errors, variance, or blocked states.
- `Timeline / History Layer`: ordered record of important state transitions.
- `Review / Correction Layer`: a place to validate imported data, resolve
  issues, and confirm consequential actions before commit.

When designing from requirements alone, prefer recombining these blocks over
inventing a brand-new screen structure.

### 1. Find / View

Use when the user needs to search, filter, select, and inspect a single
record.

- Start with a search or filter header.
- Keep the result list concise and stateful.
- Move all non-essential detail into the record page.
- Preserve the user's previous filters and scroll position where practical.

Typical building blocks:

- Search / Filter Header
- Queue / List Surface
- Focused Detail Surface
- optional Timeline / History Layer

Best fit when the requirement sounds like:

- find order
- view shipment
- inspect facility
- review product inventory
- open detail and continue work

### 2. Queue / Execute

Use when the user works through a set of actionable items.

- Show the current queue or task set first.
- Surface the current item, its progress, and the next action.
- Keep the primary action reachable without scrolling.
- Show exceptions and blocked states before secondary metadata.

Typical building blocks:

- Queue / List Surface
- Focused Detail Surface
- Action Footer Or Toolbar
- Status / Exception Layer

Best fit when the requirement sounds like:

- fulfill orders
- receive goods
- process inventory count sessions
- work a store task queue
- complete pending work

### 3. Scan / Count / Quantity

Use when the workflow depends on scanning, matching, or adjusting quantities.

- Make scan or search input prominent.
- Show item match results immediately.
- Present quantity changes, variance, or completion feedback clearly.
- Include error, mismatch, and retry states as first-class UI.

Typical building blocks:

- Search / Filter Header or scan entry
- Focused Detail Surface
- Status / Exception Layer
- Action Footer Or Toolbar

Best fit when the requirement sounds like:

- scan item
- count inventory
- receive quantity
- adjust picked quantity
- confirm packed units

### 4. Allocation / Audit

Use when the user is reviewing demand, release eligibility, or allocation state.

- Show the list of demands or entities first.
- Use multi-select or grouped actions when release is batch-oriented.
- Make audit and detail drill-down easy.
- Keep system feedback visible after release or approval actions.

Typical building blocks:

- Queue / List Surface
- Action Footer Or Toolbar
- Status / Exception Layer
- optional Focused Detail Surface

Best fit when the requirement sounds like:

- release preorders
- audit allocations
- approve demand
- manage reservation state

### 5. Create / Register / Launch

Use when the user creates a new execution object or operational record.

- Start with the smallest required input set.
- Show the created object's identity and state progression clearly.
- Transition naturally from creation to detail or follow-up work.
- Avoid turning a simple create flow into a dense configuration editor.

Typical building blocks:

- compact form or assignment card set
- Status / Exception Layer
- Action Footer Or Toolbar
- Focused Detail Surface after creation

Best fit when the requirement sounds like:

- create facility
- create shipment
- create production run
- start a session
- register a work item

### 6. Ordered Configuration

Use when the user edits a rule set, route, schedule, or ordered entity list.

- Use an index or run screen plus a focused editor workspace.
- Make ordering, cloning, save protection, and archive state visible.
- Group schedule/history/test-drive behavior with the configuration.
- Keep the editor dense only when comparison and sequencing are truly needed.

Typical building blocks:

- Queue / List Surface or left rail
- Focused Detail Surface / editor
- Timeline / History Layer
- Action Footer Or Toolbar

Best fit when the requirement sounds like:

- routing rule builder
- order routing configuration
- scheduled job setup
- controlled test or simulation

### 7. Job Monitor / Admin Dashboard

Use when the user needs to search, inspect, and act on operational jobs or
background work.

- Keep the job list searchable and status-aware.
- Make refresh, retry, pause, or follow-up actions visible when they matter.
- Show last run, current state, and outcome in a way that supports quick triage.
- If the workflow is mobile-first, collapse into a compact status list and a
  focused detail view.

Typical building blocks:

- Search / Filter Header
- Queue / List Surface
- Status / Exception Layer
- Timeline / History Layer

Best fit when the requirement sounds like:

- view jobs
- manage background processing
- inspect job status
- retry a failed job
- monitor admin tasks

### 8. Import / Export Processing

Use when the workflow starts with a file or data payload and needs validation,
processing, status feedback and a result path.

- Make the upload or export trigger easy to find.
- Show validation, progress and processing outcome separately.
- Keep errors, row-level issues and retry/review actions visible.
- If the workflow is batch-oriented, model it like a managed process rather
  than a static document picker.

Typical building blocks:

- Action Footer Or Toolbar or file intake trigger
- Review / Correction Layer
- Status / Exception Layer
- Timeline / History Layer when the process is scheduled or long-running

Best fit when the requirement sounds like:

- import data
- export data
- upload a file for processing
- review batch results
- rerun a failed import

### 9. Assisted Selling / Endless Aisle

Use when a store associate helps a shopper find products, place an order, and
route fulfillment through pickup or ship-to-store flows.

- Start from a searchable catalog or product discovery surface.
- Keep product selection, cart/order creation, and fulfillment choice in a
  single understandable path.
- Make pickup, ship-to-store, or store-fulfilled handoff state clear.
- Preserve the relationship between shopper-facing browsing and associate-facing
  order-status follow-up.

Typical building blocks:

- Search / Filter Header
- Queue / List Surface or product grid/list
- Focused Detail Surface
- Status / Exception Layer across handoff states

Best fit when the requirement sounds like:

- endless aisle
- in-store buy online pick up in store
- assisted ordering
- ship to store
- store associate creates customer order

### 10. Transfer Order Management

Use when users create, monitor, and reconcile stock transfers between
facilities.

- Start with a searchable transfer list and clear facility/status metadata.
- Keep create-transfer assignment, shipping method, planning dates, and item
  entry in one connected workflow.
- Use shipment-style detail with timeline, item status, and discrepancy
  visibility after the transfer is created.
- Treat bulk upload and discrepancy review as related transfer workflows, not
  isolated tools.

Typical building blocks:

- Search / Filter Header
- Queue / List Surface
- Focused Detail Surface
- Timeline / History Layer
- Review / Correction Layer for discrepancy or upload support

Best fit when the requirement sounds like:

- stock transfer
- create transfer order
- move stock between stores
- view shipment for transfer
- transfer discrepancies

### 11. Picking Execution

Use when pickers in a store or warehouse need to work a picklist against bins
or locations and confirm picks as they move.

- Start with a picklist queue that separates in-progress and completed work.
- Keep scan input, bin or sort grouping, and item completion close together in
  the active picking view.
- Support sort-by-location or product ordering when it reduces picker travel.
- Make complete-picklist actions explicit and guard them so incomplete work
  does not get closed accidentally.

Typical building blocks:

- Queue / List Surface
- Focused Detail Surface grouped by bin or location
- Search / Filter Header or scan entry
- Action Footer Or Toolbar
- Status / Exception Layer

Best fit when the requirement sounds like:

- picking app
- picker sees items by bin
- picklist execution
- scan to pick
- complete picklist

## Operational Flow Rules

- Make the next physical action obvious: scan, receive, count, pick, pack,
  release or complete.
- Place progress and exceptions above low-priority metadata.
- Use cards/list items and focused detail rather than dense tables on handheld
  devices.
- Keep completion or batch actions reachable without forcing long scrolling.
- When mobile is primary, use the fewest steps needed to reach the next task.
- Keep the interaction loop short: identify, act, confirm, move to the next
  unit of work.

## Management Flow Rules

- Support search/filter before rendering dense results.
- Present one authoritative status indicator and reserve detail areas for
  related quantities, dates, associations and actions.
- Use confirmation overlays for consequential changes rather than inline
  clutter.
- Keep repeated labels and values to a minimum; let one place carry the main
  decision-making signal.
- Prefer one strong primary action path over several competing action areas.

## Configuration Flow Rules

- Use a list/detail or rail/editor workspace only where comparison and ordering
  matter.
- Surface draft/active/archive state, schedule/history and unsaved changes.
- Support ordering, cloning, archiving and controlled testing only where the
  underlying configuration needs them.
- Treat a test-drive/simulation flow as stateful and potentially consequential
  when it can mutate or allocate operational data.
- Do not force simple create or search tasks into configuration editors.

## Evidence Use

- Treat the HotWax apps as evidence of which pattern families are proven, not
  as templates to copy wholesale.
- Reuse the pattern shape, action placement, and information hierarchy before
  reusing exact screen structure.
- When several examples fit, choose the one whose primary user task most
  closely matches the new requirement.
