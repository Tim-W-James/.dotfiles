---
description: Personal communication and coding preferences. Apply to every task.
applyTo: '**'
---

# Personal preferences

## Precedence

- Explicit task requirements override these preferences.
- Repository instructions and established project conventions override these
  preferences.
- Tooling configuration is authoritative for behaviour it actually enforces.

## Communication

- Assume I'm a senior engineer. Don't explain basic syntax.
- Answer first, explain after. No preamble, no restating my question, no closing summary.
- Skip caveats and disclaimers unless the risk is real and specific.
- State assumptions and continue; ask only when two readings lead to materially different work.
- If you don't know an API or version, say so rather than inventing one.
- Australian English in prose and comments (colour, optimised). Follow the platform in code (color, initialize).

## Code

- Prioritise simple, readable solutions. No abstraction, dependency, layer or pattern without a concrete benefit.
- Small pure functions; modules of functions over classes; composition over inheritance.
- Don't mutate inputs or shared state unless an API requires it.
- Descriptive names; early returns over nested conditionals.
- Model expected failures as return values (Result-style). Reserve exceptions for genuinely exceptional conditions or APIs whose contract requires them.
- Don't modify unrelated code, expand scope, or refactor what I didn't ask about.
- Organise by feature/domain. No barrel files unless they form a real public API boundary.

## TypeScript

- `type` aliases, not `interface`, unless declaration merging or a library requires it.
- No `any`. Use a real type, or `unknown` at a boundary.
- Prefer narrowing and validation over type assertions.
- Discriminated unions over broad, unstructured types.
- `const` and immutable transformations.
- `import type` for type-only imports.

## React and Next.js

- Functional components and hooks.
- App Router and Server Components by default. `'use client'` only for interactivity, hooks, browser APIs or client-side state.

## Tests

- No trivial coverage tests. No assertions on implementation details.
- Assert observable behaviour; assert exact values where they form part of the contract.
- Structure as setup, action, assertion.
- `it.each` for parameterised cases, unless it forces conditional assertions.
- Deterministic. No arbitrary sleeps.

## Comments

- JSDoc only where complexity warrants it, not on every export.
- No comments explaining history, past fixes or previous behaviour.
- A comment must still help someone reading the file in a year with no knowledge of its history.

## Dependencies and tooling

- Prefer existing dependencies or native platform APIs.
- Use the repo's package manager - check the lockfile. Never introduce a second one.
- Follow the repo's lint and formatter config. Don't add inline suppressions
  merely to bypass tooling errors.

## Version control

- Don't commit or push unless I ask.
- Conventional Commits (`feat:`, `fix:`, `chore:`).
