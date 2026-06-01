# Responsive And Information Design

## Mobile Compatibility

- Make every workflow usable on mobile.
- For store operations, design handheld behavior first: scan entry,
  touch-sized actions, single-column content, reachable completion actions and
  clear exception feedback.
- For desktop-oriented configuration tools, preserve a usable narrow mode by
  converting adjacent panels into navigation, sheets, overlays or stacked
  sections rather than exposing an unusable compressed workspace.

## High-Impact Hierarchy

Start a screen by identifying:

1. What decision or action is required now.
2. What exception prevents completion.
3. What progress or quantity affects that decision.
4. What secondary identity or audit information is still needed.

Place information in that order unless the workflow supplies a stronger
reason.

## Find And List Screens

- Put search first, compact query controls second, and results third.
- Use compact chips, small outline controls, or sheet/popover triggers for
  filter and sort controls on mobile.
- Reserve full-width buttons for primary workflow actions, not routine filters
  or sorting.
- Keep selected filter values visible when they affect the result set.
- Preserve result density on mobile so users can compare several records
  without excessive scrolling.

## Status And Progress Density

- Use compact status chips or badges in lists, headers, and task summaries.
- Avoid oversized status cards unless status is the main workflow decision.
- When progress matters more than raw status, pair the compact status with the
  smallest useful progress or quantity summary.
- Do not let status treatment consume more space than the action or decision it
  supports.

## Deduplicate Content

- Show a record identifier where it supports recognition or navigation, not in
  every card section.
- Use one meaningful status treatment unless separate states represent
  genuinely different concepts.
- Avoid repeating timestamps or explanatory text in header, summary card and
  action area.
- Move low-value metadata behind detail sections or secondary actions.
- Do not display fields simply because the API provides them.
