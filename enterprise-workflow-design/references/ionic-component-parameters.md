# Ionic Component Parameters

Use this reference when placing, resizing, or editing Ionic components in
Figma. Pattern references tell you which composition to use; the files below
tell you how to preserve each component's built-in contract.

If a component is not documented here yet, inspect the live Figma component
before designing with it and add the same fields used below:

- Figma node and role.
- Exposed variants and component properties.
- Auto-layout direction, alignment, resizing, gap, padding.
- Width and height behavior.
- Color roles, fills, strokes, opacity, radius.
- Slot structure and which child layers own visible labels/icons.
- Allowed overrides and anti-patterns.

Do not replace documented component parameters with custom values unless the
live component exposes that adjustment through a variant, slot, component
property, or editable child layer.

## Composition Default

Use the smallest live component composition that satisfies the layout.

- Prefer placing a live component directly in the parent auto-layout row or
  column when it already handles its own spacing, sizing, and visible surface.
- Add an extra wrapper, grouping frame, or helper container only when the live
  component contract or inspected workflow reference explicitly requires it for
  slot composition, overflow handling, shared behavior, or multi-component
  alignment that cannot be expressed directly.
- Treat unnecessary wrappers as a design smell because they increase the chance
  of drifting away from the live component contract.

## Parameter Files

Use the focused component contract references below:

- [Actions](component-parameters/actions.md)
- [Content](component-parameters/content.md)
- [Navigation](component-parameters/navigation.md)

Each family index points to smaller slice files like
`actions/buttons.md`, `content/forms.md`, or `navigation/search.md`.
Load the smallest slice that matches the component family or control first.

Legacy aliases still exist for older links, but the shorter files are the
preferred load targets.

## Instance Swap Audit

The live component sets checked so far do not expose additional instance-swap
properties at the set level:

| Component | Instance-swap properties exposed |
| --- | --- |
| Button | None |
| Badge | None |
| Alert | None |
| Action Sheet | None |
| Checkbox | None |
| Chips | None |
| Modal | None |
| Popover | None |
| Progress Indicator | None |
| Radio | None |
| Range | None |
| Reorder | None |
| Select / Resting | None |
| Searchbar | None |
| Searchbar Content | `Start slot`, `Clear` |
| Segment | None |
| Segment button | `Icon` on icon/text+icon families |
| Tabs | None |
| Tabs / Button | `Icon`, `Label` |
| Toolbar | None |
| Date Time | None |
| Accordion | None |
| Breadcrumb | `End slot`, `Start slot`, `Custom separator` |
| Toast | `Start slot` |
| Toggle / Switch | None |
| List | `End slot` |
| Menu | None |
| Item / Master | `Thumbnail`, `Start slot` |

Use this table as the default reference when deciding whether a control is a
real component-owned swap or just a nested visual detail.
