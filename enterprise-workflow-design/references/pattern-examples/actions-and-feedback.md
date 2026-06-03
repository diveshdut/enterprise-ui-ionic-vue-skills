# Actions And Feedback

Use this reference when the UI element drives an action, status, warning, or
feedback state.

## Filter And Sort Controls

Good:
- Use Ion Chip instances for compact filters under a searchbar.
- Use chip content layers for labels such as `Open`, `Facility`, `Due today`,
  or `Sort: newest`.
- Use compact outline buttons only when the workflow reference uses buttons for
  filter actions.

Bad:
- Use large full-width buttons for routine filters below search.
- Draw custom pill rectangles for chips while keeping real chips hidden.

Example:
- For a mobile find screen, prefer `Searchbar` followed by compact `Chip`
  instances for status, facility, date, and sort. Reserve a full-width button
  for a primary action such as `Create production run`.

## Chips

Good:
- Use Chip instances for filters, tags, selected values, and compact metadata.
- Keep the visible label inside the Chip's internal label layer.
- Toggle the start and end slots only when the data calls for an icon or
  avatar.
- Place simple filter chips directly in the parent auto-layout row instead of
  wrapping them in an extra container unless the live reference uses a grouped
  `Chips` frame.

Bad:
- Draw custom rounded pills with text while hiding a real Chip instance.
- Stretch a chip into a button when the workflow only needs a tag or filter.

Example:
- Filter chips under a search bar should use the live Chip component and its
  outline/state variants, not custom rectangles with direct text.

## Buttons

Good:
- Use Button instances and set the visible label inside the button's internal
  label layer, such as `btn master / normal > Label`.
- Match existing primary, secondary, outline, clear, icon, and disabled button
  variants before changing styling.
- Keep destructive, cancel, and secondary actions visually consistent with
  existing workflow examples.

Bad:
- Leave placeholder text such as `Button Label` in the layer tree.
- Overlay a direct text label on top of a button instance.
- Make cancel/secondary actions visually hang outside the button group.

Example:
- If the visible button says `Create production run`, the Button instance
  should contain that label in its internal label layer. There should not be a
  separate direct text layer named `Create production run` above the button.

## FAB

Good:
- Use the live FAB component for prominent floating actions and quick-create
  affordances.
- Keep the main icon inside the FAB instance or its swap target.
- Use the list branch and its directional slots when the action set expands.

Bad:
- Draw a custom circle and place an icon on top while hiding the FAB instance.
- Turn FAB into a generic button bar when the workflow only needs a floating
  action.
- Place detached buttons around the page to imitate the expanded FAB list.

Example:
- A production-run page can use a FAB for a primary quick action such as
  `Create` or `Add`, while the expanded list branch can surface nearby
  secondary actions inside the live slot groups.

## Toast

Good:
- Use Toast for transient success, error, connectivity, or undo feedback after
  an action completes.
- Keep the message text inside the live Toast instance and use the optional
  trailing button only when the user needs to act immediately.
- Use the leading slot for an icon when the message benefits from it.

Bad:
- Turn Toast into a persistent banner or a custom notification strip.
- Build the row from loose text and button layers while hiding the live Toast.
- Add a button branch when the workflow only needs a one-line acknowledgement.

Example:
- Show a compact toast after a save, sync, or connectivity event instead of
  leaving the user guessing whether the action completed.
- The canonical live example is `13309:120`, which shows `No internet
  connection` with a leading `globe-outline` and a trailing clear action.

## Toggle

Good:
- Use Toggle / Switch for binary settings and on/off preference rows.
- Keep the switch in the Item end slot or equivalent settings row.
- Preserve the live rail, knob, and disabled styling from the component.

Bad:
- Draw a custom rail and knob around a hidden Switch instance.
- Use a toggle for multi-choice selection when radio or segment is the clearer
  pattern.

Example:
- Use a switch in configuration cards and settings rows where the user is
  explicitly enabling or disabling one thing.
- The live row examples use `Item` compositions such as `12995:2932` and
  `13490:18130`, with the switch placed in the row end area.

## Status Chips And Badges

Good:
- Use Badge or Chip instances for compact status such as `Running`, `Queued`,
  `Completed`, `Blocked`, or count metadata.
- Place badges in item end slots or compact card header/action regions when
  status is supporting information.
- Use status color roles from Semantic Colors.
- Keep the visible badge built from the live Badge component, with a single
  editable label and the component's compact rounded surface.

Bad:
- Build status as custom rounded rectangles and text.
- Let status occupy more space than the action, exception, or progress summary
  unless status is the main decision surface.

Example:
- In a production run list row, put the status badge in the Item end slot and
  keep quantity/date as secondary item text or a compact note.

## Alerts, Popovers, And Modals

Good:
- Use Alert instances for confirmation, warning, destructive, and blocking
  decisions.
- Use Popover instances for compact contextual actions and field-adjacent
  options.
- Use Modal examples for focused create/edit flows and contained lists.
- Keep modal/list labels, buttons, and rows inside the appropriate Ionic
  component instances.

Bad:
- Draw custom overlay panels while keeping Alert, Popover, or Modal instances
  hidden.
- Use a modal for long multi-step record creation when a page or drill-down
  flow is more appropriate.
- Build modal-contained lists from loose text and dividers when Ionic List/Item
  patterns exist.

Example:
- A timezone or setup choice should follow the `Time zone modal` structure:
  modal shell, internal list/items, and component-owned action labels.

## Alerts

Good:
- Use the live Alert surface for compact confirmations such as save, discard,
  logout, or close-with-unsaved-changes.
- Edit the alert title, body, and action labels inside the component-owned
  text layers.
- Keep the alert at the compact modal-card size and preserve the two-action
  footer.

Bad:
- Rebuild an alert as a custom white card with detached labels and buttons.
- Use a full modal or page when the interaction is only a confirmation prompt.
- Leave generic placeholder labels in production designs.

Example:
- The alert examples show the same surface reused for generic, save-changes,
  and logout confirmations, with only the title/body/action copy changing.

## Action Sheets

Good:
- Use Action Sheet instances for quick contextual action lists and simple
  choice sets.
- Keep each row inside the nested Item component structure.
- Preserve the live item-row spacing and icon behavior from the reference.

Bad:
- Build an action sheet as a custom rounded panel with hand-placed text rows.
- Use an action sheet when the workflow needs a long-form or multi-step create
  experience.

Example:
- A quick menu for `Edit`, `Duplicate`, or `Delete` should use the live Action
  Sheet shell and its item rows.

## Checkbox

Good:
- Use Checkbox instances for binary selection inside rows or item lists.
- Swap the checked and unchecked icon masters instead of redrawing the mark.
- Keep the checkbox icon-sized and let the surrounding Item pattern carry the
  label.

Bad:
- Draw a custom square and checkmark.
- Turn a checkbox into a larger custom toggle block or card.

Example:
- Multi-select lists should place the checkbox in the leading icon slot of an
  Item row.

## Progress

Good:
- Use Progress Indicator instances for completion or loading progress.
- Keep progress paired with a concise label or adjacent status badge when the
  workflow needs explanation.

Bad:
- Draw progress tracks and fills manually.
- Use a large status area when a compact progress indicator plus badge carries
  the same meaning.

Example:
- A production run at `62%` should use the Linear Progress Indicator component,
  not a custom track rectangle.
