# Anti-Patterns

## Do Not Introduce

- Screens designed around custom CSS tricks instead of Ionic-native controls.
- `ion-grid`, `ion-row`, or `ion-col` as the page-layout system.
- Inline CSS or dynamic visual style bindings in templates.
- Repeated page-local styles for a pattern that belongs in shared CSS or a
  shared component.
- Generic `div` controls that replace accessible Ionic buttons, items, inputs,
  overlays or navigation components.
- Raw color, spacing or shadow values when semantic theme tokens should
  express the design intent.
- Desktop layouts that discard or conceal required actions on mobile.
- Cards and headers that repeat the same status, identifier or timestamp
  without helping the user decide or act.
- Large page components that mix retrieval, business logic, overlay
  orchestration and many independent UI sections without a clear reason.
- Architecture migrations or app-specific backend assumptions copied merely
  because one reference repository contains them.

## Review Questions

- Could this interaction be expressed with a core Ionic component?
- Is new CSS reusable, semantic and placed at the appropriate shared level?
- Is the screen complete and usable on a handheld device?
- Has duplicate data been reduced to a meaningful hierarchy?
- Is this choice a durable pattern, or merely inherited from one source app?
