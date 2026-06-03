# Search



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
