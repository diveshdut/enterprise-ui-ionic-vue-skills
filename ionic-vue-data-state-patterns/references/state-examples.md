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

## 4. Offline Or Session State

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
