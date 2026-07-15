# Date And Datetime Examples

Load this reference before changing date-only fields, date-time fields,
`ion-datetime` behavior, display formatting, or API conversion logic.

## Goal

Treat date-only values, date-time values, display formatting, and API payload
formatting as separate concerns.

## Value Contract Pattern

Keep form state in user-facing local values, then convert to backend-required
formats in shared helpers or at the API boundary.

```ts
type LocalDateValue = string
type LocalDateTimeValue = string

const form = reactive({
  dueDate: '' as LocalDateValue | '',
  plannedStartDateTime: '' as LocalDateTimeValue | '',
})
```

Use distinct field contracts when one input is date-only and another is a true
date-time value.

## Date-Only Picker Example

```vue
<ion-item>
  <ion-label position="stacked">Due date</ion-label>
  <ion-datetime
    v-model="form.dueDate"
    presentation="date"
    prefer-wheel="true"
  />
</ion-item>
```

## Date-Time Picker Example

```vue
<ion-item>
  <ion-label position="stacked">Planned start</ion-label>
  <ion-datetime
    v-model="form.plannedStartDateTime"
    presentation="date-time"
    :show-default-buttons="true"
  />
</ion-item>
```

Be explicit about whether the picker is inline or modal and whether users must
confirm or cancel the selection.

## API Boundary Example

```ts
const payload = {
  dueDate: form.dueDate ? formatDateForApi(form.dueDate) : undefined,
  plannedStartDateTime: form.plannedStartDateTime
    ? formatLocalDateTimeForApi(form.plannedStartDateTime, facilityTimeZone)
    : undefined,
}
```

Keep display helpers separate from submission helpers:

```ts
const dueDateLabel = computed(() =>
  form.dueDate ? formatDateForDisplay(form.dueDate) : 'Select date'
)
```

## End-To-End Contract Example

Use one explicit contract per field type so local UI state, display state, and
API state do not collapse into the same value.

```ts
const form = reactive({
  dueDate: '2026-07-15',
  plannedStartDateTime: '2026-07-15T09:30',
})

const display = {
  dueDate: formatDateForDisplay(form.dueDate),
  plannedStartDateTime: formatDateTimeForDisplay(
    form.plannedStartDateTime,
    facilityTimeZone
  ),
}

const payload = {
  dueDate: formatDateForApi(form.dueDate),
  plannedStartDateTime: formatLocalDateTimeForApi(
    form.plannedStartDateTime,
    facilityTimeZone
  ),
}
```

Representative distinction:

- Local date-only UI value: `'2026-07-15'`
- Display date-only value: `'Jul 15, 2026'`
- API date-only value: `'2026-07-15'`
- Local date-time UI value: `'2026-07-15T09:30'`
- Display date-time value: `'Jul 15, 2026, 9:30 AM'`
- API date-time value: `'2026-07-15 09:30:00.0'`

The date-only field can often share the same local and API shape, while the
date-time field usually cannot. Keep both contracts explicit anyway so display
formatting and backend formatting stay out of page templates.

## Rules

- Use `ion-datetime` for date and date-time picking instead of substituting
  `ion-select`.
- Do not reuse the same helper blindly for date-only and date-time fields.
- Do not scatter ad hoc parsing or formatting snippets through page files.
- Keep timezone-sensitive logic in shared helpers, not in templates.

## Avoid

- `new Date(...)` or `.toISOString()` scattered across pages and components.
- String slicing shortcuts reused for multiple backend contracts.
- Ambiguous picker defaults, unclear local-time expectations, or hidden confirm
  behavior.
