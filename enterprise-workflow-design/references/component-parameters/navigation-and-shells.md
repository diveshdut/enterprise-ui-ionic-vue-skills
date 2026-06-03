# Navigation And Shells

## Searchbar

Foundation:

- Component set: Searchbar
- Content set: Searchbar Content
- Usage reference page: Searchbar
- Use for inline search, find-in-list entry, or toolbar search affordances.

The live Searchbar set exposes one outer variant axis:

| Property | Values | Usage |
| --- | --- | --- |
| `In toolbar` | `False`, `True` | Use `True` when the searchbar sits in a toolbar-width shell; use `False` for the standalone field. |

### Searchbar Shell Contract

#### `In toolbar=False`

| Attribute | Value |
| --- | --- |
| Width | `343` |
| Height | `46` |
| Layout mode | `VERTICAL` |
| Item spacing | `10` |
| Padding | `16` left/right, `8` top/bottom |
| Corner radius | `4` |
| Fill | White |
| Effects | Three stacked drop shadows |
| Main child | One nested `Searchbar Content` instance at `311 x 30` |

This is the canonical standalone search field.

#### `In toolbar=True`

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `62` |
| Layout mode | `NONE` |
| Fill | White |
| Effects | Same three stacked drop shadows as the standalone field |
| Main child | One nested standalone `Searchbar` instance at `343 x 46` |

This branch wraps the same live field inside a toolbar-width shell instead of
changing the field internals.

### Searchbar Content Contract

The nested `Searchbar Content` set exposes the real editable search content:

| Property | Type | Purpose |
| --- | --- | --- |
| `Start slot` | `INSTANCE_SWAP` | Swaps the leading search icon slot. |
| `Label` | `TEXT` | The search prompt label, default `Search`. |
| `Input` | `TEXT` | The entered search value, default `Input`. |
| `Clear` | `INSTANCE_SWAP` | Swaps the trailing clear affordance. |
| `Clear` | `BOOLEAN` | Shows or hides the clear affordance. |
| `Value` | `VARIANT` | `False`, `True` |
| `Disable` | `VARIANT` | `False`, `True` |

### Searchbar Content Variants

#### `Value=False, Disable=False`

| Attribute | Value |
| --- | --- |
| Width | `343` |
| Height | `30` |
| Layout mode | `NONE` |
| Item spacing | `8` |
| Visible children | leading search icon, placeholder text |
| Placeholder treatment | medium gray text |

#### `Value=True, Disable=False`

| Attribute | Value |
| --- | --- |
| Width | `343` |
| Height | `30` |
| Layout mode | `NONE` |
| Item spacing | `8` |
| Visible children | search icon, entered input text, clear icon |
| Input treatment | dark text at high opacity |

#### `Value=False, Disable=True`

| Attribute | Value |
| --- | --- |
| Width | `343` |
| Height | `30` |
| Layout mode | `NONE` |
| Item spacing | `8` |
| Visible children | search icon, placeholder text |
| Disabled treatment | icon and placeholder reduced to disabled gray / lower opacity |

### Searchbar Usage Sizing Rules

The usage page shows the supported instance-level resizing behavior:

| Example | Size | Meaning |
| --- | --- | --- |
|  | `343 x 46` | Standard standalone field |
|  | `583 x 46` | Wider field created by expanding sideways |
|  | `343 x 90` | Taller field created by increasing vertical padding |

The page note is explicit:

- expand width sideways when the layout needs a longer field
- change height by increasing or decreasing vertical padding in the auto-layout settings
- edit placeholder or input text styles through `Searchbar Content`, not through detached text layers

### Usage Rules

- Keep the visible search field inside the live Searchbar shell.
- Edit placeholder, input, start icon, and clear behavior through `Searchbar Content`.
- Preserve the standalone field's vertical auto-layout, padding, radius, fill, and shadow stack unless the live component itself is being resized.
- Do not replace the field with a custom rounded rectangle and loose icon/text layers.

## Breadcrumb

Foundation:

- Component set: Breadcrumb
- Alternate breadcrumb set: Breadcrumb
- Usage reference page: Breadcrumbs
- Use for desktop or complex-detail navigation history.

The live breadcrumb family appears in two related sets:

1. A richer breadcrumb set with `Collapsed` and `Custom separator` variant axes.
2. A simpler breadcrumb set with `Active` and `Disable` variant axes.

### Breadcrumb Set: Collapsed / Custom Separator

The richer breadcrumb set exposes these live properties:

| Property | Type | Purpose |
| --- | --- | --- |
| `Collapsed` | `VARIANT` | `False`, `True` |
| `Custom separator` | `VARIANT` | `False`, `True` |
| `End slot` | `INSTANCE_SWAP` | Trailing icon/control swap. |
| `Start slot` | `BOOLEAN` | Shows or hides the first start slot region. |
| `Label` | `BOOLEAN` | Shows or hides the breadcrumb label. |
| `Start slot` | `INSTANCE_SWAP` | Leading icon/control swap. |
| `End slot` | `BOOLEAN` | Shows or hides the trailing end slot region. |
| `Custom separator` | `INSTANCE_SWAP` | Swaps the visible separator control. |

The inspected variants are:

| Branch | Width | Height | Notes |
| --- | --- | --- | --- |
| `Collapsed=True, Custom separator=True` | `92` | `36` | Compact collapsed breadcrumb with custom separator. |
| `Collapsed=True, Custom separator=False` | `75` | `36` | Compact collapsed breadcrumb with default separator. |
| `Collapsed=False, Custom separator=True` | `147` | `36` | Expanded breadcrumb with custom separator. |
| `Collapsed=False, Custom separator=False` | `130` | `36` | Expanded breadcrumb with default separator. |

### Breadcrumb Set: Active / Disable

The simpler breadcrumb set exposes these live properties:

| Property | Type | Purpose |
| --- | --- | --- |
| `Active` | `VARIANT` | `false`, `true` |
| `Disable` | `VARIANT` | `False`, `True` |

The inspected variants are:

| Branch | Width | Height | Notes |
| --- | --- | --- | --- |
| `Active=false, Disable=False` | `128` | `36` | Resting breadcrumb item. |
| `Active=true, Disable=False` | `111` | `36` | Active breadcrumb item with separator removed. |
| `Active=false, Disable=True` | `128` | `36` | Disabled breadcrumb item. |

### Usage Rules

- Build breadcrumb trails by placing multiple breadcrumb components in auto-layout.
- Use the active state for the current location, and let it remove the separator by default.
- Use the richer breadcrumb set when you need collapsed history or a custom separator.
- Enable start/end icon slots only when the trail needs them.
- Do not replace breadcrumb history with custom text links separated by loose slash characters.

## Toolbar

Foundation:

- Component set: Toolbar
- Usage reference page: Toolbar
- Example instances: Toolbar, Toolbar, Toolbar
- Use for page titles, back/menu controls, and action slots.

The live Toolbar family is a `375 x 56` header shell with a nested toolbar
instance and a background variant.

### Shell Contract

| Property | Values | Notes |
| --- | --- | --- |
| `Background` | `False`, `True` | Exposed as the outer shell variant. |
| Width | `375` | Full-width header shell. |
| Height | `56` | Standard toolbar height. |
| Layout mode | `VERTICAL` | Outer container stacks the toolbar body inside the shell. |
| Padding | `16` left/right, `20` top/bottom | Observed on the live instances. |
| Child structure | One live `Toolbar` instance | The visible header content belongs to the nested toolbar. |

### Nested Toolbar Contract

The nested toolbar instance exposes the real page-header controls:

| Property | Type | Purpose |
| --- | --- | --- |
| `Button` | `VARIANT` | `Menu button`, `Back button`, `Standard button` |
| `Start slot` | `BOOLEAN` | Toggles the start icon/control region. |
| `Start slot` | `INSTANCE_SWAP` | Swaps the visible start icon/control. |
| `Primary slot` | `INSTANCE_SWAP` | Primary action icon swap. |
| `Primary slot` | `BOOLEAN` | Shows or hides the primary action. |
| `Secondary slot` | `INSTANCE_SWAP` | Secondary action icon swap. |
| `Secondary slot` | `BOOLEAN` | Shows or hides the secondary action. |
| `End slot` | `BOOLEAN` | Toggles the first end-slot region. |
| `End slot` | `INSTANCE_SWAP` | Swaps the end-slot icon/control. |
| `Title` | `TEXT` | Toolbar title text. |

### Observed Example Branches

| Node | Notes |
| --- | --- |
|  | Standard toolbar with title `Menu from the right` and the primary action visible. |
|  | Menu-button toolbar with title `Images`. |
|  | Standard toolbar with title `Email draft` and visible action slots. |

### Usage Rules

- Use the live Toolbar shell for page headers instead of detached title bars.
- Edit title and action content through the nested toolbar instance, not with
  custom text layers.
- Choose the `Menu button`, `Back button`, or `Standard button` branch to
  match the page interaction pattern.
- Keep toolbar controls inside the documented start, primary, secondary, and
  end slots.
- Do not redraw the header as a custom white bar with loose icons and title
  text.

## Modal

Foundation:

- Component set: Modal
- Usage reference page: Modal
- Example instances: Modal, Modal

The live Modal component is a compact modal header shell built entirely from a
nested Toolbar instance.

### Shell Contract

| Attribute | Value |
| --- | --- |
| Width | `375` |
| Height | `56` |
| Layout mode | `NONE` |
| Outer padding | `0` on all sides |
| Child structure | One live `Toolbar` instance |

### Nested Toolbar Contract

- The only visible child is a `Toolbar` instance at `375 x 56`.
- All title, start-slot, end-slot, icon, and action behavior belongs to the
  nested Toolbar contract.
- The usage examples show the two common modal-header states:
  - title only
  - start icon plus title

### Usage Rules

- Treat Modal as a header wrapper around the live Toolbar, not as a custom
  surface bar.
- Apply toolbar-level customization inside the nested Toolbar instance.
- Use the start slot to add a dismiss or back-style control when the modal
  pattern calls for it.
- Place this component at the top of a modal frame when a modal-specific
  toolbar is needed.

## Popover

Foundation:

- Component set: Popover
- Usage reference page: Popover
- Example instance: Popover

The live Popover component is a container shell wrapping a live List instance.

### Shell Contract

| Attribute | Value |
| --- | --- |
| Width | `250` |
| Height | `301` |
| Layout mode | `VERTICAL` |
| Item spacing | `0` |
| Outer padding | `0` on all sides |
| Child structure | One live `List` instance |

### Nested List Contract

- The only visible child is a `List` instance at `250 x 301`.
- The nested list owns the `List Header`, `List Divider`, spacing polygon, and
  repeated `Item` rows.
- The usage example explicitly treats Popover as a list container: reveal or
  hide items in the list instance to change visible item count.

### Usage Rules

- Treat Popover as a shell around the live List component rather than as a
  custom floating card with detached rows.
- Edit the nested List and Item instances for labels, badges, dividers, and row
  count.
- Add more items by extending the list master, then reveal them in the popover
  instance as needed.
- Keep header copy and row behavior inside the nested list structure.

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
