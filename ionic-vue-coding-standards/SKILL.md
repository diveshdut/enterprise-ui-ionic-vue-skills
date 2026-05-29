---
name: ionic-vue-coding-standards
description: Implement, review, or refactor Ionic Vue application UI with semantic Ionic component composition, reusable styling, responsive mobile-compatible behavior, and maintainable Vue structure. Use for any Ionic/Vue screen, component, navigation shell, UI layout, styling, theme, or frontend code decision, whether implementation starts from Figma, screenshots, exports, wireframes, specs, other design tools, or plain requirements.
---

# Ionic Vue Coding Standards

## Goal

Produce enterprise UI that feels native to Ionic, remains straightforward to
maintain, and works on mobile without depending on elaborate custom styling.

## Required Workflow

1. Read [references/css-and-component-reuse.md](references/css-and-component-reuse.md)
   before creating or changing UI layout or visual styling.
2. Read [references/anti-patterns.md](references/anti-patterns.md) before
   reviewing, refactoring, or introducing a substantial view.
3. If the request describes an enterprise workflow, also load
   `ionic-vue-enterprise-patterns`.
4. If the work changes stores, API orchestration, offline behavior, persistent
   state, background tasks, or test sessions, also load
   `ionic-vue-data-state-patterns`.
5. Use the richest available design input:
   - If an exact Figma frame is provided, inspect that frame first. Load
     `enterprise-workflow-design` only when the design is incomplete,
     ambiguous, missing responsive/states guidance, or needs broader
     HotWax/Ionic reference selection. If that skill is not available, inspect
     the exact Figma frame directly when Figma tools are available.
   - If the design comes from another tool, ask for or inspect screenshots,
     exported images/PDFs/SVGs, specs, copied layer details, screen recordings,
     or annotated wireframes before coding.
   - If no design artifact is available, load `enterprise-workflow-design`
     and `ionic-vue-enterprise-patterns` to select and shape a proven workflow
     pattern before coding. If `enterprise-workflow-design` is unavailable,
     still use the available Figma/design artifact or documented enterprise
     pattern sources directly, rather than blocking implementation.

## Non-Negotiable Rules

- Start from core Ionic components when they correctly represent the
  interaction: `ion-page`, `ion-header`, `ion-toolbar`, `ion-content`,
  `ion-list`, `ion-item`, `ion-card`, `ion-searchbar`, `ion-chip`,
  `ion-badge`, `ion-select`, `ion-modal`, `ion-alert`, `ion-footer`,
  `ion-fab`, `ion-segment`, and related controls.
- Design UI that Ionic can implement naturally. Avoid interactions that
  require fragile positioning, excessive overrides, or bespoke controls when
  a simpler Ionic composition satisfies the task.
- Use semantic Vue components and meaningful content regions. Keep business
  logic out of templates and split independent view responsibilities into
  components when that improves clarity and reuse.
- Do not use inline template CSS, including `style=""` or visual `:style`
  bindings. Express reusable visuals through shared component styles, global
  layout/state classes, or theme variables.
- Do not use `ion-grid`, `ion-row`, or `ion-col` for application layout. Do
  not build page layouts from chains of Ionic grid/spacing utility classes.
  Use semantic containers with shared CSS Grid or Flexbox rules.
- Prefer semantic theme variables and shared design tokens over raw colors,
  shadows, spacing, radii, or visual constants.
- Build every new UI to be mobile compatible. Treat handheld use as primary
  for store-operation flows such as receiving, fulfillment, counting,
  scanning, picking, packing, and transfers.
- Remove duplicate information before implementing. Display each status,
  identifier, quantity, date, or message where it has the most
  decision-making value rather than repeating it across a screen.
- Preserve the target application's existing architecture and shared
  components. Do not migrate state libraries, replace shared CSS, or
  introduce a new shell as incidental work.

## Implementation Sequence

1. Identify the user's primary decision or action on the screen.
2. Select the smallest Ionic-native composition that supports that action.
3. Decide the mobile flow first for store operations; add desktop enhancement
   only after the narrow layout remains complete.
4. Reuse existing components, global classes and theme tokens before adding
   new styling or components.
5. Move repeated layout or state presentation into shared CSS or a shared
   component instead of duplicating view-local markup and styles.
6. Validate hierarchy, labels, empty/loading/error states, disabled behavior,
   action reachability and responsive behavior before finishing.

## Supporting References

- Read [references/css-and-component-reuse.md](references/css-and-component-reuse.md)
  for layout and CSS decisions.
- Read [references/anti-patterns.md](references/anti-patterns.md) for
  implementation traps to avoid.
- Read [references/code-examples.md](references/code-examples.md) for compact
  Ionic/Vue patterns distilled from the HotWax repositories.
- Read [references/source-evidence.md](references/source-evidence.md) when
  grounding a recommendation in the analyzed HotWax applications.
