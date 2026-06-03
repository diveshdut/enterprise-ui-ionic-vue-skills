# Feedback And Status



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
