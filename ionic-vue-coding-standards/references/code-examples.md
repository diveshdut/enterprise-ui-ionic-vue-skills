# Code Examples

Use this file as a quick index plus a very small sampler. It is not the home
for general guidance. Load the topic-specific reference first, then use this
file only for fast pattern recall and source pointers.

## Load The Narrow Reference First

- CSS, layout, or component reuse:
  [css-and-component-reuse.md](css-and-component-reuse.md)
- Shared search/select architecture:
  [shared-search-and-adapters.md](shared-search-and-adapters.md)
- `data-testid` and deterministic E2E coverage:
  [testability-and-selectors.md](testability-and-selectors.md)
- Date and date-time field behavior:
  [date-and-datetime-examples.md](date-and-datetime-examples.md)
- Common traps and review questions:
  [anti-patterns.md](anti-patterns.md)

## Quick Source Pointers

- Fulfillment: `src/App.vue`
- Receiving: `src/views/ShipmentDetails.vue`
- Inventory Count: `src/views/SessionCountDetail.vue`
- Preorder: `src/views/orders.vue`
- Order Routing: `src/views/BrokeringRoute.vue`

## Small Sampler Only

These snippets are intentionally narrow. If a topic needs more than a quick
memory jog, return to the dedicated reference instead of expanding this file.

## App Shell

Use a minimal Ionic shell and let routing handle the view body.

Example source:
- [Fulfillment `src/App.vue`](https://github.com/hotwax/fulfillment/blob/main/src/App.vue)
- [Order Routing `src/App.vue`](https://github.com/hotwax/order-routing/blob/main/src/App.vue)

Representative pattern:

```vue
<ion-app>
  <ion-router-outlet />
</ion-app>
```

## Page Composition

Use a page header, then a single semantic content region with a task-focused
layout inside `main`/`section` wrappers.

Example source:
- [Receiving `ShipmentDetails.vue`](https://github.com/hotwax/receiving/blob/main/src/views/ShipmentDetails.vue)
- [Fulfillment `App.vue`](https://github.com/hotwax/fulfillment/blob/main/src/App.vue)

Representative pattern:

```vue
<ion-page>
  <ion-header>...</ion-header>
  <ion-content>
    <main class="page-layout">
      <section class="results">...</section>
    </main>
  </ion-content>
</ion-page>
```

## Shared Layout Class

Use shared classes for the layout, not inline style blocks or Ionic grid
utilities.

Example source:
- [Order Routing `BrokeringRoute.vue`](https://github.com/hotwax/order-routing/blob/main/src/views/BrokeringRoute.vue)

Representative pattern:

```css
.page-layout {
  display: grid;
  grid-template-columns: minmax(375px, 25%) 1fr;
}
```
