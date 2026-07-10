# CSS And Component Reuse

## Ionic-First Composition

- Prefer Ionic controls for application interactions, feedback, navigation,
  overlays and mobile behavior.
- Use semantic layout wrappers such as `main`, `section`, `aside`, `header`
  and `footer` around Ionic controls when composing a page.
- Prefer an established shared application component when it already combines
  Ionic controls into a repeated business pattern.

## Layout Rules

- Do not use `ion-grid`, `ion-row`, or `ion-col` for application screen
  layout.
- Use shared CSS Grid or Flexbox classes for content grids, filter rails,
  master-detail workspaces, sticky action areas and responsive card lists.
- Keep the DOM readable: layout markup should communicate content regions,
  not expose a stack of visual utility wrappers.

## CSS Placement

- Never add ad hoc inline visual styles through `style=""` or `:style`.
- Allow a narrow `:style` binding only when it sets CSS custom properties on
  a shared class and bridges structured state or data into reusable CSS.
- Keep global theme/app CSS intentionally small. Use it for shared layout
  primitives, theme tokens, and app-wide state classes.
- Add a global/shared class when a presentation pattern is expected on
  multiple screens, such as status treatments, detail grids, result layouts,
  empty states, sticky action bars or responsive workspaces.
- Keep page-owned and component-owned presentation inside scoped styles unless
  the pattern is genuinely shared.
- Use CSS custom properties from the theme for colors, spacing, elevation and
  radii. Extend shared tokens when a reusable semantic value is missing.
- Prefer semantic tokens such as `surface-border-color` or `text-muted`
  instead of raw values like `rgba(0, 0, 0, 0.12)`.
- For hierarchy or nesting visuals, prefer a shared helper class that reads a
  CSS custom property such as depth over a hardcoded stack of depth-specific
  classes.

## Component Decision

Create or reuse a shared Vue component when a composition has stable meaning
and appears repeatedly, such as an item summary card, status/progress display,
scan input area, history block or filter control. Use shared CSS alone when
the repeated behavior is only layout or lightweight visual treatment.

## Responsive Standard

- Ensure primary actions and essential information remain accessible at narrow
  widths.
- Prefer one-column mobile flows with clear action placement; enhance to
  rail-and-detail layouts on larger widths.
- Avoid desktop-only interactions or dense layouts for store-operation
  workflows.
