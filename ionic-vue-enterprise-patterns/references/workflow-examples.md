# Workflow Examples

These examples show how to turn HotWax-style enterprise requirements into
repeatable Ionic/Vue workflow shapes.

## First Files To Inspect

- Fulfillment queue/detail flows: `src/App.vue` and the relevant queue/detail
  view for the workflow being implemented
- Receiving and PO detail flows: `src/views/ShipmentDetails.vue`
- Inventory count mobile flows: `src/views/SessionCountDetail.vue`
- Preorder allocation/audit flows: `src/views/orders.vue` and
  `src/views/audit.vue`
- Order routing configuration flows: `src/views/BrokeringRoute.vue`,
  `src/views/BrokeringQuery.vue`, `src/views/BrokeringRunTest.vue`
- Import and mapping flows: `src/router/index.ts`,
  `src/views/UnifiedInventory.vue`, `src/views/Inventory.vue`,
  `src/views/InventoryReview.vue`, `src/views/PurchaseOrder.vue`,
  `src/views/PurchaseOrderReview.vue`, `src/views/SavedMappings.vue`,
  `src/views/MappingDetail.vue`, `src/views/ScheduledIncomingInventory.vue`,
  `src/views/ScheduledRestock.vue`, `src/views/ScheduledRestockReview.vue`
- Transfer management flows: `src/router/index.ts`, `src/views/Tabs.vue`,
  `src/views/Transfers.vue`, `src/views/CreateOrder.vue`,
  `src/views/OrderDetail.vue`, `src/views/BulkUpload.vue`,
  `src/views/Discrepancies.vue`
- Picking execution flows: `src/router/index.ts`, `src/views/Tabs.vue`,
  `src/views/Picklists.vue`, `src/views/Picklist-Detail.vue`
- BOPIS assisted-selling flows: `src/router/index.ts`, `src/views/Catalog.vue`,
  `src/views/ProductDetail.vue`, `src/views/Orders.vue`,
  `src/views/OrderDetail.vue`, `src/views/ShipToStoreOrders.vue`

## 1. Find And View

Requirement: “Find a shipment and inspect its detail.”

Use:
- search/filter header,
- result list or cards,
- focused detail page,
- preserve list state on return.

Reference source:
- [Shipment detail and logistics flows](https://github.com/hotwax/receiving)
- [Shipment/transfer workflows](https://github.com/hotwax/fulfillment)

## 2. Queue Execution

Requirement: “Complete work from a store queue.”

Use:
- status chips,
- item cards,
- task-specific primary action,
- progress and exception messaging,
- mobile-friendly completion.

Reference source:
- [Fulfillment queue/detail patterns](https://github.com/hotwax/fulfillment)
- [Receiving task flows](https://github.com/hotwax/receiving)

## 3. Ordered Configuration

Requirement: “Build a routing/configuration editor.”

Use:
- index or run screen,
- rail/editor workspace,
- reorderable entities,
- draft/active/archive state,
- save protection,
- schedule/history or test mode if needed.

Reference source:
- [Order Routing workspace and rule editor](https://github.com/hotwax/order-routing)

## 4. Session-Based Mobile Work

Requirement: “Count inventory on a handheld device.”

Use:
- scan/search entry,
- session state,
- local progress/variance,
- clear completion and review states.

Reference source:
- [Inventory Count mobile session flow](https://github.com/hotwax/inventory-count)

## 5. Allocation And Audit

Requirement: “Release demand or review preorder allocation.”

Use:
- product/order list,
- multi-select actions,
- audit/detail drill-down,
- explicit job or release feedback.

Reference source:
- [Preorder management flows](https://github.com/hotwax/preorder)

## 6. Job Monitoring

Requirement: “Search jobs, inspect status, and retry the ones that failed.”

Use:
- status-aware job list,
- refreshable monitoring header,
- detail view for outcome, timestamps and follow-up actions,
- retry or pause only where the state machine supports it.

Reference source:
- [Job Manager admin workflows](https://github.com/hotwax/job-manager)

## 7. Import And Export Processing

Requirement: “Upload data, process it, and review the result or failures.”

Use:
- clear file intake or export trigger,
- validation and progress state,
- outcome summary and review detail,
- retry or correction path when processing fails.

Reference source:
- [Import management workflows](https://github.com/hotwax/import)

## 8. Assisted Selling And BOPIS

Requirement: “Help a store associate browse the catalog, create a customer
order, and track pickup or ship-to-store fulfillment.”

Use:
- searchable catalog or product-discovery entry,
- product selection and order creation in one connected flow,
- clear pickup or ship-to-store choice,
- order follow-up views that preserve fulfillment status and next action.

Reference source:
- [BOPIS and endless aisle workflows](https://github.com/hotwax/bopis)

## 9. Transfer Order Management

Requirement: “Create a stock transfer, track its shipment-style lifecycle, and
review discrepancies if the receiving outcome does not match.”

Use:
- searchable transfer list,
- create-transfer workflow with facility/shipping/plan assignment,
- transfer detail with timeline and item status,
- bulk upload and discrepancy review as connected supporting flows.

Reference source:
- [Transfers workflows](https://github.com/hotwax/transfers)

## 10. Picking Execution

Requirement: “Show a picker which items to pick from which bin, let them scan
products, and complete the picklist when done.”

Use:
- picklist queue with in-progress and completed separation,
- picklist detail grouped by bin or sort key,
- scan-to-pick and select-all support,
- explicit completion action with guardrails.

Reference source:
- [Picking workflows](https://github.com/hotwax/picking)
