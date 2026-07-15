---
name: enterprise-workflow-design
description: Use when the task involves enterprise Ionic Vue screen design from Figma or other design artifacts, especially when selecting or adapting list-detail, parent-child, inventory, orders, facility, production, or admin workflow patterns.
---

# Enterprise Workflow Design

## Goal

Design enterprise workflows from established Ionic workflow families and
component contracts instead of starting from an isolated blank canvas.

## Expected User Input

The user should only need to provide the Figma file plus the design task. An
exact frame or node link is helpful, but optional.

- Minimum expected input: a Figma file link and the requested workflow or
  screen change.
- Better input: a Figma file link, the requested workflow or screen change,
  and any known reference screens.
- Do not require the user to provide cover-page, workflow-index, or
  repo-specific navigation hints when the file is already known.
- If the user provides only a file link, identify the correct workflow entry
  point from this skill before exploring other pages.

## Core Routing Rules

- Separate `data reference` from `UI reference` whenever the user points to a
  localhost, OFBiz, legacy, or external business screen.
- Treat data references as sources for fields, labels, states, entity
  relationships, and workflow rules. Do not copy their layout, spacing, or
  visual treatment unless the user explicitly says they are also the UI
  reference.
- Resolve the workflow family before browsing generic components or arbitrary
  pages.
- Treat the documented Ionic component parameter files as the first local
  source of truth. Live Figma inspection confirms or extends those contracts;
  it does not replace them.
- When the target file is the Ionic 8 Material UI Kit
  (`1wantteXXUlzPRYev1X5gr`), start from the `Enterprise Workflow Index Canvas`
  at node `34926:1223` before exploring other pages.
- State which references informed the result when delivering a design,
  recommendation, or design-to-code handoff.

## Figma Access Requirement

This skill depends on the Figma connector/tools, typically exposed through
MCP, for live Figma inspection or Figma editing.

- Use live Figma files only when Figma tools are available in the current
  environment.
- Do not claim to have inspected frames, layers, components, variables,
  comments, or styles unless they were actually accessed.
- If a referenced Figma link cannot be opened, continue from the documented
  workflow references and component parameter files instead of stopping.
- When live access is missing, say so clearly and base the design on the local
  skill references plus any screenshots, exports, specs, SVG, PDF, or copied
  layer details the user provides.
- Do not create or modify Figma content unless Figma tools are available and
  the user has authorized the specific work.

## Required Workflow

1. Read [references/figma-workflow-index.md](references/figma-workflow-index.md)
   before proposing or creating an enterprise UI flow.
2. Read [references/design-code-mapping.md](references/design-code-mapping.md)
   when the task includes design-to-code handoff or code inspection.
3. Resolve the user-provided Figma target first:
   - If the user provides a node-specific Figma link, inspect that exact node
     first.
   - If the user provides only a file link, use the workflow index and this
     skill to identify the correct entry point before exploring arbitrary
     pages.
4. Use the Enterprise Workflow Index to choose the workflow family, closest
   references, Selection Taxonomy, and Design Decision Layer before exploring
   generic component pages.
5. Route to the focused pattern references when the task needs specific
   interaction guidance:
   - [references/pattern-examples/navigation-and-structure.md](references/pattern-examples/navigation-and-structure.md)
   - [references/pattern-examples/actions-and-feedback.md](references/pattern-examples/actions-and-feedback.md)
   - [references/pattern-examples/content-and-forms.md](references/pattern-examples/content-and-forms.md)
6. When placing, resizing, or editing an Ionic component, read
   [references/ionic-component-parameters.md](references/ionic-component-parameters.md)
   plus the matching family hub:
   - [references/component-parameters/actions.md](references/component-parameters/actions.md)
   - [references/component-parameters/content.md](references/component-parameters/content.md)
   - [references/component-parameters/navigation.md](references/component-parameters/navigation.md)
   Then open the smallest family slice that matches the control being used.
7. Read
   [references/parent-child-crud-patterns.md](references/parent-child-crud-patterns.md)
   when the workflow manages parent records, child collections, associations,
   or child records that can also be managed independently.
8. Inspect Ionic foundations, icons, and color conventions only after the
   workflow direction is clear.
9. If a live component or link is unavailable, build from the documented
   contracts and workflow references rather than inventing custom primitives or
   unsupported values.
10. Run [references/figma-quality-gates.md](references/figma-quality-gates.md)
    before approving a created, cloned, or revised frame.

## Hard Rules

- Prefer a closely related enterprise workflow reference over a generic
  component-only example.
- Adapt interaction composition and information hierarchy from the references;
  do not blindly copy a layout from an unrelated domain.
- Reuse documented Ionic components and supported contracts rather than custom
  primitives or one-off structure. Use
  [references/figma-quality-gates.md](references/figma-quality-gates.md) for
  component-authenticity and structural-review detail.
- Follow the focused pattern references for control semantics, date/datetime
  treatment, action placement, and feedback behavior instead of inventing new
  interpretations:
  [references/pattern-examples/content-and-forms.md](references/pattern-examples/content-and-forms.md)
  [references/pattern-examples/actions-and-feedback.md](references/pattern-examples/actions-and-feedback.md)
- When annotations, validation cues, picker behavior, or other design intent
  is ambiguous, resolve it from the closest workflow usage and documented
  references before introducing a custom pattern.
- Run the documented quality gates before delivery rather than treating root
  skill bullets as a substitute for component, state, or responsive QA.

## Delivery Check

- Name the user goal and selected reference family.
- State which Figma references and local reference docs informed the result.
- When localhost, OFBiz, or other business screens were supplied, state
  whether they were used as data reference, UI reference, or both.
- For design-to-code handoff, note which GitHub repo and first code files
  would be inspected next.
- If live Figma access was unavailable, say so explicitly and frame the output
  as based on the documented contracts and references.
