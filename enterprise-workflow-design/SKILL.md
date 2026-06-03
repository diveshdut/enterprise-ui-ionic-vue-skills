---
name: enterprise-workflow-design
description: Navigate the Ionic 8 Material UI Kit and modern enterprise workflow references in Figma before designing, reviewing, or implementing new enterprise application UI. Use for new Ionic/Figma screens, workflow UX, responsive enterprise patterns, inventory/order/facility/production runs/admin interfaces, and decisions about reusing or extending existing UI patterns.
---

# Enterprise Workflow Design

## Goal

Design new enterprise workflows from the established Ionic visual language instead of starting from an isolated blank canvas.

## Expected User Input

The user should only need to provide the Figma file they want to work in plus
the design task. An exact frame or node link is helpful, but optional.

- Minimum expected input: a Figma file link and the requested workflow or
  screen change.
- Better input: a Figma file link, the requested workflow or screen change,
  and any known reference screens.
- Do not require the user to provide the cover page, workflow index node, or
  repo-specific navigation hints when the file is already known.

If the user provides only a file link, identify the correct workflow entry
point from this skill before exploring other pages.

## Reference Discipline

- Separate `data reference` from `UI reference` whenever the user points to a
  localhost, OFBiz, legacy, or external business screen.
- Treat data references as sources for fields, labels, states, entity
  relationships, and workflow rules. Do not copy their layout, spacing,
  hierarchy, or visual treatment unless the user explicitly says they are also
  the UI reference.
- When a screen is shared only to confirm what data is used, preserve the
  selected Ionic/enterprise workflow pattern and update only the information
  architecture and field set.

## Figma Access Requirement

This skill depends on the Figma connector/tools, typically exposed through
MCP, for live Figma file inspection or Figma editing.

- Use live Figma files only when Figma tools are available in the current
  agent environment.
- If Figma tools are unavailable or the connector/quota is exhausted, state
  that live Figma inspection or editing is not available.
- Do not claim to have inspected frames, layers, components, variables, styles,
  or comments unless they were actually accessed.
- If a referenced Figma link cannot be opened, treat the documented Ionic
  component parameters, pattern references, and workflow index as the design
  source of truth and continue using those contracts instead of stopping.
- When live Figma access is missing, compose the UI from the documented Ionic
  components, honoring the recorded variants, slots, sizes, paddings, and
  labels, and explicitly note that the result is based on the skill docs
  rather than live file verification.
- Ask the user to enable the Figma connector or provide screenshots, exports,
  specs, copied layer details, SVG, PDF, PNG, or other usable design artifacts
  when live access is unavailable.
- Do not create or modify Figma content unless Figma tools are available and
  the user has authorized the exact new work or edit.
- If the user then provides an exported or uploaded design artifact, use
  `ionic-vue-enterprise-patterns` and `ionic-vue-coding-standards` to turn it
  into code.

Always treat the documented parameter contracts as the first source of truth
for component shape, variants, sizing, slots, and label placement. Live Figma
inspection confirms or extends the contract; it does not replace the contract.

## New Workflow Checklist

Before designing a new workflow in the Ionic 8 Material UI Kit file, inspect
the `Enterprise Workflow Index` first. For this repo's primary kit file, start
with node `34926:1223` before exploring individual screens or components.

## Required Workflow

1. Read [references/figma-workflow-index.md](references/figma-workflow-index.md)
   before proposing or creating an enterprise UI flow.
2. Read [references/design-code-mapping.md](references/design-code-mapping.md)
   when you need to move from a design frame to the first GitHub code files to
   inspect.
3. Resolve the user-provided Figma target first:
   - If the user provides a node-specific Figma link, inspect that exact node
     first.
   - If the user provides only a file link, determine the correct workflow
     entry point from this skill before inspecting arbitrary pages.
4. Open the current Figma enterprise workflow index first, then inspect the
   live pages, sections, and reference frames most closely matching the user's
   task.
   For this repo, if the target file is the Ionic 8 Material UI Kit file
   (`1wantteXXUlzPRYev1X5gr`), the mandatory first inspection target is the
   `Enterprise Workflow Index Canvas`. Do not start from `Cover`, generic
   component pages, or keyword search results when that canvas is available.
5. Use the Enterprise Workflow Index to select the relevant workflow family,
   reference screens, and reusable interaction pattern before inspecting
   components.
6. Do not begin component discovery, foundation browsing, or generic page
   exploration until the workflow index has been resolved and the relevant
   workflow references have been identified. Only bypass this when the index is
   unavailable, inaccessible, or clearly irrelevant to the user's file.
7. Inspect foundations when introducing UI controls or visual decisions:
   Ionic Components, Ionicons, and Colors.
8. When introducing or revising specific UI elements, read
   [references/pattern-examples/navigation-and-structure.md](references/pattern-examples/navigation-and-structure.md)
   [references/pattern-examples/actions-and-feedback.md](references/pattern-examples/actions-and-feedback.md)
   [references/pattern-examples/content-and-forms.md](references/pattern-examples/content-and-forms.md)
   and inspect the matching live Figma component plus at least one workflow
   usage before designing that element.
9. When placing or resizing an Ionic component, read
   [references/ionic-component-parameters.md](references/ionic-component-parameters.md)
   [references/component-parameters/actions.md](references/component-parameters/actions.md)
   [references/component-parameters/content.md](references/component-parameters/content.md)
   [references/component-parameters/navigation.md](references/component-parameters/navigation.md)
   for the component's variants, auto-layout, sizing, slot, color, and label
   contract. Always refer to these parameter contracts first before building a
   design with that component. If a component is not documented there yet,
   inspect the live component and add the discovered contract before relying on
   custom values.
   If the live component or link is unavailable, use the documented contract,
   existing workflow examples, and the Figma workflow index to build the UI
   with the existing Ionic components instead of inventing custom primitives.
10. Select references by user goal rather than product name. A new domain may
   reuse a known interaction pattern even when its data is different.
11. Use the Selection Taxonomy when the user describes a screen type such as a
   work queue, record investigation view, detail/timeline screen, setup form,
   rule builder, scheduler, or bulk upload/error-correction flow.
12. Use the Design Decision Layer to connect the selected UX pattern to Ionic
   components, required states, responsive behavior, and interaction rules
   before inventing new UI.
13. Identify what is being reused before designing:
   - Shell and navigation pattern.
   - Search, filtering, list, or detail pattern.
   - Action, status, progress, and exception treatment.
   - Desktop, tablet, or mobile responsive treatment.
14. Build the new design with existing components and interaction compositions
   wherever they fit. Introduce a new pattern only when the workflow cannot be
   expressed clearly through the references.
15. Reuse references by adapting their interaction composition and information
   hierarchy, not by blindly copying the exact visual layout.
16. State which Figma references informed the design when delivering a new
   screen or implementation recommendation.
17. When a localhost or OFBiz screen is provided alongside Figma references,
    state whether it was used as a data reference, a UI reference, or both.

## Figma Editing

- When writing designs in Figma, use the Figma skills/tools available in the
  current environment and follow their required inspection and editing steps.
- Do not create replacement components, icons, color conventions, or
  workflow-specific UI conventions until the existing Ionic Components,
  Ionicons, Colors, and enterprise workflow references have been checked.
- Reusing an Ionic component means the visible, user-facing UI is produced by
  that component instance, its variants, slots, or editable child layers. A
  hidden instance behind custom visible layers does not count as component
  reuse.
- Preserve documented component parameters such as variants, Hug/Fixed sizing,
  auto-layout direction, gap, padding, slot visibility, color roles, label
  layers, alignment, and enabled/disabled behavior unless the live component
  itself provides a supported override.
- Do not add extra wrapper frames, grouped containers, or helper layout shells
  around a live component unless the inspected component contract or workflow
  reference explicitly needs that structure. Prefer placing the live component
  directly in the parent auto-layout whenever it satisfies the layout on its
  own.
- Apply the no-wrapper rule especially to Ionic `Item` rows, search controls,
  chips, and other list-aligned form elements. If the component already
  provides the required spacing and affordance, place it directly rather than
  wrapping it in a one-off frame.
- When a live Ionic component or semantic surface already uses a published
  paint style, text style, or bound variable, preserve that linkage instead of
  copying the visible color value as a raw fill. Matching the screenshot color
  is not enough if the design system exposes a reusable semantic style.
- For status surfaces such as Badge, Chip, Alert, Progress Indicator, and
  status text, prefer predefined semantic styles like `Primary`, `Success`,
  `Warning`, `Danger`, and `Medium`. Do not leave these nodes as ad hoc solid
  fills when a published semantic style exists.
- After creating or updating Figma screens, inspect the screenshot for vertical
  waste, cramped controls, text overlap, and action hierarchy before delivery.
- After creating or updating status UI, also inspect node metadata and confirm
  the intended style linkage is still present through `fillStyleId`,
  `textStyleId`, or bound variables rather than only checking screenshot
  appearance.
- Treat the live Figma file as the source of truth for visuals. This skill is a
  navigation guide and may become stale if Figma content changes.
- If the referenced Figma file cannot be accessed, report the limitation and
  avoid asserting that a new screen follows the source designs. Still continue
  using the documented Ionic component contracts to assemble the closest
  compliant design or implementation plan.

## Reuse Rules

- Prefer proven workflow compositions over novel one-off layouts.
- Prefer a closely related enterprise reference over a generic component-only
  example.
- Preserve useful patterns such as filter-and-results workspaces,
  master-detail views, store execution task flows, configuration cards, status
  chips, progress states, contained modals, empty states, and mobile drill-down
  flows.
- For mobile find/list screens, prefer one-line compact chips that open
  lightweight popovers or similar contextual menus before reaching for heavier
  select rows, filter forms, or full-width filter bars.
- In filter popovers triggered from chips, prefer concise single-select or
  short list interactions that feel contextual to the result set, not like a
  standalone form.
- If live Figma validation is unavailable, prefer a clearly documented
  component composition from the skill references over an unverified custom
  layout.
- Cover non-happy-path states before delivery: loading, empty, no results,
  partial data, stale data, saving, success, validation error, destructive
  confirmation, permission denied, read-only, offline/sync pending, conflict,
  audit-required, and responsive long-text behavior.
- For a genuinely new interaction pattern, design it deliberately and propose
  adding it to the Figma enterprise workflow index for future reuse.

## Deliverable Check

Before finalizing a new enterprise UI design or UI implementation plan:

- Name the user goal and selected reference family.
- List the primary Figma frames inspected.
- Note which GitHub repo and first code files would be inspected next when the
  task moves from design to implementation.
- Note reused components and compositions.
- Confirm visible component authenticity for controls, cards, lists, status,
  search, forms, and actions; identify any remaining custom primitives or
  direct text layers.
- Confirm documented component parameters were preserved for each reused Ionic
  component, especially sizing, padding, gap, slots, color role, and label
  placement.
- Confirm semantic status surfaces remain linked to published styles or
  variables instead of loose raw fills when the file provides a predefined
  style.
- Note required states and responsive behavior from the Design Decision Layer.
- Call out any new pattern introduced and why existing patterns were
  insufficient.
