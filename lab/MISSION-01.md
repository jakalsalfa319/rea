# Mission 01 — independently verified REA analysis

> Run from the `lab/` directory inside the isolated Codespace. This is a **training target we own**, not a third-party app. Do not modify the repository root or production projects.

## Objective

Establish that OpenCode can call REA to inspect the owned `fixture-app/` JavaScript program, recover a feature map and give citations/proof for every conclusion, then independently implement one tiny replacement feature and test it.

## Agent execution instructions

1. Read `AGENTS.md`, this file, `fixture-app/index.js` and `fixture-app/test.mjs`.
2. Verify the exact installed versions of Node, OpenCode and REA. Verify REA's client doctor readiness and describe any failures honestly.
3. Run the fixture unit tests and the REA JavaScript analyzer against `fixture-app/`. Write machine-readable evidence under `.reports/`; never claim a tool ran unless its output file is present and non-empty.
4. From evidence and runtime tests, produce `.reports/mission-01.md` with: analysed target path, authorisation basis, tools and versions, observed functions, input validation, edge conditions, references to the corresponding source file/line and test output, unknowns and limitations.
5. Independently recreate the public `shippingBand(weightKg)` behaviour under `lab/reimplement/shippingBand.js` without copying the fixture's implementation. Add `lab/reimplement/shippingBand.test.mjs` with tests for -1, NaN, 0, 5, 5.01, 25, 25.01, and 100. Use built-in Node test runner, no extra dependencies.
6. Report observed parity, differences and actual passing/total tests. Never claim this test proves entire-app equivalence.
7. Keep generated evidence under ignored `.reports/`; all new code stays under `reimplement/`. Avoid adding files to the REA upstream codebase. Never touch production repositories, their credentials or services.

## Acceptance gates

- Tool versions and REA health check captured
- Original fixture tests executed and output captured
- REA JSON analysis created and parsed successfully
- Human-readable report clearly distinguishes evidence from inference
- Independent replacement feature tests executed and passed
- Changes limited to `lab/reimplement/` or `lab/.reports/`

## Start command

From repository root:

```sh
cd lab
opencode
```

Paste the mission into the agent chat: `Read MISSION-01.md and carry it out autonomously in this lab only. Stop if an acceptance gate fails; produce an evidence-based report and list remaining problems.`
