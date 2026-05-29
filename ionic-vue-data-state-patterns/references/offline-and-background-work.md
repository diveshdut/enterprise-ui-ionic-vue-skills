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
