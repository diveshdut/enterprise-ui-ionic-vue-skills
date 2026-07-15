# Shared Search And Adapters

Load this reference before building or refactoring shared search/select,
autocomplete, entity picker, or typed wrapper flows.

## Goal

Keep one reusable search/select experience while preserving strong typing and
shared presentation logic at the page boundary.

## Preferred Architecture

- Use one generic base component for the shared visual behavior.
- Keep domain-specific typing explicit through a tiny wrapper component, shared
  adapter module, or both.
- Centralize repeated presentation helpers such as key, title, subtitle, and
  thumbnail text.
- Keep page files responsible for orchestration, fetching, and selection
  outcomes, not presentation mapping boilerplate.

## Shared Contract Pattern

```ts
export interface SearchPresentation<T> {
  getKey(item: T): string
  getTitle(item: T): string
  getSubtitle?: (item: T) => string
  getThumbnailText?: (item: T) => string
}
```

Use this kind of shared contract when multiple screens need the same visual
search behavior but different entity presentation rules.

## Adapter Example

```ts
export const productPresentation: SearchPresentation<Product> = {
  getKey: (product) => product.productId,
  getTitle: (product) => product.productName,
  getSubtitle: (product) => product.internalName ?? '',
}
```

Prefer one shared adapter module over page-local helpers like
`productTitle`, `productSubtitle`, or `routingTaskThumbnailText`.

## Typed Wrapper Example

```vue
<script setup lang="ts">
defineProps<{
  query: string
  items: Product[]
}>()

const emit = defineEmits<{
  'update:query': [value: string]
  select: [product: Product]
}>()
</script>

<template>
  <BaseEntitySearch
    :query="query"
    :items="items"
    :presentation="productPresentation"
    @update:query="emit('update:query', $event)"
    @select="emit('select', $event)"
  />
</template>
```

Use a tiny typed wrapper when it keeps page code clean and prevents broad
contracts from leaking into feature files.

## Page Boundary Example

```ts
function onProductSelected(product: Product) {
  selectedProduct.value = product
}
```

The page should receive the real domain type. Avoid selecting a broad record
shape and casting it back after the event fires.

## Choose The Reuse Shape

- Use a shared adapter module when the visual component already exists and the
  repeated problem is presentation mapping.
- Use a tiny typed wrapper when the shared base component is correct but page
  ergonomics or event typing would otherwise become noisy.
- Use both when multiple domains share the same base component and each domain
  needs a clean import-level contract.

## Avoid

- Page-local mapping helpers repeated across screens.
- `Array<Record<string, unknown>>` or similarly broad item contracts at the
  page boundary.
- Unsafe casts from a shared search result back to `Product`, `Facility`, or
  another domain type after selection.
- Copying near-identical search field markup into each page when one shared
  base component can own the visual behavior.
