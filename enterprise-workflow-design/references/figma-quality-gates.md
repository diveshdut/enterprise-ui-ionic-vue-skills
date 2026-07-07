# Figma Quality Gates

Use these gates after composing or revising an enterprise workflow in Figma.
Pass both metadata and visual checks before treating a frame as implementation-ready.

## Component Authenticity

- Confirm every visible control is an `INSTANCE` whose `mainComponent` belongs
  to the intended Ionic family.
- Treat layer names as descriptions, not proof. Renaming a Select instance to
  `ion-datetime` does not make it a datetime component.
- Confirm visible labels, icons, dividers, and action surfaces come from the
  live instance, its supported slots, or editable child layers.
- Reject hidden component instances covered by primitive rectangles, text, or
  icons that produce the actual visible UI.
- Preserve component keys, variants, semantic styles, and bound variables when
  the design system exposes them.

## Clone Hygiene

When adapting an existing frame or component usage:

- Rename the frame, toolbar, controls, sections, and actions semantically.
- Replace stale visible text and relevant hidden override text inherited from
  the source workflow.
- Remove controls, badges, media, and actions that do not belong to the new
  workflow.
- Clear placeholder or shimmer states before review.
- Verify repeated rows use the same action and slot structure.
- Search for source-workflow labels after editing. A visually hidden stale
  label can still mislead design-to-code tools.

## Control Semantics

| User intent | Required design contract |
| --- | --- |
| Choose from a short stable set | Use a live Select or another documented selection control. |
| Find a product, party, facility, or other large entity set | Use a searchable entity-picker or search-and-select workflow. |
| Enter a date or datetime | Use an actual Ionic datetime pattern. If the entry trigger is Item/Select-like, pair it with the live Date Time picker or modal in the flow. |
| Edit a numeric quantity, duration, or money value | Use an Input with a clear unit, currency, or helper contract when ambiguity is possible. |
| Trigger an action | Use a Button, FAB, item action slot, or documented action component rather than a badge or decorative icon. |

Do not infer component semantics from appearance. Inspect the component family
and the complete interaction flow.

## Mobile Geometry

Validate at the narrow mobile frame used by the target application; use `393px`
when no narrower product breakpoint is known.

- Check label/value collisions in Select and Item rows.
- Preserve the semantic field label when space is tight. Shorten the collapsed
  value, choose a supported stacked variant, or move the full value into the
  selection overlay.
- Check segment labels, translated strings, IDs, dates, currency, and units for
  clipping or ambiguous truncation.
- Keep touch actions reachable and visually attached to the record they affect.
- Remove accidental vertical waste without compressing controls below the
  component contract.

## Structural Review

- Place live Ionic components directly in the parent auto-layout when an extra
  wrapper provides no structure or behavior.
- Keep record-level actions in the record summary action area.
- Keep collection-level actions inside the collection section.
- Keep row-level actions inside the row's supported end slot or action area.
- Ensure equivalent repeated rows have equivalent action treatment.
- Confirm destructive actions use the documented danger treatment and include
  the required confirmation state.

## Final Evidence

Collect both forms of evidence:

1. Inspect metadata for component families, hierarchy, component keys, styles,
   placeholders, and stale layer names.
2. Inspect screenshots for overlap, clipping, density, action hierarchy,
   inconsistent rows, and unintended wrappers.

Report any remaining direct primitives or custom exceptions with their intended
Ionic implementation mapping. Do not approve a frame based on screenshot
similarity alone.
