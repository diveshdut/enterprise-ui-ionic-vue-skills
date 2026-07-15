# Lifecycle And Lookup Loading

Use this reference when a page depends on lookup/reference data and the right
reload behavior depends on Ionic navigation lifecycle rather than only initial
component mount behavior.

## Decision Rule

- Load once when the lookup data is effectively static for the session and
  stale options would not hurt the workflow.
- Retry on page enter when the first request may fail, or when returning to the
  page should recover from an earlier lookup error.
- Refresh every revisit when reference data can change in a modal, sibling
  page, or another operational step before the user navigates back.

## Lifecycle Boundary

- Match lookup loading to page navigation behavior, not only `onMounted()`.
- Use Ionic lifecycle hooks such as `onIonViewWillEnter` when a kept-alive page
  can be revisited without being destroyed.
- Treat "navigate back to this page" as a real refresh event when the
  correctness of the options matters to the workflow.

## Keep This Separate From Date Architecture

- Date/date-time helper architecture belongs to shared formatting and API
  boundary decisions, not lookup refresh decisions.
- Keep local form values, display formatting, and OFBiz/backend payload
  conversion in the date helper/service boundary described in
  [state-and-api.md](state-and-api.md).

## Representative Pattern

```ts
onIonViewWillEnter(async () => {
  if (!facilityOptions.value.length || shouldRefreshFacilities.value) {
    await lookupStore.loadFacilities()
  }
})
```

Use a page-enter refresh flag or equivalent stale-data signal when the lookup
set can change during nearby navigation flows.
