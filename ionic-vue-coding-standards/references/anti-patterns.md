# Anti-Patterns

Use this alongside the topic-specific references when reviewing or refactoring:

- [css-and-component-reuse.md](css-and-component-reuse.md)
- [shared-search-and-adapters.md](shared-search-and-adapters.md)
- [testability-and-selectors.md](testability-and-selectors.md)
- [date-and-datetime-examples.md](date-and-datetime-examples.md)

## Do Not Introduce

- Screens designed around custom CSS tricks instead of Ionic-native controls.
- `ion-grid`, `ion-row`, or `ion-col` as the page-layout system.
- Ad hoc inline CSS or visual `:style` bindings in templates. A narrow
  custom-property binding is acceptable only when it drives shared CSS from
  structured state.
- Repeated page-local styles for a pattern that belongs in shared CSS or a
  shared component.
- Repeated page-local search result helpers such as `productKey`,
  `productTitle`, `productSubtitle`, `routingTaskTitle`, or similar domain
  mapping functions when a shared adapter or wrapper component should own the
  contract.
- Shared search/select components that accept a broad item shape and require
  unsafe casts back to a domain type at the page boundary.
- `display: contents` on wrappers that carry semantic grouping, responsive
  layout responsibility, slot structure, or test hooks.
- Generic `div` controls that replace accessible Ionic buttons, items, inputs,
  overlays or navigation components.
- Raw color, spacing or shadow values when semantic theme tokens should
  express the design intent.
- Hardcoded hierarchy-depth classes when one shared helper class plus a CSS
  custom property can scale the same pattern more cleanly.
- Desktop layouts that discard or conceal required actions on mobile.
- Cards and headers that repeat the same status, identifier or timestamp
  without helping the user decide or act.
- Large page components that mix retrieval, business logic, overlay
  orchestration and many independent UI sections without a clear reason.
- Page-local date parsing and formatting snippets using ad hoc `new Date(...)`,
  `.toISOString()`, or string slicing for backend contracts.
- Date-only and date-time fields handled with the same conversion shortcut
  instead of separate helpers and value contracts.
- `ion-datetime` flows whose default value, display, or confirm/cancel behavior
  is left ambiguous.
- `data-testid` values derived from array index, transient label text, or a
  non-unique product ID when the real business identity is an association,
  rule, task assignment, or another composite record.
- Broad cleanup refactors when a narrow typed wrapper or shared adapter would
  solve the repeated search/select problem more safely.
- Architecture migrations or app-specific backend assumptions copied merely
  because one reference repository contains them.

## Review Questions

- Could this interaction be expressed with a core Ionic component?
- Is new CSS reusable, semantic and placed at the appropriate shared level?
- Would `display: contents` make this wrapper harder to test, reason about, or
  keep stable across layouts?
- Does repeated search/select presentation belong in a typed shared adapter or
  wrapper rather than another page helper?
- Are date-only, date-time, display formatting, and API formatting separated
  cleanly?
- Are repeated rows and row actions addressable through stable business-aware
  `data-testid` hooks?
- Is the screen complete and usable on a handheld device?
- Has duplicate data been reduced to a meaningful hierarchy?
- Is this choice a durable pattern, or merely inherited from one source app?
