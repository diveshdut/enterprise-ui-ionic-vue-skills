# Testability And Selectors

Load this reference before adding `data-testid` hooks, repeated row actions, or
E2E-sensitive list workflows.

## Goal

Make enterprise Ionic screens easy to target and verify without depending on
text order, Ionic internals, or shared mutable backend state.

## Selector Rules

- Put `data-testid` on stable semantic containers and actionable controls.
- Add explicit coverage for repeated rows, row-level actions, and key state
  transitions such as loading, empty, error, and completion.
- Use business identity or association identity instead of array position.
- Prefer composite keys when the workflow can legitimately show repeated
  entities.
- Keep selectors attached to the owned row or owned control, not nested deep in
  Ionic-rendered internals.

## Repeated Row Example

```vue
<ion-item
  :data-testid="`routing-association-row-${associationKey(association)}`"
>
  <ion-label>{{ association.title }}</ion-label>

  <ion-button
    fill="clear"
    :data-testid="`routing-association-remove-${associationKey(association)}`"
    @click="removeAssociation(association)"
  >
    Remove
  </ion-button>
</ion-item>
```

```ts
function associationKey(association: RoutingAssociation) {
  return [
    association.workEffortId,
    association.productStoreId,
    association.fromDate ?? 'na',
  ].join('__')
}
```

## Prefer

- Stable backend identifiers.
- Composite business keys when one identifier is not unique enough.
- A single helper for building repeated-row keys when multiple actions target
  the same row identity.

## Avoid

- `row-0`, `row-1`, or any array-index selector.
- Selectors based only on visible text.
- Product-only IDs when the screen can show the same product in multiple
  associations, rules, or states.
- Playwright selectors that depend on Ionic's generated DOM shape instead of
  owned test hooks.

## Deterministic Verification

- Keep live E2E runs deterministic by avoiding shared mutable test data where
  possible.
- Serialize verification flows that mutate the same backend or environment
  state.
- Do not treat a flaky parallel run as evidence that the UI is correct.

## Review Check

- Can the test target the exact row without reading surrounding text?
- Will the selector remain stable if sort order, grouping, or copy changes?
- Are row actions individually targetable?
- Are the important non-happy states observable through stable hooks?
