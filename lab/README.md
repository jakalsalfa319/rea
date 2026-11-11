# Isolated REA + OpenCode Codespaces lab

**Status:** repository configuration only; a Codespace has not been started or tested until its `postCreateCommand` and `bash lab/smoke.sh` have run successfully.

This research branch lives in `jakalsalfa319/rea` and does **not** change any MINT WORLD or TREKT deployment or main branch. The container is disposable; do not upload private binaries, client data or secrets. GitHub Codespaces may consume a limited free quota or incur charges depending on your plan.

## Launch from iPad

1. Open the **rea** repository in GitHub and select branch `lab/rea-opencode-codespaces-20261111`.
2. Choose **Code → Codespaces → Create codespace on this branch**. This launches a Linux devcontainer with Node 24, then runs `lab/bootstrap.sh` to install the published OpenCode CLI and REA 6.7.0 from npm.
3. When the terminal is ready, review `lab/.reports/rea-setup-plan.json`. This is a **dry run**; it has not registered REA with OpenCode.
4. If the plan is acceptable, run `rea setup --client opencode`, review and approve REA's changes. Restart OpenCode afterwards.
5. Run `bash lab/smoke.sh`. It checks tool versions, tests the owned JavaScript demo, runs REA's static JavaScript analysis and checks MCP client readiness. Inspect `lab/.reports/*.json` to verify the evidence.
6. Start `opencode` and connect a model/provider through its supported configuration. Free cloud model availability, daily limits, privacy and billing vary; no provider credentials are preconfigured.

## Evidence and permissions

The sample application in `fixture-app/` is original to this lab and uses no outside dependencies. Only test approved targets; inspection or decompilation does not transfer ownership or licensing rights. For learning, prioritise public documentation, open-source code and authorised demos. REA may not support every application format. This setup starts with **static JavaScript analysis only**—Ghidra and other optional native providers are intentionally not installed.

The isolated `lab/AGENTS.md` defines verification, permission, confidentiality and no-production-modification requirements. All reports are ignored by Git. No secrets or tokens belong in the repository.

## Links

- REA: https://github.com/morluto/rea
- OpenCode: https://opencode.ai/docs
- REA setup/requirements: https://github.com/morluto/rea/blob/main/docs/installation.md
