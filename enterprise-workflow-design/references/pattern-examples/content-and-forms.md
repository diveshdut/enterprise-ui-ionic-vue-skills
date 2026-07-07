# Content And Forms

Use this reference when the UI element presents content density, card
composition, form input, or text behavior.

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

More specific card patterns:

- Use the `Autolayout=False` branch for a simple surface card.
- Use the `Autolayout=True` branch when the card needs slot-based child
  composition.
- Keep card action rows inside `Card / Actions` and use its `Buttons` or
  `Checkbox` variants.
- Keep list rows inside live Item instances, chip groups inside live Chip
  instances, and payment/product metadata inside the embedded card children.

## Inputs And Selects

Good:
- Use Ionic Input or Select instances for form fields.
- Put label, placeholder, helper, and value text inside the component's editable
  layers.
- Inspect setup/admin forms for stacked mobile behavior and desktop grouping.
- Use the dropdown select example for select fields and the input example for
  text/value fields before designing forms.
- Use `Select / Resting` when the field is really a dropdown row built on top of `Item`.
- Add icon, avatar, or thumbnail media through the Item media variants when the select row needs richer context.
- Choose the correct Input type first: `Default Label`, `Fixed Label`,
  `Floating Label`, or `Multiline`.
- Use the `Filled` branch only when the filled surface treatment is present in
  the live reference.
- Use the live Ionic datetime picker pattern for date and datetime fields; do
  not model them as `Select` rows just because they open a calendar.

Bad:
- Draw a form field border and direct labels manually over a hidden Input.
- Use custom dropdown rows where Select or Item-based select patterns exist.
- Build a custom select row when the live Item + Select affordance already matches the workflow.
- Use `Select` for `From date`, `Through date`, or other datetime entry
  controls when the workflow needs a real Ionic datetime picker.

Example:
- A create form field such as `Facility` should be an Input or Select instance
  with the label and value inside the component, not a standalone text label
  plus a custom underline.
- A routing `From date` field should be a live datetime picker control, not a
  select row with date text styled to look like a picker.

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

## Parent And Child Collections

Good:
- Keep the parent record summary or header separate from the repeated child
  collection.
- Place child actions, such as add, edit, or delete, inside the child section or
  row rather than floating them in page chrome.
- Use the child row to carry the action affordance when the parent already has
  its own header or summary.

Bad:
- Mix parent metadata and child row actions into one ambiguous surface.
- Put delete or add controls outside the child collection when the action
  clearly belongs to one parent-child relationship.

Example:
- A routing screen can show the routing header first and then keep product or
  operation add/remove actions inside the corresponding child list section.

## Date And Time Picker

Good:
- Use the Ionic date time picker component for scheduling and due-date flows.
- Keep date/time values and picker controls inside the component structure.
- Pair picker entry fields with Input/Select patterns when the picker opens
  from a form field.
- Prefer the live Date Time picker shell with its header, calendar body, time
  row, and footer actions when the workflow needs an actual picker surface.

Bad:
- Draw a custom calendar, clock, or date grid unless the Ionic datetime
  component cannot express the workflow.
- Use a plain text input for date/time selection when a picker is needed.

Example:
- The inspected picker examples include the base `Date Time` component and the
  full `25743:92135` instance with header and footer enabled.

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
