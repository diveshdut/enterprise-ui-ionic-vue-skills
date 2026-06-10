# Forms And Inputs



## Input

Foundation:

- Component set: Input
- Example page: Input examples

The live Input set exposes two variant axes:

| Property | Values | Usage |
| --- | --- | --- |
| `Type` | `Default Label`, `Fixed Label`, `Floating Label`, `Multiline` | Choose the label/input presentation before editing text. |
| `Filled` | `True`, `False` | Choose the filled surface treatment versus the regular underlined treatment. |

### Input Property Contract

The live set exposes the following editable properties:

| Property | Type | Purpose |
| --- | --- | --- |
| `Input` | `TEXT` | The visible input value / placeholder text used in the body of the field. |
| `Placeholder` | `TEXT` | Placeholder content used by label/input branches that show a prompt. |
| `Label` | `TEXT` | The visible field label. Different branches use this for fixed, floating, or auxiliary labels. |
| `Clear` | `INSTANCE_SWAP` | Swaps the clear icon/control shown at the end of the field. |
| `Helper text` | `BOOLEAN` | Shows or hides the helper / error text region. |

### Input Variant Anatomy

#### `Default Label`

- Uses a `Label + Input` frame.
- Keeps the input line and label together in one horizontal composition.
- Uses a border-bottom text field instance underneath.
- Includes a helper / error text instance in the branch.

#### `Fixed Label`

- Uses a `Label + Input` frame when the field is not filled.
- Keeps the label fixed rather than floating.
- Uses the same bottom border text field instance and helper / error text region.

#### `Floating Label`

- Uses a separate `Label` frame above the input body.
- Uses the bottom border text field instance beneath it.
- When `Filled=True`, the branch adds a dedicated `Input` frame that contains
  the visible input text and the `Clear` instance swap.
- Includes the helper / error text instance in both filled states.

### `Floating Label` / `Filled=True` Node Contract

The live branch example has the following layout and appearance
contract:

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `56` |
| Layout mode | `VERTICAL` |
| Primary sizing | Auto height |
| Counter-axis sizing | Fixed width |
| Background | Transparent / invisible white fill |
| Border | None on the outer wrapper |
| Top region | `Label` frame |
| Middle region | `Input` frame with the visible text and clear control |
| Divider region | `_Text Field / Elements / Border Bottom / Regular` |
| Bottom region | `Helper & error text` instance |

Keep the label, input text, clear control, divider, and helper text in this
same stacked order. Do not rebuild the field as a custom rectangle with loose
text layers.

#### `Multiline`

- Uses an `Inputs` frame instead of a single line input.
- The visible body contains multiple input text lines stacked together.
- Uses the bottom border text field instance and helper / error text region.

### Input Usage Rules

- Pick the correct `Type` first, then set the text properties.
- Use `Filled=True` only when the filled surface branch matches the design.
- Toggle the helper text region instead of drawing a separate caption.
- Use the `Clear` instance swap for the trailing clear control instead of a
  custom icon.
- Use `Multiline` for text areas and longer comments, not for single-line
  fields that merely need extra height.
- For heavily reused branches, document the node-level layout contract too:
  width, height, layout mode, region order, alignment, and surface treatment.

## Date Time

Foundation:

- Component: Date Time
- Usage reference page: Date time picker
- Example instance: Date Time
- Use for date, time, and combined date-time selection in scheduling and due-date flows.

### Component Contract

The live Date Time component is a vertical picker shell with optional header and footer regions.

| Property | Type | Purpose |
| --- | --- | --- |
| `Footer` | `BOOLEAN` | Shows or hides the footer action row. |
| `Header` | `BOOLEAN` | Shows or hides the header/title region. |
| `Label` | `TEXT` | The header label text, such as `SELECT A DATE FOR RESERVATION`. |

### Observed Layout Contract

The inspected `Header=True, Footer=True` instance has this layout:

| Attribute | Value |
| --- | --- |
| Width | `286` |
| Height | `495` |
| Layout mode | `VERTICAL` |
| Child order | Header/title, calendar header, calendar body, time row, footer |
| Primary sizing | Auto height |
| Counter-axis sizing | Auto width in the instance |

The visible picker content includes:

- Header/title text
- Month/year row
- Day-of-week row
- Calendar day grid
- Time row
- Footer actions such as `Reset`, `clear`, and `Good to Go!`

### Example Branch Notes

| Node | Notes |
| --- | --- |
|  | Base Date Time component with optional header/footer properties. |
|  | Full picker instance with header and footer enabled. |

### Usage Rules

- Use the live Date Time picker for scheduling and due-date selection instead
  of drawing a custom calendar or clock.
- Keep date/time labels, calendar content, and footer actions inside the live
  component structure.
- Toggle the header and footer through the exposed boolean properties rather
  than by adding detached text or buttons outside the picker.
- Pair this component with Input or Select patterns only when the picker is
  launched from a form field.

## Select / Resting

Foundation:

- Page: Select
- Resting example: Select / Resting
- Use for dropdown-style selectors in configuration fields, setup forms, and row-based option pickers.

The live Select page is a composition wrapper around live `Item` rows plus the
existing `Select` affordance in `Item / Content / End`. The page guidance is
explicit: expand or contract the component through `Item`, edit labels through
the row content, and add start media by toggling the `Select` option in the end
slot.

### Shell Contract

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `48` on the canonical resting row |
| Layout mode | Wrapper composition around a live `Item` row |
| Main child | One live `Item` instance |
| Reused row contract | `Item -> Item / Master -> Content -> Content / Start + Content / End` |

### Observed Resting Row Composition

The canonical resting row is built from the existing Item system and a trailing
select affordance:

| Region | Observed structure | Notes |
| --- | --- | --- |
| Start row | `Item / Content / Start` | Holds the primary label or label stack. |
| End row | `Content / End` | Holds a live Badge, then the select affordance. |
| Select affordance | Caret-down icon plus right-aligned label | The caret icon can be swapped and the label can be edited. |

Observed example rows on the page:

| Variant | Media | Start content | Select label | Height |
| --- | --- | --- | --- | --- |
| Canonical resting row | `None` | `Item` | `Select` | `48` |
| Icon row | `Icon` | `Brightness` | `Medium` | `48` |
| Avatar row | `Avatar` | `John Adams`, `Planting seeds` | `Mute` | `48` |
| Thumbnail row | `Thumbnail` | `Hoodie`, `Black \| Small` | `1` | `48` |

Observed select row variations do not create a new outer variant axis. They
change the nested `Item` media and the select affordance text/icon content.

### Select Row Media Variations

| Media | What changes | Example shown on page |
| --- | --- | --- |
| `None` | Text-only row with badge + select affordance | `Item` / `Select` |
| `Icon` | Leading icon appears in the Item media slot | `Brightness` / `Medium` |
| `Avatar` | Leading avatar appears in the Item media slot | `John Adams` / `Mute` |
| `Thumbnail` | Leading thumbnail appears in the Item media slot | `Hoodie` / `1` |

### Usage Rules

- Use `Item` to grow or shrink the select row instead of building a custom dropdown field.
- Edit the row labels through `Item / Content / Start`.
- Use the Item end-content `Select` toggle and label to control the caret + value affordance.
- Add media through the Item media variants when the row needs an icon, avatar, or thumbnail.
- When a chip, date selector, or other custom compact control better matches
  the workflow, swap that control into the live slot instead of drawing a
  detached custom element.
- Preserve the visible select affordance as a live caret-and-label group rather than a detached icon plus text.
