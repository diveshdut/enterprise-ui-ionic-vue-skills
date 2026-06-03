# Selection Controls



## Radio

Foundation:

- Component set: Radio
- Use for mutually exclusive selection inside option groups, list rows, and settings flows.

The live Radio set exposes two variant axes:

| Property | Values | Usage |
| --- | --- | --- |
| `Selected` | `True`, `False` | Use `True` for the chosen option and `False` for all other options in the same group. |
| `Enabled` | `True`, `False` | Use `False` when the option is unavailable but still needs to remain visible. |

### State Matrix

The set contains four canonical states:

| Selected | Enabled | Width | Height | Notes |
| --- | --- | --- | --- | --- |
| `True` | `True` | `24` | `24` | Standard selected radio. |
| `False` | `True` | `24` | `24` | Standard unselected radio. |
| `True` | `False` | `24` | `24` | Disabled selected radio. |
| `False` | `False` | `24` | `24` | Disabled unselected radio. |

### Node Contract

Each inspected Radio variant shares the same structural contract:

| Attribute | Value |
| --- | --- |
| Component type | `COMPONENT` |
| Width | `24` |
| Height | `24` |
| Layout mode | `NONE` |
| Visible child | One nested `Radio` instance at `24 x 24` |
| Resizing behavior | Fixed square icon-sized control |
| Exposed text properties | None |
| Exposed instance swaps | None |

### Usage Rules

- Treat Radio as an icon-sized primitive, not a standalone card or custom pill.
- Place it in the icon/start/end slot of `Item` rows when building radio-list selections.
- Use the live `Selected` and `Enabled` states instead of drawing circles manually.
- Keep the control at `24 x 24` unless a future live variant in the kit exposes another size.

## Range

Foundation:

- Component family page: Range
- The page is labeled `Range`, but the live component family is the kit's `Slider` system.
- Use for continuous values, stepped values, or dual-handle range selection.

### Element Primitives

The page exposes these reusable slider primitives:

| Element | Node | Width | Height | Notes |
| --- | --- | --- | --- | --- |
| `Track` |  | `120` | `8` | Base rail behind the active value. |
| `Highlight` |  | `120` | `8` | Active fill region on top of the track. |
| `Knob` |  | `12` | `12` | Drag handle for single-value sliders. |
| `Tick` |  | `2` | `2` | Discrete step marker. |
| `Value Indicator` |  | `32` | `62` | Floating value bubble used by value-indicator variants. |

### Continuous Slider Contract

The standard continuous slider branch inspected uses this composition:

| Attribute | Value |
| --- | --- |
| Width | `142` |
| Height | `48` |
| Layout mode | `NONE` |
| Children | `Track`, `Highlight`, `Knob` |
| Track width | `142` |
| Highlight width | `142` in the enabled example |
| Knob size | `12 x 12` |

Use this branch for a single continuous value without ticks.

### Range Slider Contract

The dual-handle range branch inspected uses this composition:

| Attribute | Value |
| --- | --- |
| Width | `142` |
| Height | `48` |
| Layout mode | `NONE` |
| Children | `Track`, `Highlight`, `Knob Leading`, `Knob Trailing` |
| Track size | `142 x 8` |
| Highlight size | `120 x 8` in the example |
| Knob sizes | Two knobs, each `12 x 12` |

Use this branch when the user selects a min and max value.

### Discrete Slider Contract

The stepped slider branch inspected uses this composition:

| Attribute | Value |
| --- | --- |
| Width | `142` |
| Height | `48` |
| Layout mode | `NONE` |
| Children | `Track`, `Highlight`, `Ticks`, `Knob` |
| Ticks group | `142 x 2` |
| Track size | `142 x 8` |
| Knob size | `12 x 12` |

Use this branch when the value should snap to visible steps.

### Additional Live Variations On The Page

The page also provides these related branches:

- `Slider / Continuous / Pressed`
- `Slider / Continuous / Value Indicator`
- `Slider / Continuous / with Icons`
- `Slider / Continuous / with Icons and Value Indicator`
- `Slider / Discrete / Pressed`
- `Slider / Discrete / Value Indicator`
- `Slider / Discrete / with Icons`
- `Slider / Discrete / with Icons and Value Indicator`

These do not expose set-level variant axes in the inspected nodes, so treat
them as distinct live compositions to duplicate and edit rather than as custom
assemblies.

### Variant-Specific Branches

#### `Slider / Continuous / Pressed`

| Attribute | Value |
| --- | --- |
| Width | `142` |
| Height | `48` |
| Children | `Track`, `Highlight`, `Knob`, `ripple` |
| Pressed-state addition | One `ripple` vector at `48 x 48` centered around the knob |

Use this branch for the active drag state of a continuous slider. Keep the
pressed treatment inside the live branch instead of drawing a separate halo.

#### `Slider / Continuous / Value Indicator`

| Attribute | Value |
| --- | --- |
| Width | `142` |
| Height | `80` |
| Children | `Slider`, `Value Indicator` |
| Nested slider size | `142 x 48` positioned at `y=32` |
| Value indicator size | `32 x 62` positioned above the knob |

The `Value Indicator` instance contains a `Mask` vector plus a `Caption` text
layer. Use this branch when the current numeric value needs to be visible
during adjustment.

#### `Slider / Continuous / with Icons`

| Attribute | Value |
| --- | --- |
| Width | `214` |
| Height | `48` |
| Children | `Icon Left`, `Slider`, `Icon Right` |
| Icon sizes | Both icons are `24 x 24` |
| Slider size | `142 x 48` positioned between the icons |

Use this branch when the range meaning is anchored by two endpoint icons. Keep
the icons as live instances on the slider branch rather than loose side
symbols.

#### `Slider / Continuous / with Icons and Value Indicator`

| Attribute | Value |
| --- | --- |
| Width | `214` |
| Height | `80` |
| Children | `Icon Left`, `Slider`, `Icon Right`, `Value Indicator` |
| Icon row position | Icons sit at `y=44` |
| Slider position | `142 x 48` slider at `x=36`, `y=32` |
| Value indicator position | `32 x 62` bubble above the slider at `x=91`, `y=0` |

Use this branch when both endpoint icons and the active value bubble are needed
at the same time.

#### `Slider / Discrete / Pressed`

| Attribute | Value |
| --- | --- |
| Width | `142` |
| Height | `48` |
| Children | `Track`, `Highlight`, `Ticks`, `Knob`, `ripple` |
| Tick group | `142 x 2` |
| Pressed-state addition | One `ripple` vector at `48 x 48` |

This is the pressed-state companion to the discrete slider. Preserve both the
tick row and the pressed ripple.

#### `Slider / Discrete / Value Indicator`

| Attribute | Value |
| --- | --- |
| Width | `142` |
| Height | `80` |
| Children | `Slider`, `Value Indicator` |
| Nested slider contents | `Track`, `Highlight`, `Ticks`, `Knob` |
| Value indicator size | `32 x 62` |

Use this branch when a stepped slider also needs the current value bubble.

#### `Slider / Discrete / with Icons`

| Attribute | Value |
| --- | --- |
| Width | `214` |
| Height | `48` |
| Children | `Icon Left`, `Slider`, `Icon Right` |
| Nested slider contents | `Track`, `Highlight`, `Ticks`, `Knob` |
| Icon sizes | Both endpoint icons are `24 x 24` |

Use this branch when the discrete scale is framed by endpoint icons.

#### `Slider / Discrete / with Icons and Value Indicator`

| Attribute | Value |
| --- | --- |
| Width | `214` |
| Height | `80` |
| Children | `Icon Left`, `Slider`, `Icon Right`, `Value Indicator` |
| Nested slider contents | `Track`, `Highlight`, `Ticks`, `Knob` |
| Icon row position | Icons sit at `y=44` |
| Value indicator position | `32 x 62` bubble above the slider |

Use this branch when the discrete slider needs both endpoint icons and the
current value bubble.

### Usage Rules

- Keep `Track`, `Highlight`, `Knob`, `Tick`, and `Value Indicator` as live slider primitives.
- Choose the correct live branch first: continuous, range, or discrete.
- Resize the visible `Highlight` and knob positions within the live branch to represent value, following the kit's examples.
- Use the value-indicator and icon compositions when the reference page shows them, instead of drawing floating bubbles or side icons manually.

## Checkbox

Foundation:

- Component set: Checkbox
- Usage reference page: Checkbox examples
- Use for binary selection in list rows, multi-select workflows, and icon-item
  selection states.

### Component Contract

The inspected Checkbox component is a compact 24px icon swap component with
two variant axes: `Enabled` and `Selected`.

| Property | Values | Notes |
| --- | --- | --- |
| `Enabled` | `True`, `False` | Exposed as a variant axis for interaction state. |
| `Selected` | `True`, `False` | Exposed as a variant axis for checked vs unchecked state. |

The set contains 4 variants: 2 enabled states x 2 selected states.

### Visible Icon Contract

The checkbox mark is driven by two 24px icon masters:

- `Icon / Toggle / Checkbox Outline / Fill` for the unchecked state.
- `Icon / Toggle / Checkbox / Fill` for the checked state.

Both icon masters contain an 18px boolean-operation mark inside a 24px square
component. The visible checkbox should stay icon-sized and should not be
redrawn as a custom square with a manual checkmark.

### State Matrix

| Enabled | Selected | Visible Icon |
| --- | --- | --- |
| `False` | `False` | Outline checkbox icon |
| `False` | `True` | Filled checkbox icon |
| `True` | `False` | Outline checkbox icon |
| `True` | `True` | Filled checkbox icon |

### Resizing Rules

Preferred:

- Keep the checkbox at its native 24px icon size.
- Swap the icon master for the checked or unchecked state.
- Use the checkbox inside icon-item or list-row patterns.

Avoid:

- Drawing a custom checkbox square and checkmark.
- Adding label text inside the checkbox component itself.

### Usage Checklist

Before completing a design thuses Checkbox:

- The checkbox is used as a compact icon state, not as a standalone control
  card.
- The checked and unchecked states use the live icon masters.
- The checkbox stays 24px and fits the surrounding Item pattern.
- No hidden Checkbox instance sits behind custom visible primitives.

## Toggle

Foundation:

- Component set: Switch
- Usage reference page: Toggle
- Use for binary settings and on/off item rows.

### Component Contract

The live Toggle control is a compact `40 x 24` switch with two variant axes: `On` and `Enabled`.

| Property | Values | Notes |
| --- | --- | --- |
| `On` | `True`, `False` | Exposed as the on/off state axis. |
| `Enabled` | `True`, `False` | Exposed as the interactive vs disabled axis. |

The set contains 4 variants: 2 on states x 2 enabled states.

### Visible Control Contract

The visible switch is built from:

- `Rail` and `Knob` instances in the enabled branches.
- A `Disabled` group in the disabled branches.

The knob is `20 x 20` inside the `40 x 24` switch frame. Keep the live control in place and do not redraw the rail/knob as custom shapes.

### State Matrix

| Enabled | On | Visible Structure |
| --- | --- | --- |
| `False` | `False` | Disabled switch branch. |
| `False` | `True` | Disabled switch branch. |
| `True` | `False` | Rail + Knob, off state. |
| `True` | `True` | Rail + Knob, on state. |

### Observed Example Instances

| Node | Notes |
| --- | --- |
|  | Toggle row using `Item` with `Media=Icon`, title `Filter instock products`, note `4 results`, and a live switch in the row end area. |
|  | Toggle row using `Item` with `Media=None`, title `Always on display`, note `note`, and a live switch in the row end area. |

### Usage Rules

- Use Toggle / Switch for binary settings, preference rows, and on/off configuration items.
- Place it in Item end slots or a comparable setting row, not as a standalone decorative control.
- Keep the control compact and native to the live component.
- Do not draw custom rails, knobs, or disabled states around a hidden Switch instance.

## Chips

Foundation:

- Component set: Chip
- Usage reference page: Chips examples
- Use for filters, tags, selected values, and compact metadata.

### Variants

The live Chip component set exposes:

| Property | Values | Usage |
| --- | --- | --- |
| `Outline` | `True`, `False` | Use the outline version for neutral or selectable chip rows, and the filled base for default chips. |
| `State` | `Enabled`, `Hover`, `Selected`, `Disabled` | Preserve the live interaction and selection styling instead of inventing custom fills. |

### Base And Content Contract

The chip is built from a base surface and a nested content master.

| Layer | Width | Height | Layout | Gap | Padding | Radius | Fill |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `Chips / Elements / Base` | `140` | `31` | Vertical auto-layout | `10` | `12` left/right, `0` top/bottom | `16` | Light gray base surface |
| `Chip / Elements / Content` | `116` | `31` | Horizontal auto-layout | `8` | `0` | `0` | White content surface |

### Composition Rule

Use direct live `Chip` instances by default. Do not introduce an extra wrapper
frame or grouped `Chips` container unless the inspected workflow reference
explicitly uses that grouping for layout, overflow, or shared behavior.

### Slot And Label Structure

The content master exposes:

- `Label` text property.
- `Start slot` boolean visibility toggle.
- `End slot` boolean visibility toggle.
- `Start slot` instance-swap property for the leading icon/avatar.

Observed visible children in the content master:

- `Image` slot, 24px circular avatar/media slot.
- `Icon` slot, 18px leading icon.
- `Label` text layer, `Roboto Regular`, `14px`, `WIDTH_AND_HEIGHT`.
- `Close` slot, 18px trailing icon.

### Resizing Rules

Preferred:

- Preserve the chip as a compact auto-layout component.
- Change the visible text through the internal `Label` property.
- Toggle start and end slots instead of drawing custom icons or avatars.
- Keep the chip in the live `Outline` and `State` variants.
- Place simple filter chips directly in the parent auto-layout row unless the
  live reference specifically requires a grouped `Chips` frame.

Avoid:

- Rebuilding chips as custom rounded pills with direct text.
- Manually resizing the chip away from its live auto-layout contract.
- Turning chips into buttons when the workflow calls for tags or filters.

### Usage Checklist

Before completing a design thuses Chips:

- The chip uses the live base/content structure.
- The label is edited through the component-owned label property.
- Start and end slots are used only when the workflow needs them.
- Any wrapper around the chips is justified by the live reference rather than
  added by default.
- No hidden Chip instance sits behind custom visible primitives.
