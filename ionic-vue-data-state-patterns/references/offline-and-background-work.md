# Offline And Background Work

## Offline And Device Workflows

Use offline/local persistence only when physical work must continue through
network interruption, device ownership, session locking, queued events or
later synchronization. Inventory Count demonstrates this need with local
session/event storage and device-aware execution.

Do not add a local database or synchronization layer to ordinary read/write
administrative views merely because an operational app uses one.

## Background Processing

Use explicit job or polling state where user actions run asynchronously, such
as preorder releases or routing execution. Communicate queued, running,
successful and failed states without making the user infer progress.

Scheduling views should surface the next execution, active/draft or paused
state, run history and controlled immediate execution when supported.

## Test And Simulation State

Order Routing demonstrates a test-drive workflow that selects a real order,
evaluates routes/rules and may allocate inventory. For similar behavior:

- Make test mode explicit.
- Preserve session state deliberately.
- Explain operational side effects.
- Require reset or cleanup before exit where test execution mutates data.

## Playwright And Backend-Integrated Stability

- Do not assume mutable demo data is safe to share across tests.
- Prefer explicit setup/reset, unique fixture records, or serialized execution
  when flows create, update, or allocate real backend entities.
- If one verification step mutates the same backend state another test relies
  on, run those checks in sequence and document the dependency.
- Keep E2E assertions resilient to legitimate backend timing while still
  proving the intended state transition happened.
- In repeated lists, give Playwright stable business-aware `data-testid`
  anchors so tests can act on the intended row even when the same product,
  task, or label appears more than once.
