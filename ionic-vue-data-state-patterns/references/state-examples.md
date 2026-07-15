# State Examples

These are short state-management patterns distilled from the HotWax Ionic/Vue
repositories. Prefer these as reusable shapes, not as large copy-pasted files.

## First Files To Inspect

- New Pinia-style state: `src/store/orderRoutingStore.ts`
- Existing Vuex-style state: `receiving` and `preorder` store modules
- Long-running stateful actions: `src/store/orderRoutingStore.ts`
- Offline/session state: `inventory-count` local session and persistence code

## 1. Pinia Store Skeleton

Use this for new Vue 3/Ionic Vue work.

Example source:
- [Order Routing `src/store/orderRoutingStore.ts`](https://github.com/hotwax/order-routing/blob/main/src/store/orderRoutingStore.ts)

Representative pattern:

```ts
export const useExampleStore = defineStore('example', {
  state: () => ({
    items: [] as Item[],
    loading: false,
  }),
  getters: {},
  actions: {},
})
```

## 2. Existing Vuex Application

When a repository already uses Vuex, preserve that architecture instead of
migrating as incidental work.

Example source:
- [Receiving store structure](https://github.com/hotwax/receiving)
- [Preorder store structure](https://github.com/hotwax/preorder)

Representative pattern:

```ts
// Keep the existing store contract in the repo.
// Do not migrate architecture unless the task explicitly includes migration.
```

## 3. Store Action With Feedback

Wrap long-running work with loading, success and failure handling.

Example source:
- [Order Routing store actions](https://github.com/hotwax/order-routing/blob/main/src/store/orderRoutingStore.ts)
- [Preorder job-backed flows](https://github.com/hotwax/preorder)

Representative pattern:

```ts
async function saveThing(payload: SavePayload) {
  loading.value = true
  try {
    await api.save(payload)
    toast('Saved')
  } catch (err) {
    toast('Save failed')
  } finally {
    loading.value = false
  }
}
```

## 4. Shared Domain Adapter

Keep repeated search-result shaping out of pages.

Representative pattern:

```ts
export const routingTaskPresentation = {
  getKey: (task: RoutingTask) => task.workEffortId,
  getTitle: (task: RoutingTask) => task.workEffortName,
  getSubtitle: (task: RoutingTask) => task.statusDescription ?? '',
}
```

Use the adapter from a typed wrapper or a generic base component instead of
recreating page-local `routingTaskTitle` helpers.

## 5. Date Helper Boundary

Keep local form values in the UI layer and backend formatting in helpers or
services. Prefer one consistent page-level form shape instead of mixing a
`reactive()` object, standalone refs, and `form.value` patterns in the same
workflow.

Representative pattern:

```ts
const form = reactive({
  fromDate: getCurrentLocalDateTimeValue(),
  thruDate: getCurrentLocalDateOnlyValue(),
})
```

```ts
async function saveRule() {
  await routingService.saveRule({
    ...form,
    fromDate: formatLocalDateTimeForBackend(form.fromDate),
    thruDate: formatLocalDateOnlyForBackend(form.thruDate),
  })
}
```

Test-level helper expectation:

```ts
expect(formatLocalDateOnlyForBackend('2026-07-15')).toBe('2026-07-15')
expect(formatLocalDateTimeForBackend('2026-07-15T09:30')).toBe(
  '2026-07-15 09:30:00.0'
)
```

## 5b. Lookup Reload On Page Enter

Use Ionic lifecycle hooks when lookup/reference data can fail, change in
another screen, or become stale between visits. For the compact decision rule
for load once vs retry on page enter vs refresh every revisit, see
[lifecycle-and-lookup-loading.md](lifecycle-and-lookup-loading.md).

Representative pattern:

```ts
onIonViewWillEnter(async () => {
  if (!facilityOptions.value.length || shouldRefreshFacilities.value) {
    await lookupStore.loadFacilities()
  }
})
```

Use this when:

- options may be edited in a modal or sibling page
- the first request may have failed and needs retry on return
- the cached lookup set is not reliable for the full session

## 6. Offline Or Session State

Use local/session state only when the workflow truly needs it.

Example source:
- [Inventory Count local session flow](https://github.com/hotwax/inventory-count)

Representative pattern:

```ts
state: () => ({
  sessionId: null as string | null,
  pendingEvents: [] as EventItem[],
})
```
