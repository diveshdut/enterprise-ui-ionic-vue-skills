# Cards And Surfaces



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
