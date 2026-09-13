# Personal Persona & Preferences

## Precedence

* An explicit request in the conversation overrides everything below.
* Project conventions - project CLAUDE.md files, established repository
  conventions and surrounding code - override these preferences.
* Tooling configuration - lint, formatter, compiler and package configuration -
  is authoritative for the behaviour it actually enforces.
* Where tooling and documented conventions disagree, follow the tooling for
  automated checks and report the inconsistency rather than silently working
  around it.
* Tooling is not beyond question. Where an enforced rule is demonstrably
  incorrect for the project's requirements - not merely inconvenient - say so
  and propose loosening it in the shared config. Do not reach for an inline
  suppression merely to bypass tooling errors.
* Coding, TypeScript, React, Next.js, Testing, Documentation, Dependencies, File
  Structure and Cloud are defaults; apply judgement. **Communication,
  Verification and Version Control are not defaults - follow them as written.**

## Communication

* **Tone:** Concise, direct, technical. No conversational filler, no generic
  greetings, no restating the question back to me.
* **Structure:** Direct answer or fixed code block first, explanation after.
* **Level:** Assume I am a senior engineer. Do not explain basic syntax.
* **Language:** English (AU) - British/Australian spelling (colour, optimised)
  in prose and comments. Follow the platform in code where it disagrees
  (`color`, `initialize`).
* **Ask vs proceed:** Make routine judgement calls yourself and state important
  assumptions. Ask only when two readings lead to materially different work, or
  when the action is hard to reverse.

## Coding

* Prioritise simple, readable, maintainable solutions. Do not add an
  abstraction, dependency, layer or pattern unless you can name the concrete
  benefit.
* Do not modify unrelated code, expand scope, or perform opportunistic
  refactors. Change generated files, configuration or dependencies only when the
  requested change requires it.
* Preserve existing behaviour unless the requested change requires otherwise.
* Prefer small, pure functions and modules of functions over classes;
  composition over inheritance. Avoid mutating inputs or shared state unless
  mutation is required by the API. Inject dependencies as arguments (or props in
  React) rather than reaching for module-level imports.
* Centralise environment-variable loading in one module. Validate untrusted
  external data at runtime.
* Descriptive names and early returns over nested conditionals.
* Model expected failures explicitly, preferably with a `Result`-style type.
  Reserve exceptions for genuinely exceptional conditions or APIs whose contract
  requires them.

## TypeScript

* `type` aliases by default. `interface` only for declaration merging or where a
  library/framework requires it.
* No `any`. Use a real type, or `unknown` at a boundary.
* Prefer narrowing and validation over type assertions.
* Use patterns such as discriminated unions rather than broad, unstructured
  types.
* `const` and immutable transformations.
* Inline exports (`export const ...`) over trailing export blocks, unless the
  repo's lint config requires otherwise.

## React

* Functional components and hooks. Class components only where an existing API
  requires one.
* Extract a hook or child component when the logic has a second call site, or
  when the file has stopped being scannable - not on principle.

## Next.js

* App Router, Server Components by default. `'use client'` only for
  interactivity, hooks, browser APIs or client-side state.

## Testing

* No trivial coverage tests. No assertions on implementation details.
* Assert exact values where they are part of the contract; otherwise assert
  observable behaviour.
* Structure tests as setup, action, assertion (given-when-then).
* `it.each` (Vitest/Jest) for parameterised cases, unless it forces conditional
  assertions inside the test body.
* No non-deterministic tests, no arbitrary sleeps.

## Verification

* Verify with the project's own tooling where practical - typecheck, lint,
  tests, build - rather than asserting the change looks correct.
* Where a repo has pre-existing failures, distinguish them from regressions
  introduced by the change. Do not alter or stash pre-existing working-tree
  changes merely to perform verification.
* Do not install browser tooling, start dev servers or drive the app unless
  asked.
* Report failures with the output. State plainly what you skipped.

## Documentation

* JSDoc/TSDoc on exported code **where complexity warrants it** - not on every
  export.
* No comments explaining historical changes, fixes, defects or previous
  behaviour.
* Survival test: would this comment still help someone reading the file in a
  year with no knowledge of its history? If not, delete it.

## Dependencies

* Prefer existing dependencies or native platform APIs.
* Use the repo's package manager - check the lockfile. Never introduce a second
  one.
* Before adding a dependency, check its maintenance status and security
  advisories.
* Before upgrading, check compatibility, breaking changes and security
  advisories.

## File Structure

* Organise by feature/domain.
* No barrel files unless they form a real public API boundary.
* Add a subdirectory (schema, services, utils, hooks, components) when the flat
  folder has stopped being scannable - not to match a template.
* Shared logic belongs at the lowest common domain boundary. `src/utils` is for
  genuinely domain-independent helpers only.

## Version Control

* Do not commit or push unless explicitly asked.
* Do not modify, reset, discard or stage pre-existing working-tree changes.
* Do not touch git config, hooks or repository metadata.
* Commit messages: Conventional Commits, unless the repository establishes
  another convention.

## Cloud

* Prefer serverless and managed services, managed databases included, over
  self-managed infrastructure. Name the reason when choosing a container or VM
  instead: long-running or stateful work, sustained throughput where per-request
  pricing loses, or a platform limit the workload cannot live within.
* Consider event-driven designs where the coupling is genuinely asynchronous.
* Apply least-privilege access controls: use resource-level permissions where
  supported; use wildcards only where the service or action requires them.
