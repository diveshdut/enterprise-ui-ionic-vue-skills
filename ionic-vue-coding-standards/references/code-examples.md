# Code Examples

These are compact patterns distilled from the HotWax Ionic/Vue repositories.
Use the linked source files for the full context, but keep new code smaller and
more reusable than the originals.

## First Files To Inspect

- Fulfillment: `src/App.vue`
- Receiving: `src/views/ShipmentDetails.vue`
- Inventory Count: `src/views/SessionCountDetail.vue`
- Preorder: `src/views/orders.vue`
- Order Routing: `src/views/BrokeringRoute.vue`

## 1. App Shell And Page Composition

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

## 2. Mobile Workflow Page

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

## 3. Reusable Layout Class

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

## 4. Component Reuse Over Pasted UI

If the same status card, scan block or action footer repeats, extract a shared
component instead of copying the markup into multiple views.

Example source:
- [Inventory Count `SessionCountDetail.vue`](https://github.com/hotwax/inventory-count/blob/main/src/views/SessionCountDetail.vue)
- [Preorder `orders.vue`](https://github.com/hotwax/preorder/blob/main/src/views/orders.vue)

## 5. Required Field Pattern

Use a normal Ionic field label and add a small red asterisk only when the
shared HotWax evidence shows a visible required cue. Enforce the requirement in
application validation rather than depending on browser-native affordances
alone.

Example source:
- [Fulfillment `CreateCarrier.vue`](https://github.com/hotwax/fulfillment/blob/main/src/views/CreateCarrier.vue)
- [Fulfillment `CreateShipmentMethodModal.vue`](https://github.com/hotwax/fulfillment/blob/main/src/components/CreateShipmentMethodModal.vue)
- [Fulfillment `CreateRejectionReasonModal.vue`](https://github.com/hotwax/fulfillment/blob/main/src/components/CreateRejectionReasonModal.vue)

Representative pattern:

```vue
<ion-item>
  <ion-input v-model="carrier.groupName">
    <div slot="label">Name <ion-text color="danger">*</ion-text></div>
  </ion-input>
</ion-item>
```

Representative validation follow-up:

```ts
if (!carrier.groupName?.trim()) {
  commonUtil.showToast(translate("Carrier name can not be empty."));
  return;
}
```

Avoid by default:
- `Required` badges or pills copied from design annotations
- using a select-row appearance for text or numeric inputs
- relying on `required` alone when the workflow expects submit-time validation feedback

Required non-text field pattern:

```vue
<ion-item button :detail="false" @click="openDateModal">
  <ion-label>Start date <ion-text color="danger">*</ion-text></ion-label>
  <ion-note slot="end">{{ formattedStartDate }}</ion-note>
</ion-item>
```
