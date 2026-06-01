# Design Code Mapping

This is the bridge from a design frame to the GitHub repo and first code files
to inspect. Use it after the workflow index when you need to move from Figma or
another design artifact into Ionic/Vue implementation.

## Start Here

| Design / Workflow | GitHub Repo | First Files To Inspect | Notes |
| --- | --- | --- | --- |
| Figma Enterprise Workflow Index | none | `figma-workflow-index.md` | Navigation, workflow categories, selection taxonomy, pattern cards, Design Decision Layer, component usage matrix, state checklist, and decision rules. Not an implementable screen. |
| Fulfillment / store-floor execution | [hotwax/fulfillment](https://github.com/hotwax/fulfillment) | `src/App.vue` and the relevant queue/detail view | Queue/detail composition, mobile execution, packing, completion states. |
| Receiving / PO receiving | [hotwax/receiving](https://github.com/hotwax/receiving) | `src/views/ShipmentDetails.vue`, `src/views/PurchaseOrderDetail.vue` | Scan, quantity progress, receive-all, PO detail, completion flows. |
| Cycle count / inventory session work | [hotwax/inventory-count](https://github.com/hotwax/inventory-count) | `src/views/Count.vue`, `src/views/SessionCountDetail.vue`, `src/views/CountProgressReview.vue` | Session-based handheld work, variance review, offline/device behavior. |
| Pre-order management / audit | [hotwax/preorder](https://github.com/hotwax/preorder) | `src/views/orders.vue`, `src/views/products.vue`, `src/views/audit.vue` | Allocation, multi-select actions, audit/detail drill-down. |
| Routing / configuration workspace | [hotwax/order-routing](https://github.com/hotwax/order-routing) | `src/views/BrokeringRuns.vue`, `src/views/BrokeringRoute.vue`, `src/views/BrokeringQuery.vue`, `src/views/BrokeringRunTest.vue` | Ordered rules, scheduling, history, save protection, test-drive. |
| Import / export processing | [hotwax/import](https://github.com/hotwax/import) | `src/router/index.ts`, `src/views/UnifiedInventory.vue`, `src/views/Inventory.vue`, `src/views/InventoryReview.vue`, `src/views/PurchaseOrder.vue`, `src/views/PurchaseOrderReview.vue`, `src/views/SavedMappings.vue`, `src/views/MappingDetail.vue`, `src/views/ScheduledIncomingInventory.vue`, `src/views/ScheduledRestock.vue`, `src/views/ScheduledRestockReview.vue` | Exact import workflow views for upload type selection, CSV mapping, review, saved mappings, and scheduled inventory processing. |
| Endless aisle / BOPIS assisted selling | [hotwax/bopis](https://github.com/hotwax/bopis) | `src/router/index.ts`, `src/views/Tabs.vue`, `src/views/Catalog.vue`, `src/views/ProductDetail.vue`, `src/views/Orders.vue`, `src/views/OrderDetail.vue`, `src/views/ShipToStoreOrders.vue` | Exact BOPIS navigation and workflow views for catalog discovery, order creation, order execution, and ship-to-store handoff. |
| Stock transfer order management | [hotwax/transfers](https://github.com/hotwax/transfers) | `src/router/index.ts`, `src/views/Tabs.vue`, `src/views/Transfers.vue`, `src/views/CreateOrder.vue`, `src/views/OrderDetail.vue`, `src/views/BulkUpload.vue`, `src/views/Discrepancies.vue` | Exact transfer workflow views for transfer search/listing, create-transfer flow, detail/timeline handling, bulk upload, and discrepancy review. |
| Picking execution workflow (code reference only) | [hotwax/picking](https://github.com/hotwax/picking) | `src/router/index.ts`, `src/views/Tabs.vue`, `src/views/Picklists.vue`, `src/views/Picklist-Detail.vue`, `src/views/Settings.vue` | Code-first picking reference for picklist queue, scan-driven picking detail, sort-by-bin behavior, and completion flow. No Figma reference indexed yet. |

## How To Use It

- Pick the closest design row first.
- Open the listed code files before exploring the rest of the repo.
- Treat the listed files as the shortest useful path into the implementation.
- If a workflow has no direct code match, use the nearest implemented app as a
  pattern guide and label the mapping as provisional.
- Keep the mapping at the page/workflow level. Do not try to map individual
  Figma layers to individual code lines.
