# Actions

## Button

Foundation:

- Component set: Button
- Master example: btn master / large
- Use for primary actions, secondary actions, outline actions, clear actions,
  disabled actions, and icon+label actions.

### Variants

The public Button component set exposes:

| Property | Values | Usage |
| --- | --- | --- |
| `Size` | `Large`, `Default`, `Small` | Choose by action prominence and density. Use `Default` for most workflow actions, `Large` sparingly for high-emphasis mobile actions, and `Small` for compact tool/action clusters. |
| `Style` | `Solid`, `Outline`, `Clear` | Use `Solid` for primary actions, `Outline` for secondary/cancel actions, and `Clear` for low-emphasis toolbar/card actions. |
| `Enabled` | `True`, `False` | Use `False` for unavailable actions; preserve disabled opacity from the component. |

The set contains 18 variants: 3 sizes x 3 styles x 2 enabled states.

### Complete Variant Matrix

Use these live component variants instead of recreating button visuals from
rectangles, strokes, or direct text. Document the attributes that matter for
reliably reproducing the component: size, style, enabled state, auto-layout,
fill, stroke, label color, spacing, and padding.

| Size | Style | Enabled | Height | Width Behavior | Fill | Stroke | Label Color | Disabled Treatment |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `Large` | `Solid` | `True` | `56` | Hug contents | `#3880FF` | None | White | Full opacity |
| `Large` | `Solid` | `False` | `56` | Hug contents | `#3880FF` | None | White | Surface opacity `0.5` |
| `Large` | `Outline` | `True` | `56` | Hug contents | None | `#3880FF` | `#3880FF` | Full opacity |
| `Large` | `Outline` | `False` | `56` | Hug contents | None | `#3880FF` | `#3880FF` | Stroke and label opacity `0.5` |
| `Large` | `Clear` | `True` | `56` | Hug contents | None | None | `#3880FF` | Full opacity |
| `Large` | `Clear` | `False` | `56` | Hug contents | None | None | `#3880FF` | Label opacity `0.5` |
| `Default` | `Solid` | `True` | `36` | Hug contents; fixed height | `#3880FF` | None | White | Full opacity |
| `Default` | `Solid` | `False` | `36` | Hug contents; fixed height | `#3880FF` | None | White | Surface opacity `0.5` |
| `Default` | `Outline` | `True` | `36` | Hug contents; fixed height | None | `#3880FF` | `#3880FF` | Full opacity |
| `Default` | `Outline` | `False` | `36` | Hug contents; fixed height | None | `#3880FF` | `#3880FF` | Stroke and label opacity `0.5` |
| `Default` | `Clear` | `True` | `36` | Hug contents; fixed height | None | None | `#3880FF` | Full opacity |
| `Default` | `Clear` | `False` | `36` | Hug contents; fixed height | None | None | `#3880FF` | Label opacity `0.5` |
| `Small` | `Solid` | `True` | `28` | Hug contents | `#3880FF` | None | White | Full opacity |
| `Small` | `Solid` | `False` | `28` | Hug contents | `#3880FF` | None | White | Surface opacity `0.5` |
| `Small` | `Outline` | `True` | `28` | Hug contents | None | `#3880FF` | `#3880FF` | Full opacity |
| `Small` | `Outline` | `False` | `28` | Hug contents | None | `#3880FF` | `#3880FF` | Stroke and label opacity `0.5` |
| `Small` | `Clear` | `True` | `28` | Hug contents | None | None | `#3880FF` | Full opacity |
| `Small` | `Clear` | `False` | `28` | Hug contents | None | None | `#3880FF` | Label opacity `0.5` |

### Size-Specific Layout Details

| Size | Source Master | Gap | Horizontal Padding | Vertical Padding | Icon Size | Label Size | Sizing Notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `Large` | `btn master / large` | `6` | `20` left/right | `0` | `28` | `20` | Width and height hug contents. |
| `Default` | `btn master / normal` | `4` | `15.4` left/right; `10` for `Clear` | `0` | `19` | `14` | Width hugs contents; height is fixed at `36`. |
| `Small` | `btn master / small` | `4` | `11.9` left/right | `0` | `18` | `13` | Width and height hug contents. |

### Master Layout Contract

Use the nested `btn master / normal`, `btn master / large`, or
`btn master / small` instance as the source of visible button UI.

| Size | Height | Width | Layout | Gap | Horizontal Padding | Vertical Padding |
| --- | --- | --- | --- | --- | --- | --- |
| `Large` / `btn master / large` | `56` | Hug contents | Horizontal auto-layout | `6` | `20` left/right | `0` |
| `Default` / `btn master / normal` | `36` | Hug contents | Horizontal auto-layout | `4` | `15.4` left/right | `0` |
| `Small` / `btn master / small` | `28` | Hug contents | Horizontal auto-layout | `4` | `11.9` left/right | `0` |

Common layout parameters:

- `layoutMode`: `HORIZONTAL`
- `primaryAxisSizingMode`: `AUTO`
- `counterAxisSizingMode`: `AUTO`
- `layoutSizingHorizontal`: `HUG`
- `layoutSizingVertical`: `HUG`
- `primaryAxisAlignItems`: `CENTER`
- `counterAxisAlignItems`: `CENTER`
- `cornerRadius`: `4`
- `rotation`: `0`

Do not manually draw a rectangle/text pair to imitate the button. The button
surface, label, and optional icons must remain inside the component or nested
master instance.

### Color And State

Observed solid enabled button fill:

- Primary blue: approximately `#3880FF` (`r: 0.2196`, `g: 0.502`, `b: 1`).
- Solid button label/icon color: white.
- Disabled solid state keeps the same primary fill with reduced opacity
  (`0.5` observed on the nested master instance).

Use component variants and semantic color roles rather than custom fills. If a
workflow requires a semantic button color such as danger, warning, or success,
first inspect whether the kit provides an existing variant or workflow example
using that role.

### Slots And Labels

The master button structure supports:

- `Start slot`: icon instance swap before the label.
- `Label`: internal text layer.
- End icon/slot after the label.

Observed large master child structure:

- `old / ionicons / arrow-back` at the start.
- `Label` text layer.
- `old / ionicons / arrow-forward` at the end.

Label contract:

- Text layer name: `Label`.
- Font: `Roboto Medium`.
- Large label size observed: `20`.
- Text case: `UPPER`.
- Text auto-resize: width and height.
- Label belongs inside the button. Do not place direct text over the button.

When changing the visible label, edit the button's internal `Label` layer or
supported text property. Do not leave placeholder text such as `BUTTON` or
`Button Label` in production workflow designs.

### Resizing Rules

Preferred:

- Preserve Hug width/height for intrinsic buttons.
- Use the appropriate variant (`Large`, `Default`, `Small`) before manually
  resizing.
- Use the parent layout frame for button placement and alignment.
- Keep the Button instance itself at its intrinsic hug width unless the live
  component contract explicitly exposes a supported full-width behavior.
- Keep button text within the component-owned label layer after resizing.

Avoid:

- Stretching the Button instance horizontally to fake a full-width CTA.
- Stretching internal label/icon layers independently.
- Changing gap, padding, or radius unless the live component exposes that
  behavior.
- Using direct text overlays for long labels.
- Creating custom secondary/cancel buttons when `Outline` or `Clear` variants
  are available.

### Usage Checklist

Before completing a design thuses Button:

- Variant selected intentionally: `Size`, `Style`, `Enabled`.
- Visible UI comes from the Button instance or nested `btn master`.
- Label is inside the internal `Label` layer.
- Button width remains intrinsic unless the inspected live reference proves a
  supported non-hug branch.
- Icons use start/end slots and Ionicons.
- Hug sizing, gap, padding, radius, alignment, and disabled opacity are
  preserved unless the outer instance is intentionally width-resized.
- No hidden Button instance sits behind custom visible button primitives.

## FAB

Foundation:

- Component set: FAB
- Usage reference page: FAB examples
- Related examples: FAB detail, FAB detail, FAB detail
- Use for a prominent floating action, quick create action, or expanded action cluster with directional slots.

### Variants

The live FAB component set exposes three variant axes:

| Property | Values | Usage |
| --- | --- | --- |
| `Mini` | `True`, `False` | Use the smaller floating action button when the surface needs a compact affordance. |
| `Disable` | `False`, `True` | Use `True` for unavailable FAB actions while preserving the live disabled styling. |
| `List` | `True`, `False` | Use `True` when the FAB expands into a list of directional actions. |

### Exposed Properties

The inspected FAB set exposes the following live properties:

| Property | Type | Purpose |
| --- | --- | --- |
| `Fab button` | `INSTANCE_SWAP` | Main FAB surface/icon swap used by the primary button branch. |
| `Start` | `BOOLEAN` | Shows the start-side slot group. |
| `Top` | `BOOLEAN` | Shows the top slot group. |
| `End` | `BOOLEAN` | Shows the end-side slot group. |
| `Bottom` | `BOOLEAN` | Shows the bottom slot group. |
| `Fab list button 1` | `INSTANCE_SWAP` | Swaps the first list-action FAB button. |
| `Fab list button 2` | `INSTANCE_SWAP` | Swaps the second list-action FAB button. |
| `Fab list button 3` | `INSTANCE_SWAP` | Swaps the third list-action FAB button. |
| `Fab button (secondary)` | `INSTANCE_SWAP` | Secondary FAB button swap exposed in the inspected instances. |

### Default FAB Branch

The standard FAB branch observed in  is a compact icon-only button surface.

| Attribute | Value |
| --- | --- |
| Width | `56` |
| Height | `56` |
| Layout mode | `NONE` |
| Visible children | `✱ / Base / FAB / FAB Master Shape`, plus a live Ionicon instance |
| Sizing | Fixed square button surface |
| Surface behavior | Icon sits inside the live FAB master, not as detached overlay text |

Keep the icon inside the live FAB instance and do not rebuild the button as a custom circle with a separate icon layer.

### List FAB Branch

The list branch observed in  expands the FAB into directional action slots.

| Attribute | Value |
| --- | --- |
| Width | `56` |
| Height | `56` |
| Layout mode | `NONE` |
| Visible slots | `Bottom slot`, `End slot`, `Top slot`, `Start slot` |
| Center child | Live FAB surface with a `close` icon instance |
| List behavior | Directional slot groups plus the main FAB button |

Keep the directional actions inside the live list slots. Do not recreate the expanded state as a custom menu of circles and labels.

### Usage Rules

- Use `Mini`, `Disable`, and `List` intentionally rather than styling a custom floating button.
- Keep the FAB icon inside the live component or its swap target.
- Use the directional slots for expanded action clusters instead of placing detached buttons around the page.
- Preserve the square `56x56` footprint for the standard FAB branches unless the live component exposes a different size.
- Do not replace the FAB with a custom circular button plus hidden live component.

## Toast

Foundation:

- Component set: Toast
- Usage reference page: Toast
- Use for temporary success, error, connectivity, and undo feedback after an action completes.

### Component Contract

The live Toast family is a compact `343 x 48` notification row with optional leading content and an optional action button.

| Property | Values | Notes |
| --- | --- | --- |
| `Label` | Text | Editable message copy. |
| `Start slot` | `True`, `False` | Boolean visibility toggle for the leading region. |
| `Start slot` | Instance swap | Leading icon/avatar swap target. |
| `Button` | `True`, `False` | Controls whether the trailing action button is shown. |

### Variant Branches

| Branch | Visible Structure |
| --- | --- |
| `Button=False` | Leading icon + message text only. |
| `Button=True` | Leading icon + message text + trailing button. |

The inspected examples keep the visible message in the internal content layer and the action label inside the nested button instance. The action button appears as an `80 x 36` nested button in the `Button=True` branch.

### Observed Example Instances

| Node | Notes |
| --- | --- |
|  | Canonical toast example. Uses `Button=True`, message `No internet connection`, leading `globe-outline`, and a trailing clear button. |
|  | Toast branch without the trailing button. |
|  | Toast branch with the trailing button. |

### Usage Rules

- Use Toast for transient feedback, not as a persistent status banner.
- Keep the message text inside the live Toast instance.
- Use the leading slot for an icon or other approved leading affordance when the message needs it.
- Use the button branch when the toast needs an undo or immediate follow-up action.
- Do not redraw the toast as a detached banner with custom text and button primitives.

## Alert

Foundation:

- Component set: Alert
- Usage reference page: Alerts
- Example instances: Alert / Basic, Alert / Basic
- Use for confirmations, save/discard prompts, and blocking decisions such as logout or close-with-unsaved-changes flows.

### Observed Contract

The live Alert examples behave like a compact modal confirmation surface with
editable text content and two trailing action labels.

| Attribute | Value |
| --- | --- |
| Component type | `COMPONENT` / `SYMBOL` family in the inspected examples |
| Width | `280` |
| Height | `183` to `207` observed across the example instances |
| Surface | White |
| Corner radius | Rounded card surface with soft shadow |
| Content alignment | Left-aligned title and body text |
| Action region | Right-aligned bottom action row |
| Action count | Two text actions in the observed examples |

### Editable Content

The Alert examples expose text-driven content rather than a large set of visual
variants:

- Title text, such as `Save changes`, `Logout`, or a generic `Headline 6`.
- Body text, such as the confirm/copy prompt shown in the example.
- Two action labels, such as `CANCEL` / `YES` or `NO` / `YES`.

Keep the content inside the alert instance. Do not rebuild the dialog as a
custom white card with detached text and buttons.

### Observed Example Presets

The three inspected examples show the same alert shell with different copy:

| Preset | Title | Body | Actions |
| --- | --- | --- | --- |
| Basic | `Headline 6` | Generic placeholder paragraph | `BUTTON` / `BUTTON` |
| Save changes | `Save changes` | Save-before-close confirmation copy | `CANCEL` / `YES` |
| Logout | `Logout` | Logout confirmation copy | `NO` / `YES` |

### Usage Rules

- Use the live Alert surface for blocking or confirm-style decisions.
- Edit the title, body, and action labels inside the component-owned text
  layers.
- Preserve the compact modal-card footprint and the two-action footer.
- Do not turn the alert into a full-screen page or a custom card layout.

## Progress Indicator

Foundation:

- Usage reference page: Progress Indicator
- Linear indicator element: Progress Indicators / Elements / Linear / Indicator
- Linear track element: Progress Indicators / Elements / Linear / Track
- Circular indicator: Progress Indicators / Circular
- Linear composite: Progress Indicators / Linear

The live Progress Indicator family is a primitive feedback system made from
linear track and indicator elements plus a circular indicator.

### Linear Indicator Element

| Attribute | Value |
| --- | --- |
| Width | `260` |
| Height | `4` |
| Layout mode | `NONE` |
| Child structure | One `Surface` vector |

This is the active progress segment. The usage note indicates that resizing the
indicator on the track is the supported way to change visible progress.

### Linear Track Element

| Attribute | Value |
| --- | --- |
| Width | `260` |
| Height | `4` |
| Layout mode | `NONE` |
| Child structure | One `Surface` vector |

This is the passive track surface that sits behind the active progress segment.

### Linear Composite

| Attribute | Value |
| --- | --- |
| Width | `260` |
| Height | `4` |
| Layout mode | `NONE` |
| Children | `Track`, `Indicator` |

The inspected composite contains:

- `Track` instance at `260 x 4`
- `Indicator` instance at `160 x 4` in the canonical example

Keep the track and indicator as live nested instances rather than redrawing a
custom track/fill pair.

### Circular Indicator

| Attribute | Value |
| --- | --- |
| Width | `44` |
| Height | `44` |
| Layout mode | `NONE` |
| Child structure | One `Surface` boolean-operation shape |

The circular variant is a single spinner-style surface and does not expose
text, labels, or nested slots in the inspected component.

### Usage Rules

- Use the linear composite when the workflow needs determinate horizontal
  progress.
- Change visible linear progress by adjusting the indicator width on the track,
  following the kit usage note.
- Use the circular indicator for indeterminate or waiting states.
- Do not redraw progress as custom rectangles or arcs when the live progress
  primitives already exist.

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

## Badge

Foundation:

- Component set: Badge
- Usage reference page: Badge examples
- Use for compact status, tags, counts, or note metadata where the badge is supporting information rather than the primary action.

### Component Contract

The inspected Badge component is a single-label component with no exposed size
or style variants in the live component set.

| Attribute | Value |
| --- | --- |
| Component type | `COMPONENT` |
| Layout mode | `VERTICAL` |
| Width behavior | `HUG` |
| Height behavior | `HUG` |
| Width | `52` observed on the canonical example |
| Height | `19` observed on the canonical example |
| Padding | `7` left/right, `0` top/bottom |
| Gap / item spacing | `10` |
| Corner radius | `4` |
| Surface fill | Semantic color fill, no stroke |
| Label color | White |
| Label font | `Roboto Bold` |
| Label size | `13` |
| Label case | `ORIGINAL` |
| Text auto-resize | `WIDTH_AND_HEIGHT` |

### Style Linkage Contract

When a Badge uses one of the kit's predefined semantic colors, keep the badge
linked to the published paint style instead of copying the visible color as a
raw `SOLID` fill override.

Required behavior:

- Prefer a semantic `fillStyleId` from the live file such as `Primary`,
  `Success`, `Warning`, `Danger`, or `Medium` when the badge is representing a
  known status role.
- Treat color matching as incomplete if the badge no longer points to the
  published semantic paint style.
- If the component is nested inside another live component, verify the visible
  Badge instance itself still carries the style linkage after duplication or
  editing.

Forbidden behavior:

- Replacing a published semantic badge style with an unlinked raw `SOLID` fill
  just because the visible color looks correct.
- Using a one-off custom badge color when the semantic role can be expressed by
  an existing file style.

### Slot And Label Structure

The Badge contains a single editable text layer:

- `Label` text layer.
- One text property on the component: `Label`.
- No icon slot was observed in the live component.

### Observed Color Instances

The live examples on the Badge page show the same badge shape repeated with
semantic fills:

| Color Role | Observed Fill |
| --- | --- |
| Primary | `#3880FF` |
| Info / Cyan | `#3DC2FF` |
| Secondary / Indigo | `#5260FF` |
| Danger / Red | `#EB445A` |
| Success / Green | `#2DD36F` |
| Warning / Yellow | `#FFC409` |

### Resizing Rules

Preferred:

- Preserve the badge as a compact, hugged surface.
- Edit only the internal `Label` layer when changing the visible text.
- Use semantic color fills through the file's published paint styles rather
  than custom one-off colors unless a workflow example explicitly requires a
  different role and no published semantic style fits.
- For duplicated or edited badges, confirm `fillStyleId` still points to the
  intended semantic style after the change.

Avoid:

- Rebuilding badges with custom rounded rectangles and direct text overlays.
- Adding extra icon layers unless the live component exposes a supported slot.
- Making badge text larger than the component supports in the live example.
- Clearing or bypassing a semantic badge paint style and leaving the badge as a
  loose fill override.

### Suggested Semantic Mapping

Use these mappings by default unless the inspected workflow reference shows a
different semantic meaning:

| Status text | Preferred semantic style |
| --- | --- |
| `Ready`, `Complete`, `Approved` | `Success` |
| `Queued`, `Scheduled`, `Planned` | `Primary` |
| `Running`, `Review`, `Pending attention` | `Warning` |
| `Blocked`, `Error`, `Rejected` | `Danger` |
| `Open`, `Draft`, `Neutral` | `Medium` |

### Usage Checklist

Before completing a design thuses Badge:

- Label text is edited inside the component-owned text layer.
- The badge stays compact and visually secondary to the surrounding action or
  content.
- Semantic fill color matches the intended status or metadata role.
- `fillStyleId` remains linked to the intended published semantic paint style
  when the file provides one.
- No hidden Badge instance sits behind custom visible primitives.

## Action Sheet

Foundation:

- Component set: Action Sheet
- Usage reference page: Action Sheet examples
- Use for contextual action lists, quick choices, and bottom-sheet action menus.

### Component Contract

The inspected Action Sheet component is a single expanded shell containing a
stack of item rows. The visible choices live inside the nested `Item`
instances.

| Attribute | Value |
| --- | --- |
| Component type | `COMPONENT` |
| Width | `375` |
| Height | `248` observed on the live expanded shell |
| Surface | White |
| Layout behavior | No outer auto-layout on the shell; the action rows are stacked inside |
| Row height | `48` observed for each action row |
| Visible actions | Nested `Item` instances |
| Variant properties | None exposed in the inspected shell |

### Row And Label Structure

- Action rows are built from `Item` instances.
- The inspected rows use `Media=Icon` Item variants.
- Keep the row labels, icons, and dividers inside the Item component structure.
- Do not redraw the sheet as a custom rounded panel with separate text rows.

### Resizing Rules

Preferred:

- Preserve the sheet as a fixed contextual action surface.
- Keep rows component-driven and aligned to the live Item pattern.
- Use for concise action lists, not multi-step forms.

Avoid:

- Rebuilding the sheet from custom rectangles and direct text.
- Turning the action sheet into a generic card or modal without the Item row
  pattern.

### Usage Checklist

Before completing a design thuses Action Sheet:

- The visible actions are Item instances, not custom text rows.
- The sheet stays compact and action-focused.
- Icons and labels remain inside the nested Item structure.
- No hidden Action Sheet instance sits behind custom visible primitives.

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
