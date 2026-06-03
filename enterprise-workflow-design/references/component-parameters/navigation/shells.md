# Shells And Overlays



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
