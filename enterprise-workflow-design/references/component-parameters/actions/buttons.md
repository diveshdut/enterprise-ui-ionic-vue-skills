# Button



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
