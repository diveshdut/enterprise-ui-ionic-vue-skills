---
name: ionic-vue-enterprise-patterns
description: Select and implement proven Ionic Vue enterprise workflow UX patterns from HotWax operational and configuration applications. Use when coding or designing screens for fulfillment, receiving, inventory, orders, shipments, preorder, routing, scheduling, manufacturing, administration, or similar business workflows; implement complete exact Figma frames or non-Figma design artifacts directly with Ionic/Vue standards, and use documented patterns plus enterprise-workflow-design when requirements are design-only, design artifacts are missing/incomplete/ambiguous, or broader HotWax/Ionic workflow context is needed.
---

# Ionic Vue Enterprise Patterns

## Goal

Turn enterprise requirements into coherent Ionic-compatible workflows by
reusing established interaction patterns rather than inventing screens in
isolation.

## Start From The Available Input

### When A Design Is Provided

1. Use the richest available design source before implementing:
   - For Figma, inspect the exact live frame and layers provided by the user
     when Figma tools are available.
   - For other tools, ask for or inspect screenshots, exported images/PDFs/SVGs,
     specs, copied layer details, screen recordings, or annotated wireframes.
2. Implement the provided design artifact with Ionic/Vue while applying
   `ionic-vue-coding-standards`.
3. Load `enterprise-workflow-design` only when the provided design is
   incomplete, ambiguous, missing states or responsive variants, or when the
   task requires selecting, comparing, extending, or validating against the
   broader Ionic 8 Material UI Kit or HotWax workflow references.
4. If `enterprise-workflow-design` is unavailable, do not block. Continue by
   inspecting the supplied Figma frame or other design artifact directly when
   Figma or file-access tools are available.
5. Treat existing reference designs as read-only unless an exact modification
   is explicitly authorized.
6. Implement the reusable composition and behavior, not merely a pixel copy.

### When Only Requirements Are Provided

1. Identify the user goal, operating context and highest-value action.
2. Load `enterprise-workflow-design` when the task requires designing a new
   workflow or choosing HotWax/Ionic reference patterns before coding.
3. If `enterprise-workflow-design` is unavailable, or Figma access is
   unavailable, or the connector/quota is exhausted, fall back to matching the
   goal to the closest pattern family in
   [references/workflow-patterns.md](references/workflow-patterns.md), then
   design the UX and implement the UI from that pattern.
4. Select an Ionic-native mobile flow, especially for store operations.
5. Use Figma/reference evidence or user-provided design artifacts for
   consistency when accessible, but do not block implementation merely because
   a new workflow lacks a dedicated frame.
6. State the pattern family selected and any genuinely new interaction
   introduced.
7. If no design artifact exists and Figma access is unavailable, design from
   requirements using the documented workflow patterns, then implement with
   `ionic-vue-coding-standards`.

## Required Principles

- Load `ionic-vue-coding-standards` for implementation and UI review work.
- Lead with task, exception, progress and action information; remove repeated
  secondary detail that does not help the user proceed.
- Prefer workflow compositions already supported by Ionic controls: lists,
  cards, search, chips, segments, alerts, modals, popovers, footers and
  focused detail pages.
- For mobile find/list screens, keep search and query controls lightweight:
  compact chips or small outline controls should carry filters and sort, while
  full-width buttons should remain reserved for primary workflow actions.
- Use compact status chips or badges unless status itself is the main decision
  surface. Do not let status treatment consume more space than the next action,
  exception, or progress summary it supports.
- Keep store-operation tasks mobile complete and touch friendly. Treat desktop
  layouts as enhancement rather than a prerequisite for execution.
- Use configuration workspaces only when users must compare, order or edit
  multiple rules/entities; do not force simple tasks into dense editors.

## Pattern Selection

- Read [references/workflow-patterns.md](references/workflow-patterns.md) for
  selecting operational, management or configuration flows.
- Read [references/workflow-examples.md](references/workflow-examples.md) for
  compact workflow examples distilled from HotWax applications.
- Read [references/responsive-and-information-design.md](references/responsive-and-information-design.md)
  for mobile handling and deduplicated hierarchy.
- Read the design-code mapping in
  [enterprise-workflow-design/references/design-code-mapping.md](../enterprise-workflow-design/references/design-code-mapping.md)
  when you need to move from a design or requirement to the first GitHub code
  files to inspect.

## Delivery Check

- Name the selected pattern family and the user's primary task.
- Identify whether implementation was guided by live Figma, another design
  artifact, or documented workflow precedent.
- Confirm the essential mobile flow is supported.
- Identify reused Ionic/shared components and any shared styling additions.
- Note any new pattern that should later be indexed for reuse.
