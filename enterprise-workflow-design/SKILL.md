---
name: enterprise-workflow-design
description: Navigate the Ionic 8 Material UI Kit and modern enterprise workflow references in Figma before designing, reviewing, or implementing new enterprise application UI. Use for new Ionic/Figma screens, workflow UX, responsive enterprise patterns, inventory/order/facility/production runs/admin interfaces, and decisions about reusing or extending existing UI patterns.
---

# Enterprise Workflow Design

## Goal

Design new enterprise workflows from the established Ionic visual language instead of starting from an isolated blank canvas.

## Figma Access Requirement

This skill depends on the Figma connector/tools, typically exposed through
MCP, for live Figma file inspection or Figma editing.

- Use live Figma files only when Figma tools are available in the current
  agent environment.
- If Figma tools are unavailable or the connector/quota is exhausted, state
  that live Figma inspection or editing is not available.
- Do not claim to have inspected frames, layers, components, variables, styles,
  or comments unless they were actually accessed.
- Ask the user to enable the Figma connector or provide screenshots, exports,
  specs, copied layer details, SVG, PDF, PNG, or other usable design artifacts
  when live access is unavailable.
- Use the local workflow index only to identify likely Figma reference links
  and workflow families when live Figma access is unavailable. Do not treat it
  as a local copy of the designs, layers, components, or UI patterns, and note
  that the live Figma file may have changed.
- Do not create or modify Figma content unless Figma tools are available and
  the user has authorized the exact new work or edit.
- If the user then provides an exported or uploaded design artifact, use
  `ionic-vue-enterprise-patterns` and `ionic-vue-coding-standards` to turn it
  into code.

## Required Workflow

1. Read [references/figma-workflow-index.md](references/figma-workflow-index.md)
   before proposing or creating an enterprise UI flow.
2. Read [references/design-code-mapping.md](references/design-code-mapping.md)
   when you need to move from a design frame to the first GitHub code files to
   inspect.
3. Open the Figma `Enterprise Workflow Index` first, then inspect the live
   reference frames most closely matching the user's task.
4. Inspect foundations when introducing UI controls or visual decisions:
   Ionic Components, Ionicons, and semantic colors.
5. Select references by user goal rather than product name. A new domain may
   reuse a known interaction pattern even when its data is different.
6. Identify what is being reused before designing:
   - Shell and navigation pattern.
   - Search, filtering, list, or detail pattern.
   - Action, status, progress, and exception treatment.
   - Desktop, tablet, or mobile responsive treatment.
7. Build the new design with existing components and interaction compositions
   wherever they fit. Introduce a new pattern only when the workflow cannot be
   expressed clearly through the references.
8. State which Figma references informed the design when delivering a new
   screen or implementation recommendation.

## Figma Editing

- When writing designs in Figma, use the Figma skills/tools available in the
  current environment and follow their required inspection and editing steps.
- Do not create replacement components, icons, or color conventions until the
  existing Ionic Components, Ionicons, and Colors references have been checked.
- Treat the live Figma file as the source of truth for visuals. This skill is a
  navigation guide and may become stale if Figma content changes.
- If the referenced Figma file cannot be accessed, report the limitation and
  avoid asserting that a new screen follows the source designs.

## Reuse Rules

- Prefer proven workflow compositions over novel one-off layouts.
- Prefer a closely related enterprise reference over a generic component-only
  example.
- Preserve useful patterns such as filter-and-results workspaces,
  master-detail views, store execution task flows, configuration cards, status
  chips, progress states, and contained modals.
- For a genuinely new interaction pattern, design it deliberately and propose
  adding it to the `Enterprise Workflow Index` for future reuse.

## Deliverable Check

Before finalizing a new enterprise UI design or UI implementation plan:

- Name the user goal and selected reference family.
- List the primary Figma frames inspected.
- Note which GitHub repo and first code files would be inspected next when the
  task moves from design to implementation.
- Note reused components and compositions.
- Call out any new pattern introduced and why existing patterns were
  insufficient.
- For manufacturing work, consult the production-run mapping in the reference
  file before inventing create, search, detail, execution, or scheduling views.
