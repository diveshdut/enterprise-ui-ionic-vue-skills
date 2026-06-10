# Lists And Collections



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

### Structuring Notes

Use List as the main organizer when a workflow needs several quick sections
such as personal details, shipping addresses, saved payment methods, or other
account-style groupings.

- Keep each section as a live List or a repeated Item group instead of laying
  out custom text blocks.
- Use outline-style Ionicons for leading cues when the icon set already
  provides a clean secondary/action treatment such as mail, phone, lock, or
  location.
- If the workflow needs horizontal browsing for a sequence such as recent
  orders, place that content in a separate horizontal band or carousel-like
  treatment rather than forcing the main List into a sideways layout.

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

### Slot Swap Behavior

The Item family is designed to accept real component swaps inside its exposed
slots. Use that flexibility when the workflow needs a more specific control
than the default row affordance.

- Swap a chip, button, or similar compact control into the live slot when the
  inspected branch exposes that instance swap.
- Use a date selector or other picker-style control in a slot when the row is
  acting like a compact filter or input affordance.
- Keep the swapped component live so its own variants, states, and sizing
  rules remain intact.
- Let the slot's auto-layout direction determine how the inserted control
  grows inside the row: horizontal slot layouts expand in a row direction,
  while vertical slot layouts expand in a column direction.
- Do not wrap the swapped component in a custom detached shell just to mimic
  the same behavior.

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

Use the `Note` region for compact supplemental values such as a gift card
balance or other inline metadata. If the same location needs an action, swap
the note for a live button or similar control instead of drawing a custom text
label and fake button surface.

When a workflow needs a different trailing control than the default badge,
select, or disclosure cue, swap the live control into the end slot rather than
redrawing the region manually. Keep the inserted control as a real Ionic
component so its own props and states remain available.

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
