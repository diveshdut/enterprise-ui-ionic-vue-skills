# Content And Data

## Card

Foundation:

- Component set: Card
- Autolayout false example: Card
- Autolayout true example: Card
- Card actions: Card / Actions

The live Card set exposes one variant axis:

| Property | Values | Usage |
| --- | --- | --- |
| `Autolayout` | `True`, `False` | Use `False` for a simple surface card and `True` when the card needs slot-based child composition. |

### Card Shell Contract

The Card shell is a live surface container, not a custom rounded rectangle.

| Branch | Structure | Notes |
| --- | --- | --- |
| `Autolayout=False` | `Card / Surface` rectangle | Use this when the card is just a background surface. |
| `Autolayout=True` | Slot-based card shell with multiple `Slot (add component inside)` instances | Use this when the card needs child components absorbed into the layout. |

### Card / Actions Contract

The live `Card / Actions` set exposes one variant axis:

| Property | Values | Usage |
| --- | --- | --- |
| `Action` | `Buttons`, `Checkbox` | Choose a button action bar or a checkbox-driven action row. |

#### `Action=Buttons`

The buttons branch contains:

- a divider instance at the top
- a content frame
- a live `Buttons` frame
- a `stopwatch-outline` icon instance
- two live Button instances: `Negative` and `Positive`

The nested buttons use the live Button component with `Size=Default`, `Style=Clear`, `Enabled=True`.

#### `Action=Checkbox`

The checkbox branch contains:

- a surface vector
- a live `Item` instance with `Media=Icon`

That Item branch keeps the checkbox/action row inside the live Item system rather than drawing a custom row.

### Card Example Compositions

#### List Card

The List Card example combines:

- padding top and padding bottom spacers
- an overline text block
- a content frame
- multiple `Item` instances with `Media=Thumbnail`
- each Item keeps its nested `Item / Master`, `Content / Start`, and
  `Content / End` controls for the row text and trailing metadata
- a trailing `Card / Actions` instance in `Action=Buttons`

The visible list rows should stay inside the live Item instances and their
nested `Item / Master` controls. Use the Item start/end content properties to
edit row text, note, badge, and disclosure behavior instead of rebuilding the
row manually.

#### Card with Chips

The chip card example combines:

- a label text layer
- direct live Chip instances, or a live `Chips` frame only when the inspected
  reference explicitly uses a grouped chip container
- three live Chip instances

All visible chips remain real Chip instances with their own `Outline` and
`State` controls. Do not add an extra chip wrapper by default when the same
layout works with direct Chip instances.

#### Payment Card

The payment card example combines:

- a live Card instance with `Autolayout=False`
- an Ionicon `card-outline`
- payment type text
- amount text
- a live `Content / End` instance for trailing metadata

The `Content / End` instance carries the badge / detail / select toggles; do not replace it with custom text and icons.

#### Product Card

The product card example combines:

- an image frame
- overlay rectangle layers
- a live `Content / Start` instance

Use the embedded content instance for text and metadata instead of directly drawing the labels.

#### Card with Content

The content card example is direct text content only:

- a title text layer
- a body text layer

It does not add nested Ionic subcomponents beyond the visible text.

### Card Usage Rules

- Use `Autolayout=False` for simple surface cards and `Autolayout=True` when
  the card is acting like a slot-based container.
- Keep card actions inside the live `Card / Actions` component.
- Keep buttons, checkboxes, chips, items, and badges live rather than custom.
- Use nested Item instances for card rows and metadata.
- Do not fake card layouts with loose rectangles and detached text.

## Accordion

Foundation:

- Component set: Accordion
- Header set: Accordion / Header
- Content component: Accordion / Content
- Usage reference page: Accordion
- Use for collapsible sections, progressive disclosure, and optional review details.

The live Accordion family is a disclosure container with `Expanded` and `Disabled`
variant axes on the main set, plus a dedicated header branch and a content
branch.

### Main Accordion Set

| Property | Values | Usage |
| --- | --- | --- |
| `Expanded` | `false`, `true` | Controls whether the content is revealed. |
| `Disabled` | `false`, `true` | Controls whether the accordion is interactive. |

The set contains three visible branches:

| Branch | Width | Height | Notes |
| --- | --- | --- | --- |
| `Expanded=false, Disabled=false` | `375` | `49` | Collapsed interactive header row. |
| `Expanded=false, Disabled=true` | `375` | `49` | Disabled collapsed header row. |
| `Expanded=true, Disabled=false` | `375` | `209` | Expanded header plus revealed content. |

### Accordion Header Contract

The dedicated header set exposes one variant axis:

| Property | Values | Usage |
| --- | --- | --- |
| `Expanded` | `false`, `true` | Switches between the collapsed and expanded header treatment. |

### Accordion Content Contract

The content component is a vertical shell thwraps a live `List` instance.

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `160` |
| Layout mode | `VERTICAL` |
| Main child | One live `List` instance |

The nested `List` instance exposes:

- `Label`
- `Header-button`
- `End slot`
- `End slot`

Use the live list structure for the revealed accordion content. The usage note on the page says the accordion can also host another component, but the inspected live default is a list.

### Usage Rules

- Use Accordion for collapsible workflow sections and progressive disclosure.
- Keep the revealed content inside the live Accordion / Content structure.
- Use the header branch to control collapsed versus expanded styling.
- Do not rebuild the disclosure as a custom heading row with a detached hidden panel.

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
- Preserve the visible select affordance as a live caret-and-label group rather than a detached icon plus text.

## List

Foundation:

- Component set: List
- Usage reference page: List

The live List component is a vertical auto-layout shell that composes a list
header, a divider, a spacing polygon, and repeated live Item rows.

### Shell Contract

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `406` on the master; `366` and `488` observed on usage instances |
| Layout mode | `VERTICAL` |
| Item spacing | `0` |
| Outer padding | `8` top/bottom, `0` left/right |
| Main child | `Content` frame |

### Exposed Properties

The List component set exposes four editable controls:

| Property | Type | Purpose |
| --- | --- | --- |
| `Label` | `TEXT` | Controls the visible list header label. |
| `Header-button` | `BOOLEAN` | Shows or hides the header button region. |
| `End slot` | `BOOLEAN` | Shows or hides the trailing header end slot. |
| `End slot` | `INSTANCE_SWAP` | Swaps the visible trailing header control or icon. |

### Content Composition

The nested `Content` frame is a vertical stack with these live children:

| Child | Type | Width | Height | Notes |
| --- | --- | --- | --- | --- |
| `List Header` | `FRAME` | `375` | `45` | Header row for the list title and optional trailing control. |
| `List Divider` | `FRAME` | `375` | `40` | Secondary label/divider row beneath the header. |
| `padding` | `RECTANGLE` | `16` | `16` | Spacing polygon used to tune the gap before the list body. |
| `Item` | `INSTANCE` | `375` | `61` | Repeated list rows, using the live Item system. |

The master contains eight repeated `Item` instances by default. Usage
instances resize by showing or hiding these existing item rows rather than
rebuilding the shell.

### Nested Contracts

- `Item` rows inside List are live Item instances and inherit the documented
  `Item`, `Item / Master`, `Content / Start`, and `Content / End` contracts.
- The list header owns the title and optional end controls; do not place loose
  direct text above the list to imitate a header.
- The `padding` rectangle is part of the spacing contract and is the supported
  way to adjust the gap between header/divider and the list body.

### Usage Rules

- Keep List as a real auto-layout stack, not a custom frame of dividers and
  text rows.
- Edit item rows through the nested live Item instances.
- Show or hide existing item rows to shorten or lengthen the list instance.
- Use the exposed header label and end-slot controls instead of direct text or
  detached icons.

## Reorder

Foundation:

- Component family page: Reorder
- Reorder item master: Reorder / Item
- Reorder list example: Reorder / List
- Use for editable list ordering where rows can be dragged into a new sequence.

The usage note on the page is important: the reorder component is almost the
same as the list component, but it uses a dedicated reorder item master so icon
and item styling can be edited in one place and reused across the whole list.

### Reorder / Item Contract

The dedicated row master inspected wraps a live Item row with a
reorder affordance.

| Attribute | Value |
| --- | --- |
| Component type | `COMPONENT` |
| Width | `375` |
| Height | `48` |
| Layout mode | `VERTICAL` |
| Main child | One nested `Item` instance |
| Nested item size | `375 x 48` |
| Nested item layout | `HORIZONTAL` |

Treat this as the canonical reorder row. Do not build reorder rows from a loose
Item plus a detached drag handle.

### Reorder / List Contract

The inspected reorder-list examples behave like a list shell specialized for
reordering.

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `485` on the large inspected instance; `301` and `248` on usage examples |
| Layout mode | `VERTICAL` |
| Outer padding | `8` top/bottom |
| Structure | List-like header/divider stack plus repeated `Reorder / Item` rows |

### Nested Contracts

- `Reorder / Item` inherits the visual row behavior of the live `Item` system.
- The reorder list keeps the same overall list rhythm as `List`, including the
  header/divider pattern on the examples page.
- Row text and media should still be edited through the nested live Item
  content, while drag styling belongs in the reorder row master.

### Usage Rules

- Use `Reorder / List` when the primary interaction is reordering, not a plain list.
- Edit the dedicated reorder row master if the drag-handle styling or row icon treatment needs to change across the whole set.
- Preserve the list-like vertical stack and spacing instead of rebuilding reorder lists as ad hoc frames.
- Keep the reorder affordance inside the live reorder row structure.


## Item

Foundation:

- Component set: Item
- Master example: Item / Master
- Start content: Content / Start
- End content: Content / End
- Use for list rows, action-sheet rows, menu rows, detail rows, and compound media-driven records.

### Hierarchy Map

The live Item system is nested in this order:

- `Item` page
- `Item` instance variant
- `Media` branch
- `Item / Master`
- `Content`
- `Content / Start`
- `Content / End`

The media branch changes by variant:

- `Item -> Item -> Media=None -> Item / Master -> Content -> Content / Start + Content / End`
- `Item -> Item -> Media=Icon -> Item / Master -> Content -> Content / Start + Content / End`
- `Item -> Item -> Media=Avatar -> Item / Master -> Content -> Content / Start + Content / End`
- `Item -> Item -> Media=Thumbnail -> Item / Master -> Content -> Content / Start + Content / End`

The deep substructure under `Content / Start` and `Content / End` is where the
text layers, badge, select, chevron, and toggles live.

### Variants

The live Item component set exposes one outer media axis:

| Property | Values | Usage |
| --- | --- | --- |
| `Media` | `None`, `Icon`, `Avatar`, `Thumbnail` | Choose the visible row media pattern before editing labels or end content. |

### Outer Item Shell Contract

The outer Item shell provides the structural row surface.

| Attribute | Value |
| --- | --- |
| Width | `375` observed in the standard examples |
| Height | `61` for `Media=None` and `Media=Icon`, `68` for `Media=Avatar`, `88` for `Media=Thumbnail` |
| Layout mode | `HORIZONTAL` |
| Width behavior | Fixed outer width, fill internally |
| Height behavior | Hug content |
| Left padding | `16` |
| Right padding | `0` |
| Inner alignment | Centered cross-axis alignment |
| Surface | White |
| Media slot | Driven by the selected `Media` variant |

### Item / Master Contract

The nested `Item / Master` is the visible row container used by all media
variants.

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `61` observed in the default row |
| Layout mode | `HORIZONTAL` |
| Primary sizing | Fixed width, hug height |
| Inner content width | `FILL` on the child content frame |
| Item spacing | `0` on the shell, `16` inside the content area |
| Content padding | `8` top/bottom in the content frame |

Use `Item / Master` as the visible row surface. Do not recreate it as a loose
rectangle plus text.

### Item / Master Exposed Properties

The live `Item / Master` instance exposes two editable controls at this level:

| Property | Type | Purpose |
| --- | --- | --- |
| `Thumbnail` | `INSTANCE_SWAP` | Swaps the thumbnail media subcomponent when the row uses thumbnail media. |
| `Start slot` | `INSTANCE_SWAP` | Swaps the leading start-content instance used by the row. |

These are the real instance-level toggles for this layer. The more specific
start/end visibility controls live inside `Content / Start` and `Content / End`.

### Media Contract

The Item media branch is a dedicated leading-media frame inside the row.

| Media Variant | Frame Size | Child Structure | Notes |
| --- | --- | --- | --- |
| `None` | `40 x 40` | Empty media frame | Used when the row has no leading media. |
| `Icon` | `40 x 24` | `Icon` group with Ionicon and padding | Used for symbolic leading actions or categories. |
| `Avatar` | `40 x 40` | `Images / Avatar / Circular` instance | Used for people or account avatars. |
| `Thumbnail` | `56 x 56` | `Image` instance with internal `Surface` image-surface group | Used for product/media thumbnails. |

Observed media internals:

- The thumbnail branch uses an `Image` instance from `_Images / 1:1 / Corners`.
- The thumbnail `Image` contains a `Surface` group with a surface shape and an
  image rectangle, which is the live image-surface behavior.
- The avatar branch uses `Images / Avatar / Circular`.
- The icon branch uses an icon group with a 24px Ionicon and spacing padding.

Do not replace the media branch with a custom rectangle, crop, or icon stack.

### Labels Wrapper

The `Lables` wrapper is the horizontal container that aligns `Content / Start`
and `Content / End`.

| Attribute | Value |
| --- | --- |
| Width | `359` observed on the standard row |
| Height | `45` observed on the standard row |
| Layout mode | `HORIZONTAL` |
| Primary alignment | Space between |
| Cross-axis alignment | Center |
| Right padding | `16` |
| Top / bottom padding | `4` |
| Width behavior | Fill inside the item |
| Height behavior | Fill inside the item |

The wrapper's job is only to position start and end content. Keep the visible
labels and end affordances in their own masters.

### Content / Start Contract

The start content component is the leading text stack and label block for an
item.

| Attribute | Value |
| --- | --- |
| Width | `108` |
| Height | `24` |
| Layout mode | `VERTICAL` |
| Align items | Center on the primary axis |
| Width behavior | Fixed width |
| Height behavior | Hug content |

Exposed properties:

| Property | Default | Purpose |
| --- | --- | --- |
| `Overline` | `False` | Show or hide the overline label. |
| `Label` | `Overline` | Overline text value. |
| `List item` | `True` | Show or hide the primary item label. |
| `Label` | `Item` | Primary item label. |
| `Subtitle` | `False` | Show or hide the subtitle row. |
| `Label` | `Subtitle` | Subtitle text value. |
| `Secondary 1` | `False` | Show or hide the first secondary row. |
| `Label` | `Secondary text 1` | First secondary text value. |
| `Secondary 2` | `False` | Show or hide the second secondary row. |
| `Label` | `Secondary text 2` | Second secondary text value. |

Toggle matrix:

| Toggle | Default | Notes |
| --- | --- | --- |
| `Overline` | `False` | Adds the small top label. |
| `List item` | `True` | Keeps the main item label visible. |
| `Subtitle` | `False` | Adds the subtitle row under the title. |
| `Secondary 1` | `False` | Adds the first secondary metadata row. |
| `Secondary 2` | `False` | Adds the second secondary metadata row. |

Observed child text layers:

| Child | Style |
| --- | --- |
| `Overline` | `Roboto Medium`, `10px`, uppercase, 1.5px letter spacing |
| `List item title` | `Roboto Regular`, `16px` |
| `List item subtitle` | `Roboto Regular`, `14px` |
| `Secondary text 1` | `Roboto Regular`, `14px`, muted color |
| `Secondary text 2` | `Roboto Regular`, `14px`, muted color |

### Content / End Contract

The end content component carries trailing metadata, badges, selection affordances, and disclosure cues.

| Attribute | Value |
| --- | --- |
| Width | `52` observed in the default badge-only variant |
| Height | `37` observed in the default badge-only variant |
| Layout mode | `HORIZONTAL` |
| Align items | End-aligned on the primary axis, centered cross-axis |
| Gap | `16` |
| Width behavior | Hug content |
| Height behavior | Hug content |

Exposed properties:

| Property | Default | Purpose |
| --- | --- | --- |
| `Note` | `True` | Show or hide a note label. |
| `List item` | `False` | Toggle the list-item style end layout. |
| `Badge` | `True` | Show or hide an embedded Badge. |
| `Badge` |  | Badge instance swap used by the end slot. |
| `Select` | `False` | Show or hide the select affordance. |
| `Detail push` | `False` | Show or hide the detail chevron. |
| `End slot` | `False` | Toggle the generic end-slot region. |
| `End slot` |  | Instance swap for the generic end-slot icon. |
| `Label` | `note` | Note label text. |
| `Label` | `Item` | List-item title text. |
| `Secondary` | `False` | Show or hide the secondary text row. |
| `Label` | `Item` | Secondary text value. |
| `Label` | `Select` | Select label text. |

Toggle matrix:

| Toggle | Default | Notes |
| --- | --- | --- |
| `Note` | `True` | Adds the compact note label above the title. |
| `List item` | `False` | Switches into the list-item end layout. |
| `Badge` | `True` | Shows the trailing badge instance. |
| `Select` | `False` | Shows the select affordance group. |
| `Detail push` | `False` | Shows the disclosure chevron. |
| `End slot` | `False` | Enables the generic end-slot region. |
| `Secondary` | `False` | Adds the secondary text row. |

Observed child layers:

| Child | Purpose |
| --- | --- |
| `Contents` | Vertical wrapper for note, title, secondary text, and badge |
| `Note` | Small top note label, `Roboto Regular`, `12px` |
| `List item title` | Primary label, `Roboto Regular`, `16px` |
| `Secondary text 1` | Secondary text row, `Roboto Regular`, `14px` |
| `Badge` | Live Badge instance, used for trailing metadata |
| `Select` | Select affordance group with caret and label |
| `Detail push` | Chevron-forward instance used for drill-in rows |
| `old / ionicons / arrow-forward` | Generic end-slot disclosure icon |

### Media Variants

The outer component exposes media-driven row compositions:

The live component set exposes only one top-level toggle here:
`Media = None | Icon | Avatar | Thumbnail`. The media branches themselves are
nested structure, not separate boolean properties.

| Media | Typical Height | Notes |
| --- | --- | --- |
| `None` | `61` | Text-only row with start and end content. |
| `Icon` | `61` | Leading icon row with the same row height as the text-only version. |
| `Avatar` | `68` | Slightly taller row to accommodate avatar media. |
| `Thumbnail` | `88` | Tallest row for thumbnail media. |

### Resizing Rules

Preferred:

- Start from the correct `Media` variant before editing content.
- Edit the nested start and end content properties instead of drawing separate
  labels and icons.
- Use the row as a stable list primitive inside menus, sheets, lists, and
  detail views.

Avoid:

- Building custom row surfaces from rectangles and loose text.
- Mixing badge, select, and chevron behaviors outside the end content master.
- Manually resizing the internal content stack away from the live item pattern.

### Usage Checklist

Before completing a design thuses Item:

- The correct `Media` variant is selected first.
- Start and end content are edited through their component-owned properties.
- Visible labels, badges, and disclosure icons stay inside the Item structure.
- No hidden Item instance sits behind custom visible primitives.
