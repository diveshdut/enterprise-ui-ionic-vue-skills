# Navigation Controls



## Segment

Foundation:

- Component set: Segment
- Usage reference page: Segment
- Representative segment button families: Icon only, Text + icon start, Text only, Text + icon end, Text + icon vertical
- Use for peer view switching, mode switching, or grouped view state selection.

The live Segment set exposes three outer variant axes:

| Property | Values | Usage |
| --- | --- | --- |
| `Type` | `Text & Icon`, `Icon`, `Text` | Choose whether each segment shows both label and icon, icon only, or text only. |
| `Icon layout` | `Top`, `Bottom`, `Start`, `End` | Choose icon position relative to the label when the chosen type includes an icon. |
| `Shadow` | `False`, `True` | Use `True` when the segment surface needs the elevated treatment shown on the page. |

### Live Variant Matrix

The page exposes these 12 live segment compositions:

| Variant | Size | Structure |
| --- | --- | --- |
| `Type=Text & Icon, Icon layout=Top, Shadow=False` | `375 x 70` | Three vertical segment buttons |
| `Type=Text & Icon, Icon layout=Top, Shadow=True` | `375 x 70` | Same plus elevated shadow stack |
| `Type=Icon, Icon layout=Top, Shadow=False` | `375 x 48` | Three icon-only segment buttons |
| `Type=Icon, Icon layout=Top, Shadow=True` | `375 x 48` | Same plus elevated shadow stack |
| `Type=Text, Icon layout=Top, Shadow=False` | `375 x 48` | Three text-only segment buttons |
| `Type=Text, Icon layout=Top, Shadow=True` | `375 x 48` | Same plus elevated shadow stack |
| `Type=Text & Icon, Icon layout=Bottom, Shadow=False` | `375 x 70` | Three vertical segment buttons |
| `Type=Text & Icon, Icon layout=Bottom, Shadow=True` | `375 x 70` | Same plus elevated shadow stack |
| `Type=Text & Icon, Icon layout=Start, Shadow=False` | `375 x 48` | Three horizontal segment buttons |
| `Type=Text & Icon, Icon layout=Start, Shadow=True` | `375 x 48` | Same plus elevated shadow stack |
| `Type=Text & Icon, Icon layout=End, Shadow=False` | `375 x 48` | Three horizontal segment buttons |
| `Type=Text & Icon, Icon layout=End, Shadow=True` | `375 x 48` | Same plus elevated shadow stack |

The live set does not provide icon-only bottom/start/end variants or text-only
bottom/start/end variants on this page.

### Segment Shell Contract

Common shell behavior across the 12 variants:

| Attribute | Value |
| --- | --- |
| Layout mode | `HORIZONTAL` |
| Item spacing | `0` |
| Padding | `0` on all sides |
| Fill | White |
| Child count | Three live `Segment button` instances |
| Button width | Approximately `125` each inside the `375`-wide shell |

Shadow variants add a three-layer drop-shadow stack to the white segment shell.
Non-shadow variants use the same shell without those effects.

### Segment Button Families

#### Icon-only button

Source:

| Property | Type |
| --- | --- |
| `Icon` | `INSTANCE_SWAP` |
| `Active` | `VARIANT` |
| `Disable` | `VARIANT` |

| Attribute | Value |
| --- | --- |
| Width | `133` |
| Height | `48` |
| Layout mode | `VERTICAL` |
| Top padding | `12` |
| Content frame | `24 x 24`, vertical |
| Indicator | Nested `Segment / Elements / Indicator` at `133 x 2` |

Use for the icon-only top segment branches.

#### Text-only button

Source:

| Property | Type |
| --- | --- |
| `Label` | `TEXT` |
| `Active` | `VARIANT` |
| `Disable` | `VARIANT` |

| Attribute | Value |
| --- | --- |
| Width | `133` |
| Height | `48` |
| Layout mode | `VERTICAL` |
| Top padding | `12` |
| Content frame | `70 x 24`, vertical |
| Indicator | Nested `Segment / Elements / Indicator` at `133 x 2` |

Use for the text-only top segment branches.

#### Text and icon vertical button

Source:

| Property | Type |
| --- | --- |
| `Label` | `TEXT` |
| `Icon` | `INSTANCE_SWAP` |
| `Active` | `VARIANT` |
| `Disable` | `VARIANT` |

| Attribute | Value |
| --- | --- |
| Width | `133` |
| Height | `70` |
| Layout mode | `VERTICAL` |
| Top padding | `12` |
| Content frame | `70 x 46`, vertical |
| Observed content order | text then icon in the inspected active variant |
| Indicator | Nested `Segment / Elements / Indicator` at `133 x 2` |

Use for the vertical text-and-icon segment branches on the page.

#### Text and icon start button

Source:

| Property | Type |
| --- | --- |
| `Icon` | `INSTANCE_SWAP` |
| `Label` | `TEXT` |
| `Active` | `VARIANT` |
| `Disbale` | `VARIANT` |

| Attribute | Value |
| --- | --- |
| Width | `133` |
| Height | `48` |
| Layout mode | `VERTICAL` |
| Top padding | `12` |
| Content frame | `133 x 24`, horizontal |
| Content padding | `16` left/right |
| Observed content order | icon then text |
| Indicator | Nested `Segment / Elements / Indicator` at `133 x 2` |

Important: the live component property name is spelled `Disbale` in this set.
Document and preserve that exact exposed property when inspecting or editing it.

#### Text and icon end button

Source:

| Property | Type |
| --- | --- |
| `Label` | `TEXT` |
| `Icon` | `INSTANCE_SWAP` |
| `Active` | `VARIANT` |
| `Disable` | `VARIANT` |

| Attribute | Value |
| --- | --- |
| Width | `133` |
| Height | `48` |
| Layout mode | `VERTICAL` |
| Top padding | `12` |
| Content frame | `133 x 24`, horizontal |
| Content padding | `16` left/right |
| Observed content order | text then icon |
| Indicator | Nested `Segment / Elements / Indicator` at `133 x 2` |

### Active, Inactive, And Disabled Treatment

Representative inspected button variants show:

- active label/icon/indicator use the primary blue role
- inactive label/icon shift to neutral gray
- disabled states reduce label/icon opacity while preserving the same structure

Keep these differences inside the live segment button variants rather than
recoloring detached text or icons by hand.

### Usage Rules

- Use the 12 live Segment variants instead of drawing custom segmented pills.
- Keep each segment cell as a live `Segment button` instance with its nested indicator.
- Change label and icon content through the button family's exposed text and instance-swap properties.
- Choose the correct type and icon layout first, then select shadow treatment.
- Preserve the shell width, button count, and indicator structure when resizing or adapting a segment control.

## Tabs

Foundation:

- Usage reference page: Tabs
- Top layout example: Tabs
- Bottom layout example: Tabs
- Tabs / Button reference: Tabs / Button
- Alternate Tabs / Button reference: Tabs / Button
- Use for persistent five-option bottom navigation or top tab navigation.

The live Tabs shell exposes one outer variant axis:

| Property | Values | Usage |
| --- | --- | --- |
| `Icon layout` | `Top`, `Bottom` | Choose whether the icon appears above or below the label. |

### Tabs Shell Contract

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `56` |
| Layout mode | `HORIZONTAL` |
| Item spacing | `0` |
| Padding | `0` on all sides |
| Fill | White |
| Shadow | Thin top border/shadow line `0px -1px 0px rgba(0,0,0,0.07)` |
| Child structure | Five live `Tabs / Button` instances |

### Tabs / Button Contract

The live tab button family exposes selected and resting states with editable icon and label content.

| Property | Type | Purpose |
| --- | --- | --- |
| `Selected` | `VARIANT` | `True` for active tab, `False` for inactive tab. |
| `Icon` | `INSTANCE_SWAP` | Swaps the icon shown in the tab button. |
| `Label` | `TEXT` | The caption text. |
| `Label visible` | `BOOLEAN` | Shows or hides the caption text when needed. |

### Tabs / Button Layout

The inspected tab buttons are fixed-width navigation cells.

| Attribute | Value |
| --- | --- |
| Width | `75` observed in the five-tab shell; `98` observed in the standalone button sample |
| Height | `56` |
| Layout mode | `NONE` |
| Icon size | `24 x 24` |
| Label size | `12px` caption text |
| Label alignment | Centered under or over the icon depending on `Icon layout` |

### `Icon layout=Top`

The top layout shows the icon above the label.

| State | Visible order | Active color |
| --- | --- | --- |
| `Selected=True` | Icon, then label | Primary blue |
| `Selected=False` | Icon, then label | Medium gray |

### `Icon layout=Bottom`

The bottom layout shows the label above the icon.

| State | Visible order | Active color |
| --- | --- | --- |
| `Selected=True` | Label, then icon | Primary blue |
| `Selected=False` | Label, then icon | Medium gray |

### Usage Rules

- Keep the live Tabs shell and the live Tabs / Button instances together.
- Use the `Selected` state instead of recoloring detached icons or labels.
- Swap icons through the button's icon property rather than drawing custom glyphs.
- Use the top layout for app-wide tab bars when the icon should lead the label, and bottom layout when the label should lead the icon.
- Keep caption text inside the button; do not place external text labels above the tabs.

## Menu

Foundation:

- Usage reference page: Menu
- Text label stack: Menu / Elements / Text Labels
- Split pane shell: Menu / Split Pane
- Side menu shell: Menu / Side / Resting
- Temporary side surface: Menu / Elements / Surface / Temporary Side

The live Menu family is a composition system rather than a high-variant
component set. It is built from a menu-item text stack, a surface shell, and a
toolbar.

### Menu / Elements / Text Labels

| Attribute | Value |
| --- | --- |
| Width | `304` |
| Height | `256` |
| Layout mode | `VERTICAL` |
| Item spacing | `0` |
| Outer padding | `8` top/bottom, `0` left/right |
| Child structure | Five live `Item` instances |

Each child row is a live `Item` instance at `304 x 48`, using the `Media=Icon`
branch. That means menu labels, leading icons, and trailing badges or notes
still belong to the Item contract rather than a custom menu-only row system.

### Menu / Split Pane

| Attribute | Value |
| --- | --- |
| Width | `304` |
| Height | `640` |
| Layout mode | `NONE` |
| Children | `Surface`, `Text Labels`, `Toolbar` |

The split-pane branch uses:

- a fixed-width `Surface` vector at `304 x 640`
- a `Text Labels` instance at `304 x 256`
- a `Toolbar` instance at `304 x 56`

### Menu / Side / Resting

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `640` |
| Layout mode | `NONE` |
| Children | `Surface`, `Menu / Elements / Text Labels`, `Toolbar` |

The side-menu branch uses a full-width temporary surface treatment while the
menu content itself remains a `304`-wide stack anchored inside the larger
surface.

### Menu / Elements / Surface / Temporary Side

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `640` |
| Layout mode | `NONE` |
| Children | `Image Treatments / Overlay`, `Surface` |

This surface branch provides the side-menu overlay treatment and the visible
panel surface. Do not redraw it as a custom translucent rectangle plus panel.

### Usage Rules

- Treat Menu as a composition of live `Toolbar`, `Item`, and menu surface
  elements rather than a loose sidebar mockup.
- Keep the menu rows inside `Menu / Elements / Text Labels` and edit them as
  Item instances.
- Increase or decrease menu height by showing or hiding rows in the text-label
  stack or by adding rows to the master, following the kit usage note.
- Increase menu width by resizing the item width only where the menu shell
  already supports that behavior.
