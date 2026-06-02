# Ionic Component Pattern Examples

Use this reference before introducing or revising a visible UI element in a
Figma enterprise workflow. For each element, inspect both:

1. The Ionic component foundation in the Ionic Components page.
2. At least one existing workflow usage in Fulfillment, Receiving, Job Manager,
   Find Product, Find Order, Find Shipment, PO Detail, or a closer live
   reference.

Component reuse only counts when the visible UI is produced by the component
instance, its variant, its slots, or editable child layers. Do not place a
hidden Ionic component behind custom visible rectangles, labels, or icons.

## Canonical Live Examples

Inspect these examples before designing the same UI element. Use the visible
component instances and slots shown in the example; do not recreate them with
custom primitives.

| UI Element | Example Node |
| --- | --- |
| Alert | [Alert / Basic](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=28335-91961&t=hEXHxO7yI4T4m4pV-1) |
| Popover | [Popover](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=28335-91925&t=hEXHxO7yI4T4m4pV-1) |
| Modal and contained list | [Time zone modal](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=29987-73331&t=hEXHxO7yI4T4m4pV-1) |
| Card with action item | [Card with actions/Item](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=29987-73987&t=hEXHxO7yI4T4m4pV-1) |
| Card with button | [Card with actions/Button](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=29987-73986&t=hEXHxO7yI4T4m4pV-1) |
| Dropdown select | [Select / Resting](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=17110-55551&t=hEXHxO7yI4T4m4pV-1) |
| Card with chips | [Card with chips](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=16672-61816&t=hEXHxO7yI4T4m4pV-1) |
| List card | [List Card](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=20989-74336&t=hEXHxO7yI4T4m4pV-1) |
| Input | [Input](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=23447-90154&t=hEXHxO7yI4T4m4pV-1) |
| Date time picker | [Date time picker](https://www.figma.com/design/1wantteXXUlzPRYev1X5gr/Ionic-8-Material-UI-Kit--Community---Community-?node-id=22803-78245&t=hEXHxO7yI4T4m4pV-1) |

## Searchbar

Good:
- Use the Ionic Searchbar instance for the visible search field.
- Put placeholder/value text inside the searchbar component content layer.
- Keep the search icon from the component or Ionicons, not a hand-drawn icon.

Bad:
- Draw a rounded rectangle and custom text over a hidden Searchbar instance.
- Replace the searchbar with a large button-like filter panel.

Audit question:
- If the Searchbar instance is hidden or removed, does the visible search UI
  disappear? If not, it is custom UI, not component reuse.

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

## Status Chips And Badges

Good:
- Use Badge or Chip instances for compact status such as `Running`, `Queued`,
  `Completed`, `Blocked`, or count metadata.
- Place badges in item end slots or compact card header/action regions when
  status is supporting information.
- Use status color roles from Semantic Colors.

Bad:
- Build status as custom rounded rectangles and text.
- Let status occupy more space than the action, exception, or progress summary
  unless status is the main decision surface.

Example:
- In a production run list row, put the status badge in the Item end slot and
  keep quantity/date as secondary item text or a compact note.

## Cards

Good:
- Use the Ionic Card component and its supported content surface/slot pattern.
- Inspect card usage in workflow pages before choosing card variant,
  elevation, padding, and content structure.
- For dense operational content, nest Ionic Item rows, Badge instances, and
  Progress Indicator instances inside the card content area.

Bad:
- Draw a custom white rectangle, then place a hidden Card instance behind it.
- Put cards inside decorative cards or create a new card styling convention
  without checking existing card pages.

Example:
- A run summary card can be a real Card containing an Item for product/schedule
  text, a Badge for status, and a Progress Indicator for completion.

## List Items And Results

Good:
- Use Ionic Item patterns for result rows, task rows, and material rows.
- Put primary text in the item title/start content and secondary metadata in
  note/detail/end content when the component supports it.
- Keep row actions, badges, and disclosure icons inside component slots.

Bad:
- Build rows from separate rectangles, text, icons, and dividers when an Item
  pattern exists.
- Place visible quantity/status text outside an Item while also using a hidden
  Item instance.

Example:
- A material row should use an Item with material name in start content and
  required quantity/status in end content or Badge slots.

## Inputs And Selects

Good:
- Use Ionic Input or Select instances for form fields.
- Put label, placeholder, helper, and value text inside the component's editable
  layers.
- Inspect setup/admin forms for stacked mobile behavior and desktop grouping.
- Use the dropdown select example for select fields and the input example for
  text/value fields before designing forms.

Bad:
- Draw a form field border and direct labels manually over a hidden Input.
- Use custom dropdown rows where Select or Item-based select patterns exist.

Example:
- A create form field such as `Facility` should be an Input or Select instance
  with the label and value inside the component, not a standalone text label
  plus a custom underline.

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

## Card Compositions

Good:
- Use card-with-action-item when the card presents a list of actionable rows.
- Use card-with-button when the card has explicit primary or secondary actions.
- Use card-with-chips for selected values, tags, filters, or compact metadata.
- Use list-card for grouped operational rows inside a card surface.

Bad:
- Use a plain Card plus custom row/button/chip drawings when a concrete card
  composition example exists.
- Place chips, buttons, or item text outside the card/component layer tree.

Example:
- A production summary with selectable tags should start from the card-with-chip
  composition, while a card that asks users to take one explicit action should
  start from card-with-button.

## Date And Time Picker

Good:
- Use the Ionic date time picker component for scheduling and due-date flows.
- Keep date/time values and picker controls inside the component structure.
- Pair picker entry fields with Input/Select patterns when the picker opens
  from a form field.

Bad:
- Draw a custom calendar, clock, or date grid unless the Ionic datetime
  component cannot express the workflow.
- Use a plain text input for date/time selection when a picker is needed.

## Toolbar And Navigation

Good:
- Use Toolbar instances for page titles, back/menu buttons, and action slots.
- Use Ionicons for toolbar actions.
- Put toolbar title text inside the toolbar content/title layer.

Bad:
- Place direct title text over a toolbar instance.
- Draw custom icon shapes when Ionicons provides the action.

Example:
- A mobile detail page should use a Toolbar with a back icon, title, and action
  icons in toolbar slots instead of separate page-level primitives.

## Segments And Tabs

Good:
- Use Segment and Segment Button instances for mode switching.
- Put labels inside the Segment Button label layers and use the active variant
  for current state.

Bad:
- Draw custom segmented pills with hidden segment instances.
- Use large buttons where existing pages use segment controls for peer views.

Example:
- A view screen switching between `Tasks`, `Materials`, and `Activity` should
  use Segment Button instances for each label.

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

## Direct Text Layers

Good:
- Use direct text only for standalone content such as section headings, counts,
  explanatory copy, annotation notes, or page-index content.
- Name direct text semantically or literally based on existing pages:
  `Production Runs Count`, `Run Details Title`, `Materials Title`, `Job
  description`, `Pattern Filters + Results Title`.

Bad:
- Use generic duplicate layer names such as `Section Title` for multiple
  unrelated headings.
- Use direct text for labels that belong inside Button, Searchbar, Chip, Input,
  Item, Segment, Badge, or Toolbar components.

Example:
- `24 production runs` can be direct text named `Production Runs Count`.
  `Create production run` on a button must be the Button instance label, not
  direct text.

## Final Element Audit

Before reporting completion, inspect the created or edited page and summarize:

- Which visible UI elements are Ionic component instances.
- Which direct text layers remain and why they are legitimate content.
- Whether any component instances are hidden behind custom visible primitives.
- Whether each new element was checked against at least one workflow reference.
