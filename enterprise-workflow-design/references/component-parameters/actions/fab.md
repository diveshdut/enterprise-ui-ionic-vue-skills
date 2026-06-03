# FAB



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
