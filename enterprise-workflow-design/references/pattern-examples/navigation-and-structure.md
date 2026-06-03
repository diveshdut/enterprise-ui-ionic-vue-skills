# Navigation And Structure

Use this reference when the UI element shapes navigation, search, grouping, or
overall page structure.

## Searchbar

Good:
- Use the Ionic Searchbar instance for the visible search field.
- Put placeholder/value text inside the searchbar component content layer.
- Keep the search icon from the component or Ionicons, not a hand-drawn icon.
- Pick the correct outer branch first: standalone searchbar or toolbar-wrapped searchbar.
- Resize width sideways when a wider field is needed, and adjust height through the component's vertical padding instead of drawing a different field.
- Use the `Searchbar Content` variant/state for empty, filled, and disabled search states.

Bad:
- Draw a rounded rectangle and custom text over a hidden Searchbar instance.
- Replace the searchbar with a large button-like filter panel.
- Put separate placeholder text above the searchbar instead of editing the component-owned label/input.

Audit question:
- If the Searchbar instance is hidden or removed, does the visible search UI
  disappear? If not, it is custom UI, not component reuse.

## List Items And Results

Good:
- Use Ionic Item patterns for result rows, task rows, and material rows.
- Use the List component when the workflow needs a grouped stack with a real
  list header, divider, and repeated live Item rows.
- Put primary text in the item title/start content and secondary metadata in
  note/detail/end content when the component supports it.
- Keep row actions, badges, and disclosure icons inside component slots.
- Select the correct Item media variant first: `None`, `Icon`, `Avatar`, or
  `Thumbnail`.
- Use the nested `Content / Start` and `Content / End` masters to edit text and
  trailing metadata instead of rebuilding row structure manually.
- Keep List header labels and header end controls inside the List component's
  own exposed properties.

Bad:
- Build rows from separate rectangles, text, icons, and dividers when an Item
  pattern exists.
- Build a grouped list as a custom stack when the List component already
  provides the header, divider, spacing, and row composition.
- Place visible quantity/status text outside an Item while also using a hidden
  Item instance.
- Mix badge, select, and disclosure behaviors outside the Item end content
  master.

Example:
- A material row should use an Item with material name in start content and
  required quantity/status in end content or Badge slots.
- A grouped mobile section such as `Upcoming runs` should start from the live
  List component, then edit the header label and the nested Item rows.

## Menu

Good:
- Use the Menu family when the workflow needs a side navigation surface or
  split-pane navigation shell.
- Keep menu rows inside `Menu / Elements / Text Labels` and edit them as live
  Item instances.
- Keep the menu title inside the nested Toolbar instance.
- Preserve the live surface treatment for split-pane and temporary side-menu
  states.

Bad:
- Build a sidebar from loose rectangles, text, and icons while hiding the real
  Menu shell.
- Replace menu rows with custom button drawings when the existing menu row
  stack already uses Item instances.
- Detach the toolbar title from the menu shell.

Example:
- A tablet navigation rail or side drawer should start from `Menu / Split Pane`
  or `Menu / Side / Resting`, then update the toolbar title and nested menu
  items instead of rebuilding the shell.

## Toolbar And Navigation

Good:
- Use Toolbar instances for page titles, back/menu buttons, and action slots.
- Use Ionicons for toolbar actions.
- Put toolbar title text inside the toolbar content/title layer.

Bad:
- Place direct title text over a toolbar instance.
- Draw custom icon shapes when Ionicons provides the action.

Example:
- A mobile detail page should use a Toolbar with a back icon, title, and action
  icons in toolbar slots instead of separate page-level primitives.
- The live toolbar examples include standard, menu-button, and back-button
  branches such as `12995:2912`, `12995:2857`, and `12995:2876`.

## Breadcrumbs

Good:
- Use Breadcrumb components for desktop or complex-detail navigation history.
- Build breadcrumb trails with multiple live breadcrumb instances in auto-
  layout.
- Use the active breadcrumb state for the current location so the separator
  disappears by default.

Bad:
- Turn breadcrumb history into custom slash-separated text links.
- Use breadcrumbs when the page header toolbar already provides the better
  navigation affordance.

Example:
- The live breadcrumb page includes a richer collapsed/custom-separator family
  and a simpler active/disabled family. Use the richer set when you need
  collapsed history or a custom separator.

## Segments And Tabs

Good:
- Use Segment and Segment Button instances for mode switching.
- Put labels inside the Segment Button label layers and use the active variant
  for current state.
- Use Tabs and Tabs / Button for persistent navigation, not as a segment substitute.
- Keep the Tabs shell and Tabs / Button instances paired, with the icon layout chosen to match the page's top or bottom tab style.
- Select the live Segment branch that matches the content pattern: text only,
  icon only, text+icon top/bottom, or text+icon start/end.
- Keep the indicator inside the live segment button and use the active/inactive
  button variants rather than recoloring loose text.
- Use the shadow variants only when the page already uses the elevated segment
  surface shown in the kit.

Bad:
- Draw custom segmented pills with hidden segment instances.
- Use large buttons where existing pages use segment controls for peer views.
- Mix icon order manually; use the start/end/top/bottom branches instead.
- Use custom footer navigation where the live Tabs component already matches the pattern.

Example:
- A view screen switching between `Tasks`, `Materials`, and `Activity` should
  use Segment Button instances for each label.
