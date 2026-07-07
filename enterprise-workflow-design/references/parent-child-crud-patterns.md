# Parent-Child CRUD Patterns

Use this pattern for workflows where one parent record owns or associates one
or more child records.

## Screen Responsibilities

| Surface | Responsibility | Preferred Ionic composition |
| --- | --- | --- |
| Parent list | Find and open parent records; optionally create a parent | Searchbar, filters, List/Item rows, and one documented create action such as FAB |
| Parent create | Enter only parent-level fields | Toolbar, form controls, precise primary action, and cancel/back behavior |
| Parent detail | Show parent summary and switch among child collections | Summary Item, embedded record-level Edit action, Segment, and child sections |
| Child collection | List children associated with the current parent | Section action, repeated Item rows, empty/loading/error states |
| Child add | Find, create, or associate a child in the current parent context | Dedicated page or modal with breadcrumb/back context and a precise add action |
| Child detail/edit | Inspect or update one child | Summary Item or form plus child-specific sections and actions |

## Parent List And Creation

- Keep the parent list focused on discovery. Do not add navigation buttons for
  child collections when the application menu already exposes them.
- Use one proven create affordance. Prefer the application's established FAB
  pattern when creation is a frequent global action.
- Label the create action with the object being created, such as `Create rule`
  or `Create workspace`, rather than `Add` or `Submit`.

## Parent Detail

- Present parent name, description, status, quantities, and other read-only
  metadata as summary content, not as input-looking controls.
- Use one native Item or the established summary composition when it can hold
  the header information without extra cards or wrappers.
- Place Edit inside the summary action area. Open a focused edit modal or page
  for parent fields rather than turning the entire detail screen into a form.
- Remove redundant type badges when the page title and context already identify
  the record type.
- Use Segment for peer child collections when the labels remain readable on
  mobile. Use drill-down navigation when the segment count or labels no longer
  fit the supported component.

## Child Collections

- Place one secondary or outline add action inside the active child section.
  Align it with the section content and keep it near the child rows.
- Use a precise label such as `Add member to workspace`; avoid generic `Add`,
  `Submit`, or multiple unexplained action buttons.
- If users can either associate an existing child or create a new child, let one
  add action open a chooser/search workflow unless the established application
  pattern clearly separates those actions.
- Show only the metadata needed to identify and compare rows on mobile. Move
  secondary details into child detail rather than overloading every row.
- Put edit, remove, and delete controls in the Item end slot or supported row
  action area. Apply the same structure to every equivalent row.
- Use an icon-only destructive button only when its meaning is clear and the
  accessible label remains available in implementation.

## Child Add And Association

- Omit the full parent summary from the add page when breadcrumb/back context
  already identifies the parent.
- Preserve enough context to return safely to the originating parent and active
  child section.
- Use search/autocomplete for large entity sets; do not force users to scan a
  long Select list.
- Use live datetime controls for effective dates and active periods.
- After success, return to the same parent section and show the new association.
- On cancel or back, return without mutation.

## Independent Child Management

When children can exist independently of a parent:

- Provide a separate child list/menu entry for direct discovery and creation.
- Let the child create/edit flow manage child-level fields without requiring a
  parent association.
- Offer parent association as a distinct step or field when needed.
- Reuse the same child detail and validation rules whether the user entered from
  the parent or the independent child list.

## Mutation States

Design and implement loading, empty, saving, success, validation error,
permission/read-only, and conflict states. Confirm destructive removal before
mutation, and distinguish removing an association from deleting the child
record itself.

## Review Checklist

- Parent metadata and child actions are visually separated.
- Edit belongs to the record summary; add belongs to the collection; delete
  belongs to the row.
- Repeated rows use consistent native Item actions.
- Add pages retain parent context without repeating the full parent header.
- Labels identify both the action and affected object.
- Mobile layouts preserve readable segments, rows, and action placement.
