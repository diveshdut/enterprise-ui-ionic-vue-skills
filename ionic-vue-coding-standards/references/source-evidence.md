# Source Evidence

This is a compact evidence index, not a second pattern guide. It points to the
HotWax Ionic/Vue repos that informed the standards and notes what not to copy
blindly.

| Source | Useful evidence | Do not generalize blindly |
| --- | --- | --- |
| [hotwax/fulfillment](https://github.com/hotwax/fulfillment) | Modern Vue 3, Ionic Material mode, Pinia, shared theme, responsive list/detail and packing flows. | Large views and app-specific search/config assumptions. |
| [hotwax/receiving](https://github.com/hotwax/receiving) | Scan-and-receive interactions, quantity progress, PO detail, completion actions and shared theme/components. | Vuex/Vue CLI as a new-app default. |
| [hotwax/inventory-count](https://github.com/hotwax/inventory-count) | Mobile execution flow, scan sessions, variance review, device/offline behavior and task-focused navigation. | Offline database complexity for ordinary online views. |
| [hotwax/preorder](https://github.com/hotwax/preorder) | Demand allocation, action footers, audit views, job feedback and product/order management. | Background-helper rough edges. |
| [hotwax/order-routing](https://github.com/hotwax/order-routing) | Configuration workspace, scheduling/history, ordered rules, unsaved-change handling and test-drive workflow. | Large editor structure or stale README guidance. |
| [hotwax/job-manager](https://github.com/hotwax/job-manager) | Job/search/monitoring admin flows, status-driven task visibility, operational feedback surfaces, and mobile-friendly management UI. | Treating a job dashboard like a simple static list; job monitoring often needs refresh, status, and follow-up actions. |
| [hotwax/import](https://github.com/hotwax/import) | Import/export management, batch processing feedback, validation/results review, and file-driven operational workflows. | Treating upload/import screens like static file pickers or hiding processing state. |
| [hotwax/bopis](https://github.com/hotwax/bopis) | Endless aisle, in-store assisted ordering, catalog-to-order flow, ship-to-store follow-up, and BOPIS operational handoff. | Treating assisted selling like a generic catalog or losing the order-status handoff between shopping and store fulfillment. |
| [hotwax/transfers](https://github.com/hotwax/transfers) | Stock transfer order list/detail flows, create-transfer workflow, shipment-style handoff, discrepancy review, and bulk upload support. | Treating transfer management like a simple shipment list or separating discrepancies from the transfer lifecycle too aggressively. |
| [hotwax/picking](https://github.com/hotwax/picking) | Picklist queue management, bin-oriented picklist detail, scan-to-pick interactions, item sorting, and handheld picking completion. | Treating bin-based picking like a generic order list or ignoring scan/sort/completion ergonomics for active pick work. |

Use this file to identify the source repo behind a standard, then consult the
code examples or the repo itself only for the specific pattern you need.
For concrete implementation patterns, start with
[/references/code-examples.md](/references/code-examples.md)
before opening additional repo files.

Evidence priority for implementation decisions:

1. Exact user-provided design artifact
2. Workflow family match from the skill references
3. Closest referenced HotWax repo files for that workflow
4. Current app-local examples as a secondary consistency check

Do not let a nearby local example override stronger evidence from the shared
HotWax repo set when the skills already point to a more relevant workflow.
